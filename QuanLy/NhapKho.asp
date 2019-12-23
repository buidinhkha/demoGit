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
<script>
	function NhapKho(){
		var GiaNhap = document.getElementById('GiaNhap').value;
		var SLNhap = document.getElementById('SLNhap').value;
		if(SLNhap == '' || SLNhap > 1000000 || SLNhap < 0){
			alert("Số lượng nhập không được để trống và nằm trong khoảng 0 - 1 triệu.");
			document.getElementById('SLNhap').focus();
			return false;
			}
		if(GiaNhap == '' || GiaNhap > 2000000000 || GiaNhap < 0){
			alert("Giá sản phẩm không được để trống và nằm trong khoảng 0 - 2 tỷ.");
			document.getElementById('GiaNhap').focus();
			return false;
			}
	}
</script>
    <form action="KiemTraNhapKho.asp" onSubmit="return NhapKho();">
        <table width="50%" border="0" align="center">
        <tr>
            <td style="background:#3F9;padding:5px;font-size:30px;color:red;" colspan="2"><b>Nhập kho</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Tên sản phẩm:</td>
            <td style="background:#3F9;padding:5px;"><select name="TenSP">
                    <%cnn=Server.CreateObject("ADODB.Connection");
	                cnn.Open(cStr);
	                rs=Server.CreateObject("ADODB.Recordset");
	                SP = "SELECT TenSP FROM ThongTinSP";
	                rs.Open(SP, cnn);
	                var index=0;
	                rs.MoveFirst();
	                while(!rs.EOF){
	                    index++;
	                    var TenSP=rs.Fields.Item("TenSP").Value;
                    %>
                    <option value="<%=TenSP%>"><%=TenSP%></option>
                    <%
		                rs.MoveNext();
		                }
	                %>
                </select></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Số lượng nhập:</td>
            <td style="background:#3F9;padding:5px;"><input type="number" name="SLNhap" id="SLNhap"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Đơn giá:</td>
            <td style="background:#3F9;padding:5px;"><input type="number" name="GiaNhap" id="GiaNhap"></td>
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
