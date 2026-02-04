<?php





function getPDO(): PDO
{
    $host = "localhost";
    $db   = "sellular_shop";
    $user = "admin";
    $pass = "String123++";

    return new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
}



/**
 * Установить или обновить пароль сотрудника
 *
 * @param PDO $pdo
 * @param int $employeeId
 * @param string|null $password  // Если null, используем email до @
 * @param bool $generateRandom  // Если true, генерируем случайный пароль
 * @return string $plainPassword — пароль, который был установлен
 */
function setEmployeePassword(PDO $pdo, int $employeeId, ?string $password = null, bool $generateRandom = false): string {
    // Получаем email сотрудника
    $stmt = $pdo->prepare("SELECT email FROM employees WHERE employee_id = ?");
    $stmt->execute([$employeeId]);
    $employee = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$employee) {
        throw new Exception("Сотрудник с ID $employeeId не найден");
    }

    $email = $employee['email'];

    // Если нужно генерировать случайный пароль
    if ($generateRandom) {
        $plainPassword = substr(str_shuffle('ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz23456789'), 0, 10);
    } 
    // Если пароль не передан — используем email до @
    else if (!$password) {
        $plainPassword = substr($email, 0, strpos($email, '@'));
    } 
    // Если пароль передан администратором
    else {
        $plainPassword = $password;
    }

    // Создаем хэш
    $passwordHash = password_hash($plainPassword, PASSWORD_DEFAULT);

    // Обновляем таблицу
    $update = $pdo->prepare("UPDATE employees SET password_hash = ? WHERE employee_id = ?");
    $update->execute([$passwordHash, $employeeId]);

    return $plainPassword; // Можно показать администратору один раз
}