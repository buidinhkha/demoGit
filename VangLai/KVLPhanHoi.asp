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
    | <a href="../TaiKhoan/DangXuat.asp"><font color="#FF3300"><b>Đăng xuất</b></font></a>
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
		<!-- InstanceBeginEditable name="dangnhap" -->
            <a href="../TaiKhoan/dangnhap.asp" style="margin-left:3%"><font color="#FF3300"><b>Đăng nhập</b></font></a>| <a href="../TaiKhoan/dangky.asp"><font color="#FF3300"><b>Đăng Ký</b></font></a>
            <a href="KVLPhanHoi.asp" style="margin-left:3%;" target="_blank"><img src="../photo/feedback.jpg" width="40px" title="Phản hồi cho chúng tôi" /></a>
            <!-- InstanceEndEditable -->
	<% } %>
    </div>
</div>
<br>
<br>
<!-- InstanceBeginEditable name="Edit" -->
<script>
	function KVLPH(){
		var Email = document.getElementById('Email').value;
		var SDT = document.getElementById('SDT').value;
		var NoiDung = document.getElementById('NoiDung').value;
		reEmail = /^[A-Za-z]+\w+[@]+\w+[.]+\w+([.]+\w+)?$/;
		if(reEmail.test(Email) == false){
			alert("Sai định dạng Email. Vui lòng nhập lại Email.");
			document.getElementById('Email').focus();
			return false;
			}
		reSDT = /^0{0,1}[1-9]{1}[0-9]{6,10}$/;
		if(reSDT.test(SDT) == false){
			alert("Lỗi định dạng số điện thoại.");
			document.getElementById('SDT').focus();
			return false;
			}
		reNoiDung = /[^\s]/;
		if(reNoiDung.test(NoiDung) == false){
			alert("Nội dung không được để trống.");
			document.getElementById('NoiDung').focus();
			return false;
			}
	}
</script>
<div class="div" style="padding:10px;font-size:30px;font-weight:bold;cursor:default;" align="center">Phản hồi</div>
<img src="../photo/feedbackimg.png" width="400px" style="float:left" />
<form action="KVLTL_process.asp" onSubmit="return KVLPH();" class="div">
    <table width="45%">
        <tr>
            <td align="center">
                <input type="email" style="border:groove 1px rgb(0, 239, 255);border-radius:20px;padding:10px;outline:none;width:350px;box-shadow:0px 2px 2px 0px rgb(0, 239, 255);margin-bottom:15px;" name="Email" id="Email" placeholder="Email"/>
            </td>
        </tr>
        <tr>
            <td align="center">
                <input type="number" style="border:groove 1px rgb(0, 239, 255);border-radius:20px;padding:10px;outline:none;width:350px;box-shadow:0px 2px 2px 0px rgb(0, 239, 255);margin-bottom:15px;" name="SDT" id="SDT" placeholder="Số điện thoại"/>
            </td>
        </tr>
        <tr>
            <td align="center"><textarea style="resize:none;outline:none;border:groove 1px rgb(0, 239, 255);border-radius:20px;padding:10px;font-family:'Times New Roman';box-shadow:0px 2px 2px 0px rgb(0, 239, 255);margin-bottom:15px;" placeholder="Nội dung" rows="10" cols="50" name="NoiDung" id="NoiDung"></textarea></td>
        </tr>
        <tr>
            <td align="center"><button type="submit" name="submit" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/send.png" width="40px" title="Gửi" /></button>
                <a href="../home.asp"><button type="button" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/Close.png" width="40px" title="Huỷ bỏ" /></button></a>
            </td>
        </tr>
    </table>
</form>
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
