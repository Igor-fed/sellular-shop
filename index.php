<?php
// Определяем язык
$lang = $_GET['lang'] ?? 'ru';

$text = [
    'ru' => [
        'login' => 'Вход',
        'button_login' => 'Войти в систему',
        'info' => 'Автоматизированное рабочее место менеджера салона связи.',
        'footer_info' => 'Учебный проект. Все данные носят демонстрационный характер.'
    ],

];

// защита от некорректного языка
if (!isset($text[$lang])) {
    $lang = 'ru';
}
?>

<!DOCTYPE html>
<html lang="<?= $lang ?>">
<head>
    <meta charset="UTF-8">
    <title>Mobile Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <div class="nav">
        <div class="language">
            <form method="get">
                <select name="lang" onchange="this.form.submit()">
                    <option value="ru" <?= $lang === 'ru' ? 'selected' : '' ?>>Русский</option>
                  
                </select>
            </form>
        </div>

        <div class="login-link" type="button" onclick="window.location='login.php'">
            <?= $text[$lang]['login'] ?>
        </div>
    </div>
</header>

<main>
    <div class="slider">
  <img src="https://previews.123rf.com/images/rawpixel/rawpixel1705/rawpixel170506488/77268703-teamwork-cooperation-collaboration-team-building-icon.avif" class="active" alt="Smartphone">
    <img src="https://previews.123rf.com/images/rawpixel/rawpixel1609/rawpixel160965413/62829523-digital-media-connection-camera-icon-concept.avif" alt="Computer">
    <img src="https://as1.ftcdn.net/v2/jpg/02/10/57/08/1000_F_210570893_Cc8BXv4R7U8PQyFUX49MXg3YV8xELdVO.jpg" alt="Technology & Internet">
    <img src="https://as2.ftcdn.net/v2/jpg/06/58/74/69/1000_F_658746950_vJV7N8LC5pgxV7ZmjmWq9su5uO1ly3oX.jpg" alt="TV">
    </div>

    <p class="info-text"><?= $text[$lang]['info'] ?></p>

    <button  class="main-button" type="button" onclick="window.location='login.php'" >
        <?= $text[$lang]['button_login'] ?>
    </button>
</main>

<footer>
    <div class="footer-content">
        <div>
            <strong>Контакты</strong><br>
            📞 +375 29 935-93-39<br>
            ✉ <a href="mailto:gladovskij123@gmail.com">gladovskij123@gmail.com</a>
        </div>

        <div>
            <?= $text[$lang]['footer_info'] ?>
        </div>

        <div>
            © 2026 Mobile CRM
        </div>
    </div>
</footer>

<!-- JS -->
<script src="js/slider.js"></script>
</body>
</html>
