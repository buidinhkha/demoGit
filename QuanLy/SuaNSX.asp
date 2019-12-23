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
	function SuaNSX(){
		var Logonew = document.getElementById('Logonew').value;
		var Website = document.getElementById('Website').value;
		var SDT = document.getElementById('SDT').value;
		var Email = document.getElementById('Email').value;
		var DiaChi = document.getElementById('DiaChi').value;
		if((Logonew != '') && (Logonew.lastIndexOf(".jpg") == -1) && (Logonew.lastIndexOf(".png") == -1) && (Logonew.lastIndexOf(".gif") == -1))
				{
				alert("Chỉ hỗ trợ định dạng: jpg, png, gif.");
				document.getElementById('Logonew').focus();
				return false;
				}
		reWebsite = /^(www.)?\w+[.]\w+([.]\w+)?$/;
		if(reWebsite.test(Website) == false){
			alert("Sai định dạng Website.");
			document.getElementById('Website').focus();
			return false;
			}
		reSDT = /^0{0,1}[1-9]{1}[0-9]{6,10}$/; //{min,max}
		if(reSDT.test(SDT) == false){
			alert("Lỗi định dạng số điện thoại.");
			document.getElementById('SDT').focus();
			return false;
			}
		reEmail = /^[A-Za-z]+\w+[@]+\w+[.]+\w+([.]+\w+)?$/;
		if(reEmail.test(Email) == false){
			alert("Sai định dạng Email. Vui lòng nhập lại Email.");
			document.getElementById('Email').focus();
			return false;
			}
		reDiaChi = /[^\s]/;
		if(reDiaChi.test(DiaChi) == false){
			alert("Địa chỉ nhà sản xuất không được để trống.");
			document.getElementById('DiaChi').focus();
			return false;
			}
	}
</script>
    <form action="KiemTraSuaNSX.asp" onSubmit="return SuaNSX();">
            <%
                var TenNSX = Request("TenNSX");
                cnn=Server.CreateObject("ADODB.Connection");
                cnn.Open(cStr);
                rs=Server.CreateObject("ADODB.Recordset");
                NSX = "SELECT * FROM NhaSanXuat WHERE TenNSX = '"+TenNSX+"'";
                rs.Open(NSX,cnn);
                    var TenNSX = rs.Fields.Item("TenNSX").Value;
                    Logo = rs.Fields.Item("Logo").Value;
                    Website = rs.Fields.Item("Website").Value;
                    SDT = rs.Fields.Item("SDT").Value;
                    Email = rs.Fields.Item("Email").Value;
                    DiaChi = rs.Fields.Item("DiaChi").Value;
            %>
        <table width="50%" border="0" align="center">
        <tr>
            <td style="background:#3F9;padding:5px;font-size:30px;color:red;" colspan="2"><b>Cập nhật nhà sản xuất</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Tên nhà sản xuất:</td>
            <td style="background:#3F9;padding:5px;"><input type="text" name="TenNSX" value="<%=TenNSX%>" style="background-color:transparent; border:none;" readonly></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Logo:</td>
            <td style="background:#3F9;padding:5px;"><img src="../photo/<%=Logo%>" width="100px" /><input name="Logo" value="<%=Logo%>" hidden="hidden" readonly><input type="file" name="Logonew" id="Logonew"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Website:</td>
            <td style="background:#3F9;padding:5px;"><input type="text" name="Website" id="Website"  value="<%=Website%>"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Số điện thoại:</td>
            <td style="background:#3F9;padding:5px;"><input type="number" name="SDT" value="<%=SDT%>" id="SDT"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Email:</td>
            <td style="background:#3F9;padding:5px;"><input type="text" name="Email" value="<%=Email%>" id="Email"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Địa chỉ:</td>
            <td style="background:#3F9;padding:5px;"><textarea style="resize:none;" rows="3" cols="50" name="DiaChi" id="DiaChi"><%=DiaChi%></textarea></td>
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
