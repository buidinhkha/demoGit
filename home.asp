<%@  language="JAVASCRIPT" codepage="65001" %>
<!--#include file="SanPham/Connections/cnn.asp"-->
<!doctype html>
<html><!-- InstanceBegin template="/Templates/templateHome.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<META name="viewport" content="width=device-width">
<!-- InstanceBeginEditable name="doctitle" -->
    <title>TNTT Shop - The Famous Technology</title>
    <!-- InstanceEndEditable -->
<link rel="stylesheet" href="css/csshome.css">
<link rel="shortcut icon" href="Templates/mobilesmartphoneicon.ico">
<script type="text/javascript" src="jquery/cursor.js"></script>
<!-- InstanceBeginEditable name="head" -->
    <!-- InstanceEndEditable -->
</head>

<body onselectstart="return false" oncontextmenu="return false">
<div class="div">
    <div style="float:left;">
        <a href="home.asp">
            <img src="photo/logo.png" width="120px" height="120px" alt="Cửa hàng SmartPhone" title="Cửa hàng SmartPhone">
        </a>
  </div>
  <div style="padding-top:50px;">
    <form action="SanPham/TimKiem.asp">
          <input class="boxtimkiem" type="search" placeholder="Nhập tên sản phẩm bạn muốn tìm" name="TimKiem">
          <button type="submit" class="nuttimkiem"><img src="photo/Search.ico" title="Tìm kiếm" width="32px" /></button>
    </form>
    <font color="#999">Liên hệ: </font><b style="color:#F00">01212692802</b>
	<%
			if(Session("Ten") != null){
		%>
	<a href="Thanh_Vien/ThongTinThanhVien.asp" style="margin-left:3%"><font color="#FF3300"><b>
	<%
				Response.Write(Session("Ten"));
		%></b></font></a>
    | <a href="TaiKhoan/DangXuat.asp"><font color="#FF3300"><b>Đăng xuất</b></font></a>
	<%
          cnnTB=Server.CreateObject("ADODB.Connection");
          cnnTB.Open(cStr);
          rsTB=Server.CreateObject("ADODB.Recordset");
          TB = "SELECT Count(MaPH) AS SLTB FROM PhanHoiTV WHERE TrangThai = 'CHUADOC' AND ThanhVien = '"+Session("Ten")+"'";
          rsTB.Open(TB,cnnTB);
          var SLTB =rsTB.Fields.Item("SLTB").Value;
      %>
      <a href="Thanh_Vien/ThongBao.asp" style="margin-left:3%;border:none;"><img src="photo/thongbao.png" width="30px" title="Thông báo" /><b style="color:red;vertical-align:top;"><%=SLTB%></b></a>
	<%		
				}
			else{
		%>
		<!-- InstanceBeginEditable name="dangnhap" -->
            <a href="TaiKhoan/dangnhap.asp" style="margin-left:3%"><font color="#FF3300"><b>Đăng nhập</b></font></a>| <a href="TaiKhoan/dangky.asp"><font color="#FF3300"><b>Đăng Ký</b></font></a>
            <a href="VangLai/KVLPhanHoi.asp" style="margin-left:3%;" target="_blank"><img src="photo/feedback.jpg" width="40px" title="Phản hồi cho chúng tôi" /></a>
            <!-- InstanceEndEditable -->
	<% } %>
    </div>
</div>
<br>
<br>
<!-- InstanceBeginEditable name="Edit" -->
<script type="text/javascript" src="jquery/cufon-yui.js"></script>
    <script type="text/javascript" src="jquery/Book_Antiqua_400.font.js"></script>
    <script type="text/javascript">
        Cufon.replace ('h1')('h2')('h3')('h4')('#logo a')('#buttons a');
    </script>
<!--<link href="jquery/styles.css" rel="stylesheet" type="text/css" />-->
<link rel="stylesheet" href="jquery/nivo-slider.css" type="text/css" media="screen" />


<center>
        <div class="top_img">      
                <div id="slider" class="nivoSlider">
                <img src="photo/Iphone.png" title="" width="800" height="300" />
                <img src="photo/Loa.png" title="" width="800" height="300" />
                <img src="photo/samsungj5.gif" title="" width="800" height="300" />
                </div>        
        </div>
<script type="text/javascript" src="jquery/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="jquery/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</center>
    <div class="div">
        <a href="SanPham/congnghe.asp" class="danhmuc">CÔNG NGHỆ</a><hr>
    </div>
    <div class="div" align="center">
        <a href="SanPham/dienthoai.asp">
            <img class="photo" src="photo/dienthoai.jpg" alt="Điện thoại"></a>
        <a href="SanPham/maytinhbang.asp">
            <img class="photo" src="photo/maytinhbang.jpg" alt="Máy tính bảng"></a>
        <a href="SanPham/phukien.asp">
            <img class="photo" src="photo/phukien.jpg" alt="Phụ kiện"></a>
    </div>
    <table width="100%">
        <tr>
            <td>
                <div class="div" style="margin-top: 30px">
                    <!--SẢN PHẨM-->
                    <%
                        //tạo đối tượng Connection
                        cnnSP=Server.CreateObject("ADODB.Connection");
                        //Mở Connection String cStr trong cnn.asp
                        cnnSP.Open(cStr);
                        //tạo đối tượng Recordset
                        rsSP =Server.CreateObject("ADODB.Recordset");
                        //tạo câu lệnh SQL
                        SP = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP, AnhSP FROM ThongTinSP ORDER BY ThoiGianThem DESC";
                        //thực thi câu lệnh SQL
                        rsSP.Open(SP,cnnSP);
                        var index1=0;
                        rsSP.MoveFirst();
                        while(index1 < 15){
                            index1++;
                            var TenSP=rsSP.Fields.Item("TenSP").Value;
                            var GiaSP=rsSP.Fields.Item("GiaSP").Value;
                            var AnhSP=rsSP.Fields.Item("AnhSP").Value;
                    %>
                    <form action="SanPham/ChiTietSanPham.asp" style="float:left;">
                        <div class="sanpham" style="margin-top:10px;">
                            <center><button type="submit" style="border:none;background-color:transparent;outline:none;cursor:pointer;"><img width="150px" height="150px" src="photo/<%=AnhSP%>" title="<%=TenSP%>" alt="<%=TenSP%>"></button></center>
                            <div class="name">
                                <table>
                                    <tr height="50px">
                                        <td>
                                            <input style="background-color:transparent;outline:none;border:none;font-weight:bold;font-family:'Times New Roman';width:200px;cursor:default;font-size:20px;" name="TenSP" title="<%=TenSP%>" value="<%=TenSP%>" readonly />
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                            <b><font color="#FF0000" size="+1">Giá: <%=GiaSP%> VNĐ</font></b>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                    <%
                            rsSP.MoveNext();
                        }
                    %>
                </div>
            </td>
        </tr>
    </table>
<table class="div" align="center">
    <tr>
        <td valign="top">
            <script type="text/javascript">
            epi_id = 'epi-widget-container';
            epi_width = '100%';
            epi_height = '240px';
            epi_theme = 'widgetDisplayThemeGrey';
            epi_border = 0;
            epi_target = 0;
            </script>
            <script type="text/javascript" src="http://www.baomoi.com/Widget/JS/Widget.js"></script>
            <script type="text/javascript" src="http://www.baomoi.com/Widget/GenerateJS.aspx?zone=76&count=10&ntype=mostrecent&dtype=2&target=0"></script>
        </td>
    </tr>
</table>
    

<link rel="shortcut icon" href="Templates/mobilesmartphoneicon.ico">
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
  <script type="text/javascript" src="css/ToTop.js"></script>
  <div id="top">
    <a href="#">
      <img src="photo/backtotop.png" width="40px" />
    </a>
  </div>
</body>
<!-- InstanceEnd --></html>
