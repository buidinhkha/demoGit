<?php session_start();
require_once("./funtion.php");
?>
<!DOCTYPE html>
<html>
<head>
	<title>home</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<?php 
	require_once("./Header.php");	
 ?>
<div class="middle">
	<div class="menu">
		<ul>
			<li class="badge badge-secondary">Categories</li>
			<li class="badge badge-info"><a href="./index.php?catid=1">Dolls</a></li>
			<li class="badge badge-info"><a href="./index.php?catid=2">Puzzle</a></li>
			<li class="badge badge-info"><a href="./index.php?catid=3">Videogames</a></li>
			<li class="badge badge-info"><a href="./index.php?catid=4">Educational</a></li>
			<li class="badge badge-info"><a href="./index.php?catid=5">Cards</a></li>
			<li class="badge badge-info"><a href="./index.php?catid=6">Vehicle</a></li>
			<li class="badge badge-info"><a href="./index.php?catid=7">ToyGuns</a></li>
		</ul>
	</div>
	<div class="rowss">
	<?php
	require_once("funtion.php");
	if(isset($_GET['catid']))
	{
		$cid=$_GET['catid'];
		$sql = "select * from product where CatId=$cid order by productid";
	 	$producttable=query($sql);

		if (isset($_GET['pageid'])) 
		{
			$id=($_GET['pageid']-1)*20;
		}	
		else
		{
			$id=0;
		}
		for($i=0;($i<count($producttable)-$id)and $i<20;$i++)
		{
	?>
		<div class="col">
			<a href="./product.php?proid=<?=$producttable[$i+$id][0]?>">
				<div class="productid">ID:<?=$producttable[$i+$id][0]?></div>
				<div class="productname"><?=$producttable[$i+$id][1]?></div>
				<div class="productimg"><img src="<?=$producttable[$i+$id][2]?>"></div>
				<div class="productprice">Price:<?=$producttable[$i+$id][3]?></div>
			</a>
			
		</div>
	<?php 
		}
	
	}
	elseif (isset($_GET['search'])) 
	{
		$search=$_GET['search'];
		$sql = "select * from product where productname like '%$search%' order by productid";
	 	$producttable=query($sql);
	 	if (isset($_GET['pageid'])) 
		{
			$id=($_GET['pageid']-1)*20;
		}	
		else
		{
			$id=0;
		} 
		for($i=0;($i<count($producttable)-$id)and $i<20;$i++)
		{
	?>
		<div class="col">
			<a href="./product.php?proid=<?=$producttable[$i+$id][0]?>">
				<div class="productid">ID:<?=$producttable[$i+$id][0]?></div>
				<div class="productname"><?=$producttable[$i+$id][1]?></div>
				<div class="productimg"><img src="<?=$producttable[$i+$id][2]?>"></div>
				<div class="productprice">Price:<?=$producttable[$i+$id][3]?></div>
			</a>
		</div>
	<?php 
		}	
	}	
	else
	{
		$sql = "select * from product order by productid";
	 	$producttable=query($sql);
	 	if (isset($_GET['pageid'])) 
		{
			$id=($_GET['pageid']-1)*20;
		}	
		else
		{
			$id=0;
		} 
		for($i=0;($i<count($producttable)-$id)and $i<20;$i++)
		{
	?>
		<div class="col">
			<a href="./product.php?proid=<?=$producttable[$i+$id][0]?>">
				<div class="productid">ID:<?=$producttable[$i+$id][0]?></div>
				<div class="productname"><?=$producttable[$i+$id][1]?></div>
				<div class="productimg"><img src="<?=$producttable[$i+$id][2]?>"></div>
				<div class="productprice">Price:<?=$producttable[$i+$id][3]?></div>
			</a>
		</div>
	<?php 
		}	
	}
	
	 ?>	
	
	</div>

	<ul class="pagination justify-content-center" style="margin:20px 0; clear: left;">
		<?php 
			for($z=0;$z<count($producttable)/20;$z++)
			{
		?>
		<li class="page-item"><a class="page-link" href="<?=$_SERVER['PHP_SELF']?>?<?=$_SERVER['QUERY_STRING']?>&pageid=<?=$z+1?>"><?=$z+1?></a></li>
		<?php		
			}
		 ?>
	    
	</ul>

</div>
<?php 
	require_once("./bottom.php")
 ?>
</body>
</html>