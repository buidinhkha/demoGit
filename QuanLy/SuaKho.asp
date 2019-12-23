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

<body onselectstart="return false" oncontextmenu="return false" style="background-image:url(../photo/background.jpg);background-attachment:fixed;">
<div class="div">
  <div style="float:left;">
        <a href="../home.asp" target="_blank">
            <img src="../photo/logo.png" width="120px" height="120px" alt="Cửa hàng SmartPhone" title="Cửa hàng SmartPhone">
        </a>
  </div>
  <div style="padding-top:50px;">
    <form action="../SanPham/TimKiem.asp">
          <input class="boxtimkiem" style="background-color:transparent;" type="search" placeholder="Nhập tên sản phẩm bạn muốn tìm" name="TimKiem">
          <button type="submit" class="nuttimkiem"><img src="../photo/Search.ico" title="Tìm kiếm" width="32px" /></button>
    </form>
  </div>
</div>
<br /><br /><br /><br /><br />
<ul class="XTSX1">
    <li id="XTSX2" class="XTSX2"><a href="PhanHoi.asp">Quản lý</a></li>
    <li id="XTSX2" class="dropdown">
        <a href="#" class="dropbtn">Sản phẩm</a>
        <div class="dropdown-content">
            <a href="XemSP.asp">Thông tin sản phẩm</a>
            <a href="ThemSP.asp">Thêm sản phẩm</a>
        </div>
    </li>
    <li id="XTSX2" class="dropdown">
        <a href="#" class="dropbtn">Nhà sản xuất</a>
        <div class="dropdown-content">
            <a href="XemNSX.asp">Thông tin NSX</a>
            <a href="ThemNSX.asp">Thêm thông tin NSX</a>
        </div>
    </li>
    <li id="XTSX2" class="dropdown">
        <a href="#" class="dropbtn">Kho hàng</a>
        <div class="dropdown-content">
            <a href="XemKho.asp">Kiểm tra kho hàng</a>
            <a href="NhapKho.asp">Nhập kho hàng</a>
        </div>
    </li>
</ul>
<div class="div" style="margin-top: 30px">
<%
    var MaLoHang = Request("MaLoHang");
    cnn = Server.CreateObject("ADODB.Connection");
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	Kho = "SELECT * FROM Kho WHERE MaLoHang = '" + MaLoHang + "'";
	rs.Open(Kho, cnn);
	var MaLoHang = rs.Fields.Item("MaLoHang").Value;
	    TenSP = rs.Fields.Item("TenSP").Value;
	    SLHienCo = rs.Fields.Item("SLHienCo").Value;
	    TGCNCuoi = rs.Fields.Item("TGCNCuoi").Value;
%>
<script>
	function SuaKho(){
		var SLBan = document.getElementById('SLBan').value;
		if(SLBan == '' || SLBan > 1000000 || SLBan < -1000000){
			alert("Số lượng bán ra không được để trống và nằm trong khoảng -1 triệu đến 1 triệu.");
			document.getElementById('SLBan').focus();
			return false;
			}
	}
</script>
    <form action="KiemTraSuaKho.asp" onSubmit="return SuaKho();">
        <table width="50%" border="0" align="center">
        <tr>
            <td style="background:#3F9;padding:5px;font-size:30px;color:red;" colspan="2"><b>Cập nhật kho</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Mã lô hàng:</td>
            <td style="background:#3F9;padding:5px;"><input name="MaLoHang" style="background-color:transparent;border:none;outline:none;font-size:20px;" value="<%=MaLoHang%>" readonly></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Tên sản phẩm:</td>
            <td style="background:#3F9;padding:5px;"><%=TenSP%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Số lượng hiện có:</td>
            <td style="background:#3F9;padding:5px;"><input type="number" name="SLHienCo" style="background-color:transparent;border:none;outline:none;" value="<%=SLHienCo%>" readonly></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Thời gian cập nhật cuối cùng:</td>
            <td style="background:#3F9;padding:5px;"><%=TGCNCuoi%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Số lượng bán ra:</td>
            <td style="background:#3F9;padding:5px;"><input type="number" name="SLBan" id="SLBan"></td>
        </tr>
        <tr>
        <td style="background:#3F9;padding:5px;border-bottom-left-radius:15px;">&nbsp;</td>
        <td style="background:#3F9;padding:5px;border-bottom-right-radius:15px;">
        	<input class="nutlogin" type="submit" name="submit" id="submit" value="Đồng ý">
          	<input class="nutlogin" type="reset" name="reset" id="reset" value="Huỷ bỏ"></td>
        </tr>
    </table>
    </form>
</div>
<!--Footer-->
<div class="div" id="footer">
    <center>
    	-------------------------------------------<br>
    	&#169 2016 Copyright by TNTT Shop
    </center>
</div>
<script type="text/javascript" src="../css/ToTop.js"></script>
<div id="top"><a href="#"><img src="../photo/backtotop.png" width="40px" /></a></div>
</body>
</html>
