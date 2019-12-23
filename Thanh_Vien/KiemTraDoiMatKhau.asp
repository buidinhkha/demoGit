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
	<a href="ThongTinThanhVien.asp" style="margin-left:3%"><font color="#FF3300"><b>
	<%
				Response.Write(Session("Ten"));
		%></b></font></a>
    | <a href="../TaiKhoan/DangXuat.asp"><font color="#FF3300"><b>Đăng xuất</b></font></a>
	<%
          cnnTB=Server.CreateObject("ADODB.Connection");
          cnnTB.Open(cStr);
          rsTB=Server.CreateObject("ADODB.Recordset");
          TB = "SELECT Count(MaPH) AS SLTB FROM PhanHoiTV WHERE TrangThai = 'CHUADOC' AND ThanhVien = '"+Session("Ten")+"'";
          rsTB.Open(TB,cnnTB);
          var SLTB =rsTB.Fields.Item("SLTB").Value;
      %>
      <a href="ThongBao.asp" style="margin-left:3%;border:none;"><img src="../photo/thongbao.png" width="30px" title="Thông báo" /><b style="color:red;vertical-align:top;"><%=SLTB%></b></a>
	<%		
				}
			else{
		%>
		<!-- InstanceBeginEditable name="dangnhap" -->
            <a href="../TaiKhoan/dangnhap.asp" style="margin-left:3%"><font color="#FF3300"><b>Đăng nhập</b></font></a>| <a href="../TaiKhoan/dangky.asp"><font color="#FF3300"><b>Đăng Ký</b></font></a>
            <a href="../VangLai/KVLPhanHoi.asp" style="margin-left:3%;" target="_blank"><img src="../photo/feedback.jpg" width="40px" title="Phản hồi cho chúng tôi" /></a>
            <!-- InstanceEndEditable -->
	<% } %>
    </div>
</div>
<br>
<br>
<!-- InstanceBeginEditable name="Edit" -->
<script>
function Kiemtra(){
	var MatKhauMoi = document.getElementById('MatKhauMoi').value;
	var XacNhanMK = document.getElementById('XacNhanMK').value;
	reMatKhau = /^.{6,100}$/;
			if(reMatKhau.test(MatKhauMoi) == false){
				alert("Mật Khẩu phải gồm ít nhất 6 kí tự.");
				document.getElementById('MatKhauMoi').focus();
				return false;
				}
			if(MatKhauMoi != XacNhanMK){
			alert("Mật khẩu và Xác Nhận Mật Khẩu phải giống nhau.");
			document.getElementById('XacNhanMK').focus();
			return false;
			}
}
</script>
<br>
<table class="div" width="100%">
	<tr>
    	<td width="20%" valign="top">
        	<ul style="display:block; padding:0px; list-style-type:none; margin-right:20px;">
            	<li style="background-color:#EBEBEB"><img src="../photo/icon-large.png" width="50px" style="margin:10px;"><font size="+2"><%=Session("Ten")%></font></li>
                <a href="ThongTinThanhVien.asp"><li class="litaikhoan" style="background-color:rgb(131, 131, 131);">Thông tin cá nhân</li></a>
                <li class="hoatdongtk" style="color:#F00">Đổi mật khẩu</li>
                <a href="ThongBao.asp"><li class="litaikhoan" style="background-color:rgb(131, 131, 131);">Thông báo</li></a>
            </ul>
        </td>
        <td width="80%" valign="top">
        	<div class="thongtin" align="center"><b>Đổi mật khẩu</b></div><br>
            <%
				var MatKhau = Request("MatKhau");
				var XacNhanMK = Request("XacNhanMK");
				//tạo đối tượng Connection
				cnn=Server.CreateObject("ADODB.Connection");
				//Mở Connection String cStr trong cnn.asp
				cnn.Open(cStr);
				//tạo đối tượng Recordset
				rs=Server.CreateObject("ADODB.Recordset");
				//tạo câu lệnh SQL
				DoiMK = "SELECT TenDangNhap, MatKhau FROM ThanhVien WHERE TenDangNhap = '"+Session("Ten")+"' and MatKhau = '"+MatKhau+"'";
				//thực thi câu lệnh SQL
				rs.Open(DoiMK,cnn);
				if(!rs.EOF){
					CapNhatMK = "UPDATE ThanhVien SET MatKhau = '"+XacNhanMK+"' WHERE TenDangNhap = '"+Session("Ten")+"'";
					cnn.Execute(CapNhatMK);
			%>
				<div style="font-size:20px; color:#0F0;">Bạn đã đổi mật khẩu thành công.</div>
			<%
					}
				if(rs.EOF){
			%>
			<div style="font-size:20px; color:#F00;">Sai MẬT KHẨU, vui lòng nhập lại!!!</div>
            <% } %>
        	<form onSubmit="return Kiemtra();" action="KiemTraDoiMatKhau.asp">
            	<center><input class="boxlogin" type="password" name="MatKhau" placeholder="Nhập mật khẩu cũ..." required><br>
                <input class="boxlogin" type="password"  name="MatKhauMoi" id="MatKhauMoi" placeholder="Nhập mật khẩu mới..."><br>
                <input class="boxlogin" type="password"  name="XacNhanMK" id="XacNhanMK" placeholder="Xác nhận mật khẩu..."><br>
                <input class="nutlogin" type="submit" name="Submit" value="Đồng ý">
                <input class="nutlogin" type="reset" name="reset" value="Huỷ bỏ"></center>
            </form>
        </td>
    </tr>
</table>
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
