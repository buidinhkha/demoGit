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
        //Refer to database 
        $db = parse_url(getenv("DATABASE_URL"));
        $pdo = new PDO("pgsql:" . sprintf(
            "host=%s;port=%s;user=%s;password=%s;dbname=%s",
            $db["host"],
            $db["port"],
            $db["user"],
            $db["pass"],
            ltrim($db["path"], "/")
        ));    
        $sql = "select * from product";
        //compile the sql
        $stmt = $pdo->prepare($sql);
        //execute the query on the server and return the result set
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt->execute();
        $resultSet = $stmt->fetchAll();
    ?>
<table style="width:100%", border="5px">

         <tr>
    <th>name</th>
    <th>price</th>
  </tr>

  <tr>

    <td> 
    <?php
            foreach ($resultSet as $row) {
                echo "<li>" .
                    $row["name"]
                . "</li>";
            }
        ?>
    </td>

     <td> 
         <?php
            foreach ($resultSet as $row) {
                echo "<li>" .
                     $row["price"]
                . "</li>";
            }
        ?>

    </td>
  </tr>

</table>

</body>
</html>
