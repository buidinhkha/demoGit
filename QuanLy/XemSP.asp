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
<table>
    <tr>
        <td>
            <div class="div" style="margin-top: 30px">
                <%
                    cnnSP=Server.CreateObject("ADODB.Connection");
                    cnnSP.Open(cStr);
                    rs=Server.CreateObject("ADODB.Recordset");
                    SP = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP, AnhSP FROM ThongTinSP ORDER BY ThoiGianThem DESC";
                    rs.Open(SP,cnnSP);
                    var index1=0;
                    rs.MoveFirst();
                    while(!rs.EOF){
                        index1++;
                        var TenSP=rs.Fields.Item("TenSP").Value;
                        var GiaSP=rs.Fields.Item("GiaSP").Value;
                        var AnhSP=rs.Fields.Item("AnhSP").Value;
                %>
                <form action="ThongTinSP.asp" target="_blank" style="float:left;">
                <div class="sanpham" style="margin-top:10px;height:330px;">
                    <center><button type="submit" style="border:none;background-color:transparent;outline:none;cursor:pointer;"><img width="150px" height="150px" src="../photo/<%=AnhSP%>" title="Nhấp vào để xem chi tiết" alt="<%=TenSP%>"></button></center>
                    <div class="name">
                        <table>
                            <tr height="50px">
                                <td>
                                    <input style="background-color:transparent;color:white;outline:none;border:none;font-weight:bold;width:200px;cursor:default;" name="TenSP" value="<%=TenSP%>" readonly />
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    <b><font color="#FF0000" size="+1">Giá: <%=GiaSP%> VNĐ</font></b>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <button type="button" name="Sua" class="nutlogin" onclick="document.location='SuaSP.asp?TenSP=<%=TenSP%>'">Cập nhật SP</button>
                                    <button type="button" name="Xoa" class="nutlogin" onclick="a=confirm('Bạn chắc chắn muốn xoá sản phẩm này?'); if(a == true){document.location='XoaSP.asp?TenSP=<%=TenSP%>';}">Xoá SP</button></td></tr>
                        </table>
                    </div>
                </div>
                </form>
                <%
                        rs.MoveNext();
                    }
                %>
            </div>
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
