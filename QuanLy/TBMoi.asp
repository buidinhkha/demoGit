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
                <li class="hoatdongtk" style="color:#F00">Phản hồi</li>
                <a href="ThanhVienHoatDong.asp"><li class="litaikhoan">Thành viên hoạt động</li></a>
                <a href="ThanhVienDaKhoa.asp"><li class="litaikhoan">Thành viên đã khoá</li></a>
            </ul>
        </td>
        <td width="78%" valign="top">
       	  <ul>
                <li class="HoatDongPH">Viết thông báo mới</li>
            	<a href="PhanHoi.asp"><li class="PhanHoi">Phản hồi từ thành viên</li></a>
                 <a href="PhanHoiDaTL.asp"><li class="PhanHoi">Phản hồi đã trả lời</li></a>
                <a href="PhanHoiKVL.asp"><li class="PhanHoi">Phản hồi từ khách vãng lai</li></a>
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
				function PHALL(){
					var ChuDeALL = document.getElementById('ChuDeALL').value;
					var NoiDungALL = document.getElementById('NoiDungALL').value;
					reChuDeALL = /[^\s]/;
					if(reChuDeALL.test(ChuDeALL) == false || ChuDeALL.length > 50){
						alert("Chủ đề không được để trống, tối đa 50 kí tự.");
						document.getElementById('ChuDeALL').focus();
						return false;
						}
					reNoiDungALL = /[^\s]/;
					if(reNoiDungALL.test(NoiDungALL) == false){
						alert("Nội dung không được để trống.");
						document.getElementById('NoiDungALL').focus();
						return false;
						}
					}
			</script>
            <form action="ThongBaoRieng.asp" onSubmit="return PH();">
                <table style="color:rgb(0, 255, 255)">
                    <tr>
                        <td>
                            Tên thành viên:
                        </td>
                        <td>
                            <select name="TenTV">
                                <%
				                    cnn=Server.CreateObject("ADODB.Connection");
				                    cnn.Open(cStr);
				                    rs=Server.CreateObject("ADODB.Recordset");
				                    TaiKhoan = "SELECT TenDangNhap FROM ThanhVien";
				                    rs.Open(TaiKhoan,cnn);
				                    var index1=0;
				                    rs.MoveFirst();
				                    while(!rs.EOF){
				                            var TenTV = rs.Fields.Item("TenDangNhap").Value;
				
			                    %>
                                <option value="<%=TenTV%>"><%=TenTV%></option>
                                <%
                                    rs.MoveNext();
                                    }
	                            %>
                            </select>
                        </td>
                    </tr>
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
                        <td><textarea rows="5" cols="70" name="NoiDungMoi" id="NoiDung"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/send.png" width="40px" title="Gửi" /></button>
                            <a href="PhanHoi.asp">
                                <button type="button" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/Close.png" width="40px" title="Huỷ bỏ" /></button>
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <div style="background-color:aqua;font-size:30px;width:45%;font-family:'UTMAzuki';cursor:default;border-bottom-right-radius:25px;">Thông báo cho tất cả thành viên</div>
            <form action="ThongBaoTatCa.asp" onSubmit="return PHALL();">
                <table style="color:rgb(0, 255, 255)">
                    <tr>
                        <td>
                            Tên thành viên:
                        </td>
                        <td><input name="YES" value="Tất cả" readonly /></td>
                    </tr>
                    <tr>
                        <td>
                            Chủ đề:
                        </td>
                        <td>
                            <input type="text" name="ChuDeMoi" id="ChuDeALL"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Nội dung:</td>
                        <td><textarea rows="5" cols="70" name="NoiDungMoi" id="NoiDungALL"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><button type="submit" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/send.png" width="40px" title="Gửi" /></button>
                            <a href="PhanHoi.asp">
                                <button type="button" style="border:0px; background-color:transparent;outline:none;cursor:pointer;"><img src="../photo/Close.png" width="40px" title="Huỷ bỏ" /></button>
                            </a>
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
