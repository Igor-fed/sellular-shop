<?php
session_start();
require_once 'db.php';

$pdo = getPDO();
$first = setEmployeePassword($pdo,2,'12345678');
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $login    = trim($_POST['login'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($login === '' || $password === '') {
        $error = "Введите логин и пароль";
    } else {

        $stmt = $pdo->prepare("
            SELECT 
                employee_id,
                last_name,
                first_name,
                position,
                password_hash
            FROM employees
            WHERE login = ?
              AND is_active = 1
        ");

        $stmt->execute([$login]);
        $employee = $stmt->fetch();

        if ($employee && password_verify($password, $employee['password_hash'])) {

            // Сессия
            $_SESSION['employee_id'] = $employee['employee_id'];
            $_SESSION['full_name']   = $employee['last_name'] . ' ' . $employee['first_name'];
            $_SESSION['position']    = $employee['position'];

            // Редирект по роли
            if ($employee['position'] === 'Администратор') {
                header('Location: admin_panel.php');
            } else {
                header('Location: employee.php');
            }
            exit;

        } else {
            $error = "Неверный логин или пароль";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Вход сотрудника</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<main class="login-container">
    <h2>Вход сотрудника</h2>

    <?php if ($error): ?>
        <div class="error"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <form method="post" class="login-form">
        <input type="text" name="login" placeholder="Логин" required>
        <input type="password" name="password" placeholder="Пароль" required>

        <button type="submit">Войти</button>
    </form>
</main>

</body>
</html>
