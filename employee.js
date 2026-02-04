const allowedTables = [
    'category',
    'clients',
    'contracts',
    'products',
    'services',
    'sales',
    'sale_items'
];

const tableLabels = {
    category: 'Категории',
    clients: 'Клиенты',
    contracts: 'Договоры',
    products: 'Товары',
    services: 'Услуги',
    sales: 'Sales',
    sale_items: 'Sale items'
};

const blockedProcedurePatterns = [
    'add_employee',
    'employee_add',
    'добавить_работника',
    'change_service_tariff',
    'update_service_tariff',
    'изменить_тариф_услуги',
    'change_product_price',
    'update_product_price',
    'изменить_цену_товара'
];

let availableProcedures = [];
let procedureParams = {};
let currentView = 'products';

function normalizeName(name) {
    return name.toLowerCase().replace(/\s+/g, '_');
}

function isBlockedProcedure(name) {
    const normalized = normalizeName(name);
    return blockedProcedurePatterns.some(pattern => normalized.includes(pattern));
}

function loadMetadata() {
    return fetch('get_view.php?list=1')
        .then(response => response.json())
        .then(data => {
            availableProcedures = (data.procedures || []).filter(proc => !isBlockedProcedure(proc));
            procedureParams = data.procedureParams || {};
        });
}

// Подгрузка таблиц
function loadView(view) {
    if (!view || !allowedTables.includes(view)) return;
    currentView = view;

    fetch(`get_view.php?view=${view}`)
        .then(r => r.json())
        .then(data => {
            const table = document.getElementById('dataTable');
            const title = document.getElementById('table-title');
            title.textContent = tableLabels[view] || view.replace(/_/g,' ').toUpperCase();

            const thead = table.createTHead();
            thead.innerHTML = '';
            const tbody = table.createTBody();
            tbody.innerHTML = '';

            if (!data.length) {
                renderProcedureControls();
                return;
            }

            // Заголовки
            const trHead = document.createElement('tr');
            Object.keys(data[0]).forEach(col => {
                const th = document.createElement('th');
                th.textContent = col;
                trHead.appendChild(th);
            });
            thead.appendChild(trHead);

            // Данные
            data.forEach(row => {
                const tr = document.createElement('tr');
                Object.values(row).forEach(val => {
                    const td = document.createElement('td');
                    td.textContent = val;
                    tr.appendChild(td);
                });
                tbody.appendChild(tr);
            });

            renderProcedureControls();
        });
}

function createInputForParam(param) {
    const input = document.createElement('input');
    input.type = 'text';
    input.name = param.name;
    input.placeholder = `${param.name} (${param.type})`;
    return input;
}

function renderProcedureControls() {
    const container = document.getElementById('procedure-controls');
    container.innerHTML = '';

    if (!availableProcedures.length) {
        return;
    }

    const title = document.createElement('h3');
    title.textContent = 'Процедуры';
    container.appendChild(title);

    availableProcedures.forEach(proc => {
        const form = document.createElement('form');
        form.className = 'procedure-form';
        form.dataset.procedure = proc;

        const label = document.createElement('div');
        label.className = 'procedure-name';
        label.textContent = proc;
        form.appendChild(label);

        const params = (procedureParams[proc] || []).filter(param => param.mode !== 'OUT');
        if (params.length) {
            params.forEach(param => {
                form.appendChild(createInputForParam(param));
            });
        }

        const button = document.createElement('button');
        button.type = 'submit';
        button.textContent = 'Выполнить';
        form.appendChild(button);

        form.addEventListener('submit', event => {
            event.preventDefault();
            const formData = new FormData(form);
            const payload = {
                procedure: proc,
                params: Object.fromEntries(formData.entries())
            };

            fetch('get_view.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(payload)
            })
                .then(response => response.json())
                .then(() => {
                    loadView(currentView);
                });
        });

        container.appendChild(form);
    });
}

// Загружаем таблицу "Товары" по умолчанию
document.addEventListener('DOMContentLoaded', () => {
    loadMetadata().then(() => loadView(currentView));
});
document.addEventListener('DOMContentLoaded', () => {
    document
        .querySelectorAll('#table-buttons button[data-view]')
        .forEach(button => {
            button.addEventListener('click', () => {
                loadView(button.dataset.view);
            });
        });
});
