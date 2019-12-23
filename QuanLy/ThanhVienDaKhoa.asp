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
                <a href="PhanHoi.asp"><li class="litaikhoan">Phản hồi</li></a>
                <a href="ThanhVienHoatDong.asp"><li class="litaikhoan">Thành viên hoạt động</li></a>
                <li class="hoatdongtk" style="color:#F00">Thành viên đã khoá</li>
            </ul>
        </td>
        <td width="78%" valign="top">
        	<%
				//tạo đối tượng Connection
				cnn=Server.CreateObject("ADODB.Connection");
				//Mở Connection String cStr trong cnn.asp
				cnn.Open(cStr);
				//tạo đối tượng Recordset
				rs=Server.CreateObject("ADODB.Recordset");
				//tạo câu lệnh SQL
				sSQL = "SELECT * FROM ThanhVien WHERE HoatDong = 'NO'";
				//thực thi câu lệnh SQL
				rs.Open(sSQL,cnn);
                if(!rs.EOF){
				var index1=0;
                rs.MoveFirst();
                while(!rs.EOF){
                    index1++;
				var Ten = rs.Fields.Item("TenDangNhap").Value;
					HoVaTen = rs.Fields.Item("HoVaTen").Value;
					SDT = rs.Fields.Item("SDT").Value;
					Email = rs.Fields.Item("Email").Value;
					NgaySinh = rs.Fields.Item("NgaySinh").Value;
					GT = rs.Fields.Item("GT").Value;
					DiaChi = rs.Fields.Item("DiaChi").Value;
			%>
            <div style="border:solid 1px white;border-radius:20px; padding:20px; font-weight:bold; width:60%; font-size:18px;">
            <form action="MoThanhVien.asp" style="color:rgb(3,201,191)">
                Tên đăng nhập: <font color="#E6E6E6"><input hidden="hidden" name="Ten" value="<%=Ten%>"><%=Ten%></font><br>
                <br>
                Họ và tên: <font color="#E6E6E6"><%=HoVaTen%></font><br>
                <br>
                Số điện thoại: <font color="#E6E6E6"><%=SDT%></font><br>
                <br>
                Email: <font color="#E6E6E6"><%=Email%></font><br>
                <br>
                Ngày sinh: <font color="#E6E6E6"><%=NgaySinh%></font><br>
                <br>
                Giới tính: <font color="#E6E6E6"><%=GT%></font><br>
                <br>
                Địa chỉ: <font color="#E6E6E6"><%=DiaChi%></font><br>
                <input class="nutlogin" type="submit" value="Mở khoá thành viên">
            </form>
            </div>
            <br><br>
            <%
                    rs.MoveNext(); //duyệt record tiếp theo
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
