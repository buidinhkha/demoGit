<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<h1 style="color: blue"; size=20 >Enter Your info </h1>
<br>
<input type="text"  id="school">
<br>
<input type="button" value="Ok" onclick="display()">

<script type="text/javascript">
	function display(){
		var name = document.getElementById('name').value;
		var school = document.getElementById('school').value;
		alert('welcome ' + name + ' from school ' + school);
	}
</script>
</body>
</html>