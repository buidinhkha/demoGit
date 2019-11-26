<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<?php
$db = parse_url(getenv("DATABASE_URL"));

$pdo = new PDO("pgsql:" . sprintf(
    "host=%s;port=%s;user=%s;password=%s;dbname=%s",
    $db["host"],
    $db["port"],
    $db["user"],
    $db["pass"],
    ltrim($db["path"], "/")
));
// viet cau lenh
$sql = "select * from product"
// trinh bien dich
$stmt = $pdo->prepare($sql);
// thuc thi cau lenh
$stmt->setFetchMode(PDO::FETCH_ASSOC);
$stmt->execute();
// tra ve ket qua
$resultSet = $stmt->fetchAll();
?>
<un>
<?php

?>
</ul>
    
</body>
</html>