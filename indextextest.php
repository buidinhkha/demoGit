<?php 
require_once("funtion.php");
$db = parse_url($DATABASE_URL);
	
		
			$sqlx = "SELECT * from product where productid=10";
            $producttable = query($sqlx);

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