﻿<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
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
<table class="div" width="100%">
	<tr>
    	<td width="20%" valign="top">
        	<ul style="display:block; padding:0px; list-style-type:none; margin-right:20px;">
            	<li style="background-color:#EBEBEB"><img src="../photo/icon-large.png" width="50px" style="margin:10px;"><font size="+2"><%=Session("Ten")%></font></li>
                <a href="ThongTinThanhVien.asp"><li class="litaikhoan" style="background-color:rgb(131, 131, 131);">Thông tin cá nhân</li></a>
                <a href="DoiMatKhau.asp"><li class="litaikhoan" style="background-color:rgb(131, 131, 131);">Đổi mật khẩu</li></a>
                <li class="hoatdongtk" style="color:#F00">Thông báo</li>
            </ul>
        </td>
        <td width="80%" valign="top">
        	<div class="thongtin" align="center"><b>Thông báo</b></div>
            <ul>
                <li class="HoatDongPH">Viết phản hồi</li>
            	<a href="ThongBao.asp"><li class="PhanHoi">Tất cả thông báo</li></a>
                <a href="PhanHoiDaGui.asp"><li class="PhanHoi">Phản hồi đã gửi</li></a>
            </ul>
            <script>
				function PH(){
					var ChuDe = document.getElementById('ChuDe').value;
					var NoiDung = document.getElementById('NoiDung').value;
					reChuDe = /[^\s]/;
					if(reChuDe.test(ChuDe) == false || ChuDe.length > 50){
						alert("Chủ đề không được để trống, tối đa 50 kí tự.");
						document.getElementById('ChuDe').focus();
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
            <form action="PH_process.asp" onSubmit="return PH();">
                <table>
                    <tr>
                        <td>
                            Chủ đề:
                        </td>
                        <td>
                            <input type="text" name="ChuDeMoi" id="ChuDe"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Nội dung:</td>
                        <td><textarea style="resize:none;" rows="5" cols="70" name="NoiDungMoi" id="NoiDung"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="checkbox" checked required> <b>Tôi đồng ý với <a href="../TaiKhoan/DieuKhoan.asp#PhanHoi" target="_blank">Điều khoản</a> của TNTT SHOP.</b></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/send.png" width="40px" title="Gửi" /></button>
                            <a href="ThongBao.asp"><button type="button" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/Close.png" width="40px" title="Huỷ bỏ" /></button></a>
                        </td>
                    </tr>
                </table>
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
