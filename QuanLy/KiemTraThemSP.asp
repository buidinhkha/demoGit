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
</ul><br><br>
<%
    var TenSP = Request("TenSP");
        GiaSP = Request("GiaSP");
        AnhSP = Request("AnhSP");
        NSX = Request("NSX");
        LoaiSP = Request("LoaiSP");
        ManHinh = Request("ManHinh");
        HDH = Request("HDH");
        CameraChinh = Request("CameraChinh");
        CameraPhu = Request("CameraPhu");
        CPU = Request("CPU");
        RAM = Request("RAM");
        ROM = Request("ROM");
        KetNoi = Request("KetNoi");
        Sim = Request("Sim");
        TheNho = Request("TheNho");
        Pin = Request("Pin");
        KM = Request("KM");
        TTThem = Request("TTThem");
    cnn = Server.CreateObject("ADODB.Connection");
    cnn.Open(cStr);
    rs = Server.CreateObject("ADODB.Recordset");
    SP = "SELECT TenSP FROM ThongTinSP WHERE TenSP = N'"+TenSP+"'";
    rs.Open(SP, cnn);
    if(rs.EOF){
	    ThemSP = "INSERT INTO ThongTinSP VALUES(N'" + TenSP + "','" + GiaSP + "','" + AnhSP + "','" + NSX + "','" + LoaiSP + "',N'" + ManHinh + "',N'" + HDH + "',N'" + CameraChinh + "',N'" + CameraPhu + "',N'" + CPU + "',N'" + RAM + "',N'" + ROM + "',N'" + KetNoi + "',N'" + Sim + "',N'" + TheNho + "',N'" + Pin + "',N'" + KM + "',N'" + TTThem + "', CONVERT(VARCHAR(20), GETDATE(), 113))";
	    cnn.Execute(ThemSP);
%>
    <script>
        alert("Bạn đã thêm sản phẩm thành công.");
        document.location = "XemSP.asp";
    </script>
<%
    }
    if(!rs.EOF){
%>
    <script>
        alert("Tên sản phẩm đã được sử dụng, bạn vui lòng chọn tên khác...");
        document.location = "ThemSP.asp";
    </script>
<% } %>
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