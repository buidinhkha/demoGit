<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/cnn.asp"-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<META name="viewport" content="width=device-width">
<title>TNTT Shop - The Famous Technology</title>
<link rel="stylesheet" href="../css/csshome.css">
<link rel="shortcut icon" href="../Templates/mobilesmartphoneicon.ico">
<script type="text/javascript" src="../jquery/cursor.js"></script>
</head>
<%
    var TenSP = Request("TenSP");
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs = Server.CreateObject("ADODB.Recordset");
	SP = "SELECT SLHienCo FROM Kho WHERE TenSP = N'"+TenSP+"'";
	rs.Open(SP, cnn);
	var SLHienCo = rs.Fields.Item("SLHienCo");
	if(rs.EOF || SLHienCo == '0'){
	XoaSP = "delete FROM ThongTinSP WHERE TenSP = N'"+TenSP+"'";
	cnn.Execute(XoaSP);
%>
<script>
    document.location = "XemSP.asp";
    alert("Bạn đã xoá thành công sản phẩm <%=TenSP%>");
</script>
<%
    }
    if(SLHienCo != '0'){
%>
<script>
        document.location = "XemSP.asp";
        alert("Bạn không thể xoá <%=TenSP%> do sản phẩm vẫn còn hàng trong kho!!!");
</script>
<%    } %>
<body>
</body>
</html>
