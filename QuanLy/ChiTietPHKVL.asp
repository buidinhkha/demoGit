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
    	<td width="20%" valign="top">
        	<ul style="display:block; padding:0px; list-style-type:none; margin-right:20px;">
            	<li class="QuanLi"><font size="+2">Quản Lý Thành Viên</font></li>
                <li class="hoatdongtk" style="color:#F00">Phản hồi</li>
                <a href="ThanhVienHoatDong.asp"><li class="litaikhoan">Thành viên hoạt động</li></a>
                <a href="ThanhVienDaKhoa.asp"><li class="litaikhoan">Thành viên đã khoá</li></a>
            </ul>
        </td>
        <td width="60%" valign="top">
       	  <ul>
                <a href="TBMoi.asp"><li class="PhanHoi">Viết thông báo mới</li></a>
            	<a href="PhanHoi.asp"><li class="PhanHoi">Phản hồi từ thành viên</li></a>
                 <a href="PhanHoiDaTL.asp"><li class="PhanHoi">Phản hồi đã trả lời</li></a>
                <a href="PhanHoiKVL.asp"><li class="PhanHoi">Phản hồi từ khách vãng lai</li></a>
            </ul>
            <%
                var MaKVL = Request("MaKVL");
				cnn=Server.CreateObject("ADODB.Connection");
				cnn.Open(cStr);
				rs=Server.CreateObject("ADODB.Recordset");
				CTPH = "SELECT * FROM PhanHoiKVL WHERE MaKVL = '" + MaKVL + "' UPDATE PhanHoiKVL SET TrangThai = 'DADOC' WHERE MaKVL = '" + MaKVL + "'";
				rs.Open(CTPH,cnn);
				var MaKVL = rs.Fields.Item("MaKVL").Value;
				Email = rs.Fields.Item("Email").Value;
				SDT = rs.Fields.Item("SDT").Value;
				TGPhanHoi = rs.Fields.Item("TGPhanHoi").Value;
				NoiDung = rs.Fields.Item("NoiDung").Value;
			%>
            <script>
                function XoaPH(){
                    HoiXoa = confirm("Bạn có muốn xoá phản hồi này không?");
                    if(HoiXoa == true){
                        document.location = "XoaPHKVL.asp?MaKVL=<%=MaKVL%>";
                    }
                }
            </script>
            <form action="DanhDauChuaDoc.asp">
            	<table style="color:rgb(255, 0, 180)">
                    <tr>
                        <td><b>Mã phản hồi khách vãng lai:</b></td>
                        <td><input type="text" style="border:none;outline:none;background-color:transparent;color:white;" name="MaKVL" value="<%=MaKVL%>" readonly/></td>
                    </tr>
                    <tr>
                        <td><strong>Người gửi:</strong></td>
                        <td><input style="color:#F00; border:none; background-color:transparent; font-weight:bold;" name="Email" value="<%=Email%>" readonly></td>
                    </tr>
                    <tr>
                        <td><strong>Thời gian gửi:</strong></td>
                        <td><input style="border:none; background-color:transparent; color:white;" name="TGPhanHoi" value="<%=TGPhanHoi%>" readonly></td>
                    </tr>
                    <tr>
                        <td><b>Số điện thoại:</b></td>
                        <td><font color="white"><%=SDT%></font></td>
                    </tr>
                    <tr>
                        <td valign="top"><b>Nội dung:</b></td>
                        <td><textarea disabled style="background-color:indigo; border:groove 1px; color:white;" rows="5" cols="50"><%=NoiDung%></textarea></td>
                    </tr>
                    <tr>
                        <td align="right">
                            <button type="button" title="Xoá" onclick="return XoaPH()" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/delete_mail.png" width="50px" title="Xoá" /></button>
                        </td>
                        <td>
                            <input type="submit" class="nutlogin" name="submit" value="Đánh dấu là chưa đọc" />
                        </td>
                    </tr>
                </table>
            </form>
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
