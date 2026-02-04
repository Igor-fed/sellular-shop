// Подгрузка таблиц
function loadView(view) {
    if (!view) return;

    fetch(`get_view.php?view=${view}`)
        .then(r => r.json())
        .then(data => {
            const table = document.getElementById('dataTable');
            const title = document.getElementById('table-title');
            title.textContent = view.replace(/_/g,' ').toUpperCase();

            const thead = table.createTHead();
            thead.innerHTML = '';
            const tbody = table.createTBody();
            tbody.innerHTML = '';

            if (!data.length) return;

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
        });
}

// Загружаем таблицу "Товары" по умолчанию
window.onload = () => loadView('products');
