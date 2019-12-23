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
    var TenNSX = Request("TenNSX");
	cnn=Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs = Server.CreateObject("ADODB.Recordset");
	NSX = "SELECT NSX FROM ThongTinSP WHERE NSX = '"+TenNSX+"'";
	rs.Open(NSX, cnn);
	var NSX = rs.Fields.Item("NSX");
	if(rs.EOF){
	XoaNSX = "delete FROM NhaSanXuat WHERE TenNSX = '"+TenNSX+"'";
	cnn.Execute(XoaNSX);
%>
<script>
    document.location = "XemNSX.asp";
    alert("Bạn đã xoá thành công nhà sản xuất <%=TenNSX%>");
</script>
<%
    }
    if(!rs.EOF){
%>
<script>
        document.location = "XemNSX.asp";
        alert("Bạn không thể xoá <%=TenNSX%> do sản phẩm của NSX này vẫn đang được bày bán!!!");
</script>
<%    } %>
<body>
</body>
</html>
