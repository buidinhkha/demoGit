<?php 
	$DATABASE="postgres://rxfjbfsqrsviad:9b3a58af90e2f26e82fc091368331f6fc804bf01febdb080b1b21f392c88544a@ec2-54-225-205-79.compute-1.amazonaws.com:5432/dd973qr28s5tg0"
	function query($sql)
	{
		$db = parse_url($DATABASE_URL);//get environment variable
	
			$pdo = new PDO("pgsql:" . sprintf(
			    "host=%s;port=%s;user=%s;password=%s;dbname=%s",
			    $db["host"],
			    $db["port"],
			    $db["user"],
			    $db["pass"],
			    ltrim($db["path"], "/")
											)
						);
			$stmt1= $pdo->prepare($sql);
            $stmt1->execute();
            $result =$stmt1->fetchAll();
            return $result;
	}

	function insert($sql)
	{
		$db = parse_url($DATABASE);
	
	$pdo = new PDO("pgsql:" . sprintf(
	    "host=%s;port=%s;user=%s;password=%s;dbname=%s",
	    $db["host"],
	    $db["port"],
	    $db["user"],
	    $db["pass"],
	    ltrim($db["path"], "/")
									)
				);
		$stmt= $pdo->prepare($sql);
		$stmt->execute();
	}
	function update($sql)
	{
		$db = parse_url($DATABASE);
	
	$pdo = new PDO("pgsql:" . sprintf(
	    "host=%s;port=%s;user=%s;password=%s;dbname=%s",
	    $db["host"],
	    $db["port"],
	    $db["user"],
	    $db["pass"],
	    ltrim($db["path"], "/")
									)
				);
		$stmt= $pdo->prepare($sql);
		$stmt->execute();
		
	}
	function delete($sql)
	{
		$db = parse_url($DATABASE);
	
	$pdo = new PDO("pgsql:" . sprintf(
	    "host=%s;port=%s;user=%s;password=%s;dbname=%s",
	    $db["host"],
	    $db["port"],
	    $db["user"],
	    $db["pass"],
	    ltrim($db["path"], "/")
									)
				);
		$stmt= $pdo->prepare($sql);
		$stmt->execute();
		
	}
		

	
?>