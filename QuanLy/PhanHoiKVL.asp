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
<table class="div" width="100%">
	<tr>
    	<td width="22%" valign="top">
        	<ul style="display:block; padding:0px; list-style-type:none; margin-right:20px;">
            	<li class="QuanLi"><font size="+2">Quản Lý Thành Viên</font></li>
                <li class="hoatdongtk" style="color:#F00">Phản hồi</li>
                <a href="ThanhVienHoatDong.asp"><li class="litaikhoan">Thành viên hoạt động</li></a>
                <a href="ThanhVienDaKhoa.asp"><li class="litaikhoan">Thành viên đã khoá</li></a>
            </ul>
        </td>
        <td width="78%" valign="top">
       	  <ul>
                <a href="TBMoi.asp"><li class="PhanHoi">Viết thông báo mới</li></a>
            	<a href="PhanHoi.asp"><li class="PhanHoi">Phản hồi từ thành viên</li></a>
                 <a href="PhanHoiDaTL.asp"><li class="PhanHoi">Phản hồi đã trả lời</li></a>
                <li class="HoatDongPH">Phản hồi từ khách vãng lai</li>
            </ul>
            <%
				cnnCHUADOC=Server.CreateObject("ADODB.Connection");
				cnnCHUADOC.Open(cStr);
				rs=Server.CreateObject("ADODB.Recordset");
				CHUADOC = "SELECT * FROM PhanHoiKVL WHERE TrangThai = 'CHUADOC' ORDER BY MaKVL DESC";
				rs.Open(CHUADOC,cnnCHUADOC);
				if(!rs.EOF){
				var index1=0;
				rs.MoveFirst();
				while(!rs.EOF){
					index1++;
					var MaKVL = rs.Fields.Item("MaKVL").Value;
					Email = rs.Fields.Item("Email").Value;
					SDT = rs.Fields.Item("SDT").Value;
					TGPhanHoi = rs.Fields.Item("TGPhanHoi").Value;
			%>
            <form action="ChiTietPHKVL.asp">
                <table style="border:solid 0px; border-radius:20px; background-color:rgb(255, 85, 199); padding:10px;" width="68%">
                    <tr>
                        <td colspan="2">Mã số khách: <input name="MaKVL" style="border:none;cursor:default;background-color:transparent;" value="<%=MaKVL%>" readonly /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">Email: <input type="submit" style="border:none; background-color:transparent; cursor:pointer;outline:none; font-weight:bold;" value="<%=Email%>"></td>
                        <td width="31%" align="right"><input class="TinPhanHoi" name="TGPhanHoi" value="<%=TGPhanHoi%>" readonly></td>
                    </tr>
                    <tr>
                        <td width="69%">SDT: <input class="TinPhanHoi" name="SDT" value="<%=SDT%>" readonly></td>
                    </tr>
                </table>
            </form><br>
          	<%
				rs.MoveNext();
				}}
			%>
            <%
				cnnDD=Server.CreateObject("ADODB.Connection");
				cnnDD.Open(cStr);
				rsDD=Server.CreateObject("ADODB.Recordset");
				DD = "SELECT * FROM PhanHoiKVL WHERE TrangThai = 'DADOC' ORDER BY MaKVL DESC";
				rsDD.Open(DD,cnnDD);
				if(!rsDD.EOF){
				var index2=0;
				rsDD.MoveFirst();
				while(!rsDD.EOF){
					index2++;
					var MaKVLDD = rsDD.Fields.Item("MaKVL").Value;
					EmailDD = rsDD.Fields.Item("Email").Value;
					SDTDD = rsDD.Fields.Item("SDT").Value;
					TGPhanHoiDD = rsDD.Fields.Item("TGPhanHoi").Value;
					NoiDungDD = rsDD.Fields.Item("NoiDung").Value;
			%>
            <form action="ChiTietPHKVL.asp">
                <table style="border:solid 0px; border-radius:20px; background-color:#E6E6E6; padding:10px;" width="68%">
                    <tr>
                        <td colspan="2">Mã số khách: <input name="MaKVL" value="<%=MaKVLDD%>" style="border:none;cursor:default;background-color:transparent;" readonly /></td>
                    </tr>
                    <tr>
                        <td width="69%" align="left">Email: <input type="submit" style="border:none; background-color:transparent; cursor:pointer;outline:none; font-weight:bold;" value="<%=EmailDD%>">
                        <td width="31%" align="right"><input class="TinPhanHoiDADOC" name="TGPhanHoi" value="<%=TGPhanHoiDD%>" readonly></td>
                    </tr>
                    <tr>
                        <td colspan="2">SDT: <input class="TinPhanHoiDADOC" name="SDT" value="<%=SDTDD%>" readonly></td>
                    </tr>
                </table>
            </form><br>
          	<%
				    rsDD.MoveNext();
				}}
			%>
        </td>
    </tr>
</table>
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
