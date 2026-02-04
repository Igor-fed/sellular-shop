<?php
require_once 'db.php';
$pdo = getPDO();

$database = $pdo->query('SELECT DATABASE()')->fetchColumn();

$tables = [];
$views = [];
$procedures = [];
$procedureParams = [];

$stmt = $pdo->prepare('SELECT table_name, table_type FROM information_schema.tables WHERE table_schema = :db');
$stmt->execute(['db' => $database]);
foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
    if ($row['table_type'] === 'BASE TABLE') {
        $tables[] = $row['table_name'];
    } elseif ($row['table_type'] === 'VIEW') {
        $views[] = $row['table_name'];
    }
}

$stmt = $pdo->prepare("SELECT routine_name FROM information_schema.routines WHERE routine_schema = :db AND routine_type = 'PROCEDURE'");
$stmt->execute(['db' => $database]);
$procedures = $stmt->fetchAll(PDO::FETCH_COLUMN);

$stmt = $pdo->prepare("SELECT specific_name, parameter_name, data_type, parameter_mode, ordinal_position
    FROM information_schema.parameters
    WHERE specific_schema = :db AND routine_type = 'PROCEDURE'
    ORDER BY specific_name, ordinal_position");
$stmt->execute(['db' => $database]);
foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
    if (!$row['parameter_name']) {
        continue;
    }

    $procedureParams[$row['specific_name']][] = [
        'name' => $row['parameter_name'],
        'type' => $row['data_type'],
        'mode' => $row['parameter_mode']
    ];
}

if (isset($_GET['list'])) {
    echo json_encode([
        'tables' => $tables,
        'views' => $views,
        'procedures' => $procedures,
        'procedureParams' => $procedureParams
    ]);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $payload = json_decode(file_get_contents('php://input'), true);
    $procedure = $payload['procedure'] ?? '';
    $params = $payload['params'] ?? [];

    if (!in_array($procedure, $procedures, true)) {
        http_response_code(403);
        exit;
    }

    $paramDefs = $procedureParams[$procedure] ?? [];
    $placeholders = [];
    $values = [];

    foreach ($paramDefs as $paramDef) {
        if (strtoupper($paramDef['mode']) === 'OUT') {
            continue;
        }

        $placeholders[] = '?';
        $values[] = $params[$paramDef['name']] ?? null;
    }

    $sql = sprintf('CALL `%s`(%s)', $procedure, implode(', ', $placeholders));
    $stmt = $pdo->prepare($sql);
    $stmt->execute($values);

    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode([
        'status' => 'ok',
        'data' => $result
    ]);
    exit;
}

$view = $_GET['view'] ?? '';
$allowedViews = array_merge($tables, $views);

if (!in_array($view, $allowedViews, true)) {
    http_response_code(403);
    exit;
}

$stmt = $pdo->query("SELECT * FROM `$view`");
echo json_encode($stmt->fetchAll());
