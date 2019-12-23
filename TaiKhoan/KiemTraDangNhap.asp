<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/cnn.asp"-->
<!doctype html>
<html><!-- InstanceBegin template="/Templates/templateHome.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<META name="viewport" content="width=device-width">
<!-- InstanceBeginEditable name="doctitle" -->
<title>TNTT Shop - The Famous Technology</title>
<!-- InstanceEndEditable -->
<link rel="stylesheet" href="../css/csshome.css">
<link rel="shortcut icon" href="../Templates/mobilesmartphoneicon.ico">
<script type="text/javascript" src="../jquery/cursor.js"></script>
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>

<body onselectstart="return false" oncontextmenu="return false">
<div class="div">
    <div style="float:left;">
        <a href="../home.asp">
            <img src="../photo/logo.png" width="120px" height="120px" alt="Cửa hàng SmartPhone" title="Cửa hàng SmartPhone">
        </a>
  </div>
  <div style="padding-top:50px;">
    <form action="../SanPham/TimKiem.asp">
          <input class="boxtimkiem" type="search" placeholder="Nhập tên sản phẩm bạn muốn tìm" name="TimKiem">
          <button type="submit" class="nuttimkiem"><img src="../photo/Search.ico" title="Tìm kiếm" width="32px" /></button>
    </form>
    <font color="#999">Liên hệ: </font><b style="color:#F00">01212692802</b>
	<%
			if(Session("Ten") != null){
		%>
	<a href="../Thanh_Vien/ThongTinThanhVien.asp" style="margin-left:3%"><font color="#FF3300"><b>
	<%
				Response.Write(Session("Ten"));
		%></b></font></a>
    | <a href="DangXuat.asp"><font color="#FF3300"><b>Đăng xuất</b></font></a>
	<%
          cnnTB=Server.CreateObject("ADODB.Connection");
          cnnTB.Open(cStr);
          rsTB=Server.CreateObject("ADODB.Recordset");
          TB = "SELECT Count(MaPH) AS SLTB FROM PhanHoiTV WHERE TrangThai = 'CHUADOC' AND ThanhVien = '"+Session("Ten")+"'";
          rsTB.Open(TB,cnnTB);
          var SLTB =rsTB.Fields.Item("SLTB").Value;
      %>
      <a href="../Thanh_Vien/ThongBao.asp" style="margin-left:3%;border:none;"><img src="../photo/thongbao.png" width="30px" title="Thông báo" /><b style="color:red;vertical-align:top;"><%=SLTB%></b></a>
	<%		
				}
			else{
		%>
		<!-- InstanceBeginEditable name="dangnhap" --><a href="dangky.asp" style="margin-left:5%"><font color="#FF3300"><b>Đăng Ký</b></font></a><!-- InstanceEndEditable -->
	<% } %>
    </div>
</div>
<br>
<br>
<!-- InstanceBeginEditable name="Edit" -->
<div class="div" id="duongdan">
    <font color="#666666">
    	<a id="duongdan" href="../home.asp">Trang chủ</a>
        &ensp;>&ensp;<font color="#FF0000">Đăng nhập</font>
    </font>
</div>
<%
	var sesTen=""; //biến session
	//Nhận dữ liệu từ trang Login.html
	Ten=Request("Ten");
	MatKhau=Request("MatKhau");
	sesTen += Ten
	//Tạo đối tương Connection
	cnn=Server.CreateObject("ADODB.Connection");
	//Mở Connecttion dùng cầu nối ODBC
	cnn.Open(cStr);
	//Tạo đối tượng Recordset
	rs=Server.CreateObject("ADODB.Recordset");
	//Tạo câu lệnh SQL
	sTaiKhoan= "SELECT TenDangNhap, MatKhau FROM ThanhVien WHERE TenDangNhap='"+ Ten +"' AND MatKhau='"+ MatKhau + "' AND HoatDong = 'YES'";
	//Thực thi câu lệnh SQL
	rs.Open(sTaiKhoan, cnn);
	if(rs.EOF){
%>
<div style="padding: 30px; background-image: url(../photo/anhnen.gif);">
	<center>
	  <strong style="color: #F00; font-size: 18px; font-family:Courier New;"><em>Tên Đăng Nhập hoặc Mật Khấu sai. Vui lòng nhập lại!!!</em></strong>
	</center>
<div align="center" style="padding:30px; background-image:url(../photo/anhnen.gif)">
<font color="#FF0000" face="Segoe UI" size="+3"><b>ĐĂNG NHẬP</b></font>
<form action="KiemTraDangNhap.asp" name="myFrm">
    <i class="iconlogin"></i><input name="Ten" type="text" class="boxlogin" id="textfield" placeholder="Tên đăng nhập" required><br>
    <i class="iconpass"></i><input class="boxlogin" type="password" name="MatKhau" placeholder="Mật khẩu" required><br>
    <input class="nutlogin" type="submit" name="button" value="Đăng nhập">
    <p><strong><em><a href="dangky.asp"><font color="#0000FF">Đăng ký?</font></a></em></strong></p></td>
</form>
</div>
</div>
<% }
if(Ten == 'admin' && MatKhau == 'admin'){
	Response.Redirect("../QuanLy/PhanHoi.asp");
	}
if(!rs.EOF){
	Session("Ten") = sesTen; //Đưa giá trị vào session
	Response.Redirect("../home.asp"); //chuyển hướng
	}
	//đóng kết nối
	rs.Close();
	cnn.Close();
	rs=null;
	cnn=null;
%>
<link rel="shortcut icon" href="../Templates/mobilesmartphoneicon.ico">
<!-- InstanceEndEditable -->
<!--Footer-->
<div class="div" id="footer">
	<b>Điện thoại:</b> 01212692802<br>
    <b>Email:</b> TNTTSHOP@gmail.com<br>
    <b>Fb:</b> facebook.com/TNTT.SHOP.Congnghe/<br>
    <b>Địa chỉ:</b><br><br>
    <center>
    	-------------------------------------------<br>
    	&#169 2016 Copyright by TNTT Shop
    </center>
</div>
  <script type="text/javascript" src="../css/ToTop.js"></script>
  <div id="top">
    <a href="#">
      <img src="../photo/backtotop.png" width="40px" />
    </a>
  </div>
</body>
<!-- InstanceEnd --></html>
