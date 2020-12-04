<?php
require './connect.php';

$query = 'SELECT * FROM tbl_projects';

$stmt = $pdo->prepare($query);

$stmt->execute();

$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($results);


