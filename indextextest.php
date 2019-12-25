<?php 
require_once("funtion.php");
$db = parse_url(getenv("DATABASE_URL"));
	
		
			$sqlx = "SELECT * from product where productid=10";
            $producttable = query($sqlx);
  //postgres://rxfjbfsqrsviad:9b3a58af90e2f26e82fc091368331f6fc804bf01febdb080b1b21f392c88544a@ec2-54-225-205-79.compute-1.amazonaws.com:5432/dd973qr28s5tg0//

 ?>
 <li><?=$producttable[0]?></li>
 <li><?=$producttable[1]?></li>
 <li><?=$producttable[2]?></li>
 <li><?=$producttable[10]?></li>
 <li><?=$producttable[0][0]?></li>
 <li><?=$producttable[0][1]?></li>
 <li><?=$producttable[1][0]?></li>
 <li><?=$producttable[1][1]?></li>
 <li><?=$producttable[2][0]?></li>
 <li><?=$producttable[2][1]?></li>
