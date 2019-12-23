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
<%
    var TenSP = Request("TenSP");
    cnnSP=Server.CreateObject("ADODB.Connection");
	cnnSP.Open(cStr);
	rsSP=Server.CreateObject("ADODB.Recordset");
	SP = "SELECT * FROM ThongTinSP WHERE TenSP = N'" + TenSP + "'";
	rsSP.Open(SP, cnnSP);

	var TenSP = rsSP.Fields.Item("TenSP").Value;
	    GiaSP = rsSP.Fields.Item("GiaSP").Value;
	    NSX = rsSP.Fields.Item("NSX").Value;
	    LoaiSP = rsSP.Fields.Item("LoaiSP").Value;
	    AnhSP = rsSP.Fields.Item("AnhSP").Value;
	    ManHinh = rsSP.Fields.Item("ManHinh").Value;
	    HDH = rsSP.Fields.Item("HDH").Value;
	    CameraChinh = rsSP.Fields.Item("CameraChinh").Value;
	    CameraPhu = rsSP.Fields.Item("CameraPhu").Value;
	    CPU = rsSP.Fields.Item("CPU").Value;
	    RAM = rsSP.Fields.Item("RAM").Value;
	    ROM = rsSP.Fields.Item("ROM").Value;
	    KetNoi = rsSP.Fields.Item("KetNoi").Value;
	    Sim = rsSP.Fields.Item("Sim").Value;
	    TheNho = rsSP.Fields.Item("TheNho").Value;
	    Pin = rsSP.Fields.Item("Pin").Value;
	    KM = rsSP.Fields.Item("KM").Value;
	    TTThem = rsSP.Fields.Item("TTThem").Value;
	    ThoiGianThem = rsSP.Fields.Item("ThoiGianThem").Value;
%>
<script>
	function SuaSP(){
		var GiaSP = document.getElementById('GiaSP').value;
		var AnhSPnew = document.getElementById('AnhSPnew').value;
		if(GiaSP == '' || GiaSP > 2000000000 || GiaSP < 0){
			alert("Giá sản phẩm không được để trống và nằm trong khoảng 0 - 2 tỷ.");
			document.getElementById('GiaSP').focus();
			return false;
			}
		if((AnhSPnew != '') && (AnhSPnew.lastIndexOf(".jpg") == -1) && (AnhSPnew.lastIndexOf(".png") == -1) && (AnhSPnew.lastIndexOf(".gif") == -1))
				{
				alert("Chỉ hỗ trợ định dạng: jpg, png, gif.");
				document.getElementById('AnhSPnew').focus();
				return false;
				}
	}
</script>
<form id="myForm" action="KiemTraSuaSP.asp" onSubmit="return SuaSP();">
    <table width="50%" border="0" align="center">
        <tr>
            <td style="background:#3F9;padding:5px;font-size:30px;color:red;" colspan="2"><b>Thông tin sản phẩm</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;" align="right">Tên Sản Phẩm:</td>
            <td style="background:#3F9;padding:5px;font-weight:bold;"><input type="text" style="background:#3F9;padding:5px;font-weight:bold;border:none;" name="TenSP" id="TenSP" value="<%=TenSP%>" readonly></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;" align="right"><font color="red">*</font>Giá:</td>
            <td style="background:#3F9;padding:5px;font-weight:bold;"><input type="number" name="GiaSP" value="<%=GiaSP%>" id="GiaSP"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;" align="right">Nhà sản xuất:</td>
            <td style="background:#3F9;padding:5px;font-weight:bold;"><%=NSX%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;" align="right">Loại sản phẩm:</td>
            <td style="background:#3F9;padding:5px;font-weight:bold;"><%=LoaiSP%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;" align="right">Ảnh:</td>
            <td style="background:#3F9;padding:5px;"><img src="../photo/<%=AnhSP%>" width="150px"/><input name="AnhSP" value="<%=AnhSP%>" hidden="hidden" readonly><input type="file" id="AnhSPnew" name="AnhSPnew"></td>
        </tr>
        <tr>
            <td colspan="2" style="background:#3F9;padding:5px;font-size:30px;color:red;"><b>Thông số kỹ thuật</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Màn hình:</td>
            <td style="background:#3F9;padding:5px;">
                <%=ManHinh%>
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Hệ điều hành:</td>
            <td style="background:#3F9;padding:5px;"><%=HDH%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Camera chính:</td>
            <td style="background:#3F9;padding:5px;"><%=CameraChinh%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Camera phụ:</td>
            <td style="background:#3F9;padding:5px;"><%=CameraPhu%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">CPU:</td>
            <td style="background:#3F9;padding:5px;"><%=CPU%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">RAM</td>
            <td style="background:#3F9;padding:5px;"><%=RAM%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Bộ nhớ trong:</td>
            <td style="background:#3F9;padding:5px;"><%=ROM%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Kết nối:</td>
            <td style="background:#3F9;padding:5px;"><%=KetNoi%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Thẻ sim:</td>
            <td style="background:#3F9;padding:5px;"><%=Sim%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Hỗ trợ thẻ nhớ:</td>
            <td style="background:#3F9;padding:5px;"><%=TheNho%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Dung lượng Pin:</td>
            <td style="background:#3F9;padding:5px;"><%=Pin%></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Khuyến mãi/tặng kèm:</td>
            <td style="background:#3F9;padding:5px;"><textarea name="KM" type="text"><%=KM%></textarea></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Thông tin khác:</td>
            <td style="background:#3F9;padding:5px;"><textarea name="TTThem" type="text"><%=TTThem%></textarea></td>
        </tr>
        <tr>
        <td style="background:#3F9;padding:5px;border-bottom-left-radius:15px;">&nbsp;</td>
        <td style="background:#3F9;padding:5px;border-bottom-right-radius:15px;">
            <input type="submit" class="nutlogin" name="submit" value="Đồng ý" />
            <input type="reset" name="reset" value="Huỷ bỏ" class="nutlogin" />
        </td>
        </tr>
    </table>
</form>
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
