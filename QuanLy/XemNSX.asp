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
<div class="div" style="margin-top: 30px">
        <table border="1" style="width:100%;color:white;">
            <tr>
                <td align="center" width="20%">Logo Nhà sản xuất</td>
                <td align="center" width="60%">Thông tin NSX</td>
                <td align="center" width="20%">Chức năng</td>
            </tr>
            <%
                cnn=Server.CreateObject("ADODB.Connection");
                cnn.Open(cStr);
                rs=Server.CreateObject("ADODB.Recordset");
                NSX = "SELECT * FROM NhaSanXuat";
                rs.Open(NSX,cnn);
                var index=0;
                rs.MoveFirst();
                while(!rs.EOF){
                    index++;
                    var TenNSX = rs.Fields.Item("TenNSX").Value;
                    Logo = rs.Fields.Item("Logo").Value;
                    Website = rs.Fields.Item("Website").Value;
                    SDT = rs.Fields.Item("SDT").Value;
                    Email = rs.Fields.Item("Email").Value;
                    DiaChi = rs.Fields.Item("DiaChi").Value;
            %>
            <form action="SuaNSX.asp">
                <tr>
                    <td valign="top" align="center"><img src="../photo/<%=Logo%>" width="150px" /></td>
                    <td valign="top">
                        Tên nhà sản xuất: <input name="TenNSX" value="<%=TenNSX%>" style="background-color:transparent;color:red;border:none;font-weight:bold;" readonly/><br /><br />
                        -Website: <%=Website%><br /><br />
                        -Số điện thoại: <%=SDT%><br /><br />
                        -Email: <%=Email%><br /><br />
                        -Địa chỉ nhà sản xuất: <%=DiaChi%>
                    </td>
                    <td valign="top" align="center">
                        <input type="submit" name="submit" class="nutlogin" value="Cập nhật" />
                        <button type="button" name="Xoa" class="nutlogin" onclick="a=confirm('Bạn chắc chắn muốn xoá sản phẩm này?'); if(a == true){document.location='XoaNSX.asp?TenNSX=<%=TenNSX%>';}">Xoá NSX</button>
                    </td>
                </tr>
            </form>
            <%
                    rs.MoveNext();
                }
            %>
        </table>
</div>
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
