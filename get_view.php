<?php
require_once 'db.php';
$pdo = getPDO();

$allowed = [
    'clients',
    'products',
    'services',
    'vw_sales_products',
    'vw_sales_services',
    'vw_report'
];

$view = $_GET['view'] ?? '';

if (!in_array($view, $allowed)) {
    http_response_code(403);
    exit;
}

$stmt = $pdo->query("SELECT * FROM `$view`");
echo json_encode($stmt->fetchAll());
