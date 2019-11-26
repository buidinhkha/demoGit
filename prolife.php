<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<h1 style="color: blue"; size=20 >Enter Your info </h1>

Name:   <input type="text"  id="name" >
<br>
School: <input type="text"  id="school">
<br>
<input type="button" value="Ok" onclick="display()">

<script type="text/javascript">
	function checkInput(){
         var name = document.getElementById('name').value;
         if (name.length < 5){
         	alert('name is less than 5 characters');
         }
		}
	function display(){
		checkInput();
		var name = document.getElementById('name').value;
		var school = document.getElementById('school').value;
		alert('welcome ' + name + ' from school ' + school);
	}
</script>
</body>
</html>