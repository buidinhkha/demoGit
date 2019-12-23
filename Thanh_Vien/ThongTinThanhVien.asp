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
<%
	//tạo đối tượng Connection
	cnn=Server.CreateObject("ADODB.Connection");
	//Mở Connection String cStr trong cnn.asp
	cnn.Open(cStr);
	//tạo đối tượng Recordset
	rs=Server.CreateObject("ADODB.Recordset");
	//tạo câu lệnh SQL
	TaiKhoan = "SELECT TenDangNhap, HoVaTen, SDT, Email, NgaySinh, GT, DiaChi FROM ThanhVien WHERE TenDangNhap = '"+Session("Ten")+"'";
	//thực thi câu lệnh SQL
	rs.Open(TaiKhoan,cnn);
	var Ten = rs.Fields.Item("TenDangNhap").Value;
		HoVaTen = rs.Fields.Item("HoVaTen").Value;
		SDT = rs.Fields.Item("SDT").Value;
		Email = rs.Fields.Item("Email").Value;
		NgaySinh = rs.Fields.Item("NgaySinh").Value;
		GT = rs.Fields.Item("GT").Value;
		DiaChi = rs.Fields.Item("DiaChi").Value;
%>
<script>
	function KTThongTin(){
		var HoVaTen = document.getElementById('HoVaTen').value;
		var SDT = document.getElementById('SDT').value;
		var Email = document.getElementById('Email').value;
		var NgaySinh = document.getElementById('NgaySinh').value;
		var DiaChi = document.getElementById('DiaChi').value;
		reHoVaTen = /[^\s]/;
		if(reHoVaTen.test(HoVaTen) == false){
			alert("Họ Và Tên không được để trống.");
			document.getElementById('HoVaTen').focus();
			return false;
			}
		reSDT = /^0{0,1}[1-9]{1}[0-9]{6,10}$/;
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
			alert("Địa chỉ nhận hàng không được để trống.");
			document.getElementById('DiaChi').focus();
			return false;
			}
		if(NgaySinh == ''){
			alert("Ngày Sinh không được để trống.");
			document.getElementById('NgaySinh').focus();
			return false;
			}
	}
</script>
<table class="div" width="100%">
	<tr>
    	<td width="20%" valign="top">
        	<ul style="display:block; padding:0px; list-style-type:none; margin-right:20px;">
            	<li style="background-color:#EBEBEB"><img src="../photo/icon-large.png" width="50px" style="margin:10px;"><font size="+2"><%=Ten%></font></li>
                <li class="hoatdongtk" style="color:#F00">Thông tin cá nhân</li>
                <a href="DoiMatKhau.asp"><li class="litaikhoan" style="background-color:rgb(131, 131, 131);">Đổi mật khẩu</li></a>
                <a href="ThongBao.asp"><li class="litaikhoan" style="background-color:rgb(131, 131, 131);">Thông báo</li></a>
            </ul>
        </td>
        <td width="80%" valign="top">
        	<div class="thongtin" align="center"><b>Thông tin cá nhân</b></div>
        	<font size="+1">Bạn có thể chỉnh sửa thông tin cá nhân của mình tại đây.</font><br><br>
            <form name="myForm" onSubmit="return KTThongTin();" action="CapNhatThongTin.asp">
            	<font size="+2"><b>Họ và tên:</b></font><br><input type="text" name="HoVaTen" id="HoVaTen" value="<%=HoVaTen%>" class="hopthongtin"><br>
                <font size="+2"><b>Số điện thoại:</b></font><br><input type="number" name="SDT" id="SDT" value="<%=SDT%>" class="hopthongtin"><br>
                <font size="+2"><b>Email:</b></font><br><input type="text" name="Email" id="Email" value="<%=Email%>" class="hopthongtin"><br>
                <font size="+2" style="margin-top:20px;"><b>Địa chỉ nhận hàng:</b></font><br><textarea style="resize:none;" name="DiaChi" id="DiaChi" rows="3" class="hopthongtin"><%=DiaChi%></textarea><br>
                <font size="+2"><b>Ngày sinh:</b></font><br><input type="date" max="2010-01-01" min="1950-01-01" name="NgaySinh" id="NgaySinh" value="<%=NgaySinh%>" class="hopthongtin"><br>
                <font size="+2"><b>Giới tính:</b></font><br>
                <%if(rs.Fields.Item("GT").Value == "Nam"){%>
                    <input type="radio" name="GT" value="Nam" required checked />
                <%}
                    else{
                %>
                    <input type="radio" name="GT" value="Nam" required /><%}%>Nam
                <%if(rs.Fields.Item("GT").Value == "Nữ"){%>
                    <input type="radio" name="GT" value="Nữ" required checked>
                <%}
                    else{
                %>
                    <input type="radio" name="GT" value="Nữ" required><%}%>Nữ<br>
                    <input type="submit" name="submit" id="submit" value="Cập nhật thông tin" class="nutlogin">
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
