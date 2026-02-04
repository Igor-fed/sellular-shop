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
       
            </select>
        </div>
        <div class="login-link">
            <a class="main-button" href="index.php">Выйти</a>
        </div>
    </div>
</header>

<main class="arm-container">
    <div class="sidebar" id="table-buttons">
<button data-view="category">Категории</button>
<button data-view="clients">Клиенты</button>
<button data-view="contracts">Договоры</button>
<button data-view="products">Товары</button>
<button data-view="services">Услуги</button>
<button data-view="sales">Продажи</button>
<button data-view="sale_items">Позиции продаж</button>

    </div>

    <div class="content">
        <h2 id="table-title">Товары</h2>
        <table class="data-table" id="dataTable"></table>
        <div id="procedure-controls" class="procedure-controls"></div>
    </div>
</main>

<script src="js/employee.js"></script>
</body>
</html>
