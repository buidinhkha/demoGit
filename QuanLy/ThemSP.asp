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
<script>
	function ThemSP(){
		var TenSP = document.getElementById('TenSP').value;
		var GiaSP = document.getElementById('GiaSP').value;
		var AnhSP = document.getElementById('AnhSP').value;
		reTenSP = /[^\s]/;
		if(reTenSP.test(TenSP) == false){
			alert("Tên sản phẩm không được để trống.");
			document.getElementById('TenSP').focus();
			return false;
			}
		if(GiaSP == '' || GiaSP > 2000000000 || GiaSP < 0){
			alert("Giá sản phẩm không được để trống và nằm trong khoảng 0 - 2 tỷ.");
			document.getElementById('GiaSP').focus();
			return false;
			}
		if(AnhSP == ''){
			alert("Ảnh sản phẩm không được để trống.");
			document.getElementById('AnhSP').focus();
			return false;
			}
		if((AnhSP.lastIndexOf(".jpg") == -1) && (AnhSP.lastIndexOf(".png") == -1) && (AnhSP.lastIndexOf(".gif") == -1))
				{
				alert("Chỉ hỗ trợ định dạng: jpg, png, gif.");
				document.getElementById('AnhSP').focus();
				return false;
				}
	}
</script>
<form id="myForm" action="KiemTraThemSP.asp" onSubmit="return ThemSP();">
    <table width="50%" border="0" align="center">
        <tr>
            <td style="background:#3F9;padding:5px;font-size:30px;color:red;" colspan="2"><b>Thêm sản phẩm</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Tên Sản Phẩm:</td>
            <td style="background:#3F9;padding:5px;"><input type="text" name="TenSP" id="TenSP"></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Giá Niêm Yết:</td>
            <td style="background:#3F9;padding:5px;"><input type="number" name="GiaSP" id="GiaSP">
                (Ví dụ: 1000000)</td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Nhà sản xuất:</td>
            <td style="background:#3F9;padding:5px;">
                <select name="NSX">
                    <%cnn=Server.CreateObject("ADODB.Connection");
	                cnn.Open(cStr);
	                rs=Server.CreateObject("ADODB.Recordset");
	                NSX = "SELECT TenNSX FROM NhaSanXuat";
	                rs.Open(NSX, cnn);
	                var index=0;
	                rs.MoveFirst();
	                while(!rs.EOF){
	                    index++;
	                    var TenNSX=rs.Fields.Item("TenNSX").Value;
                    %>
                    <option value="<%=TenNSX%>"><%=TenNSX%></option>
                    <%
		                rs.MoveNext();
		                }
	                %>
                </select>
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Loại sản phẩm:</td>
            <td style="background:#3F9;padding:5px;">
                <select name="LoaiSP">
                    <option value="DT">Điện thoại</option>
                    <option value="MTB">Máy tính bảng</option>
                    <option value="PK">Phụ kiện</option>
                </select>
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;"><font color="red">*</font>Ảnh:</td>
            <td style="background:#3F9;padding:5px;"><input type="file" name="AnhSP" id="AnhSP"></td>
        </tr>
        <tr>
            <td colspan="2" style="background:#3F9;padding:5px;font-size:30px;color:red;"><b>Thông số kỹ thuật</b></td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Màn hình:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="ManHinh" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Hệ điều hành:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="HDH" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Camera chính:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="CameraChinh" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Camera phụ:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="CameraPhu" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">CPU:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="CPU" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">RAM</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="RAM" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Bộ nhớ trong:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="ROM" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Kết nối:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="KetNoi" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Thẻ sim:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="Sim" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Hỗ trợ thẻ nhớ:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="TheNho" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Dung lượng Pin:</td>
            <td style="background:#3F9;padding:5px;">
                <input type="text" name="Pin" />
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Khuyến mãi/tặng kèm:</td>
            <td style="background:#3F9;padding:5px;">
                <textarea style="resize:none;" cols="50" rows="3" name="KM" placeholder="Nhập quà tặng..."></textarea>
            </td>
        </tr>
        <tr>
            <td style="background:#3F9;padding:5px;">Thông tin khác:</td>
            <td style="background:#3F9;padding:5px;">
                <textarea style="resize:none;" cols="50" rows="5" name="TTThem" placeholder="Nhập thông tin khác của sản phẩm..."></textarea>
            </td>
        </tr>
        <tr>
        <td style="background:#3F9;padding:5px;border-bottom-left-radius:15px;">&nbsp;</td>
        <td style="background:#3F9;padding:5px;border-bottom-right-radius:15px;">
        	<input type="submit" class="nutlogin" name="submit" id="submit" value="Đồng ý">
          	<input type="reset" class="nutlogin" name="reset" id="reset" value="Huỷ bỏ"></td>
        </tr>
    </table>
</form>
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