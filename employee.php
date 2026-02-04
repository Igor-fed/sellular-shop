<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Рабочее место сотрудника</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="nav">
        <div class="language">
            <select>
                <option value="ru" selected>RU</option>
                <option value="en">EN</option>
            </select>
        </div>
        <div class="login-link">
            <a href="index.php">Выйти</a>
        </div>
    </div>
</header>

<main class="arm-container">
    <div class="sidebar">
        <button onclick="loadView('products')">Товары</button>
        <button onclick="loadView('services')">Услуги</button>
        <button onclick="loadView('clients')">Клиенты</button>
        <button onclick="loadView('vw_sales_products')">Продажи товаров</button>
        <button onclick="loadView('vw_sales_services')">Продажи услуг</button>
        <button onclick="loadView('vw_report')">Отчёт</button>
    </div>

    <div class="content">
        <h2 id="table-title">Товары</h2>
        <table class="data-table" id="dataTable"></table>
    </div>
</main>

<script src="js/employee.js"></script>
</body>
</html>
