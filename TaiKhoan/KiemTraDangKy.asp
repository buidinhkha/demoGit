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

<body onselectstart="return false" oncontextmenu="return false">
<div class="div">
    <div style="float:left;">
        <a href="../home.asp">
            <img src="../photo/logo.png" width="120" height="120" alt="Cửa hàng SmartPhone" title="Cửa hàng SmartPhone">
        </a>
  </div>
  <div style="padding-top:30px;">
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
    | <a href="DangXuat.asp"><font color="#FF3300"><b>Đăng xuất</b></font></a>
	<%		
				}
			else{
		%>
<a href="dangnhap.asp" style="margin-left:5%"><font color="#FF3300"><b>Đăng nhập</b></font></a>
<% } %>
  </div>
</div>
<br>
<br>
<%
	var Ten=Request("Ten");
	MatKhau=Request("MatKhau");
	HoVaTen=Request("HoVaTen");
	Email=Request("Email");
	SDT=Request("SDT");
	DiaChi=Request("DiaChi");
	NgaySinh=Request("NgaySinh");
	GT=Request("GT");
	//Tạo đối tương Connection
	cnn=Server.CreateObject("ADODB.Connection");
	//Mở Connecttion dùng cầu nối ODBC
	cnn.Open(cStr);
	rs=Server.CreateObject("ADODB.Recordset");
	//Tạo câu lệnh SQL
	sTK = "SELECT TenDangNhap FROM ThanhVien WHERE TenDangNhap='"+ Ten +"'";
	//Thực thi câu lệnh SQL
	rs.Open(sTK, cnn);
	if(rs.EOF){
	    InsertTK="INSERT INTO ThanhVien VALUES('"+Ten+"', '"+MatKhau+"', N'"+HoVaTen+"', '"+Email+"', '"+SDT+"', '"+NgaySinh+"', N'"+GT+"', CONVERT(VARCHAR(20), GETDATE(), 113), N'"+DiaChi+"', 'YES') INSERT INTO PhanHoiTV VALUES('"+Ten+"', N'Chào mừng thành viên mới của TNTT Shop!','', N'', CONVERT(VARCHAR(20), GETDATE(), 113), N'Chào mừng "+Ten+" đến với TNTT Shop! Chúng tôi rất hân hạnh khi được phục vụ bạn.', 'CHUADOC')";
		cnn.Execute(InsertTK);
%>
		<div class="div" align="center" style="margin-top:100px; margin-bottom:100px; font-size:36px;">
			Đăng Ký Thành Công<br>
			Chúc mừng bạn đã đăng ký thành công!<br>
			<a href="dangnhap.asp"><font color="#FF0000">Đăng nhập</font></a> ngay để tiếp tục mua hàng.
		</div>
<%
	}
	if(!rs.EOF){
%>
<script>
	function test(){
		var Ten = document.getElementById('Ten').value;
		var MatKhau = document.getElementById('MatKhau').value;
		var NhapLaiMatKhau = document.getElementById('NhapLaiMatKhau').value;
		var HoVaTen = document.getElementById('HoVaTen').value;
		var SDT = document.getElementById('SDT').value;
		var Email = document.getElementById('Email').value;
		var DiaChi = document.getElementById('DiaChi').value;
		var NgaySinh = document.getElementById('NgaySinh').value;
		reTen = /^[A-Za-z]+(\w+)?$/; //Những kí tự giữa /^[ và ]+$/ được phép nhập, /[^    ]/ ngược lại.
		if(reTen.test(Ten) == false || Ten.length > 100){	//if(a.length == 0)
			alert("Tên Đăng Nhập giới hạn bởi chữ cái, số và bắt đầu bằng chữ cái.");
			document.getElementById('Ten').focus();
			return false;
			}
		reMatKhau = /^.{6,18}$/;
		if(reMatKhau.test(MatKhau) == false){
			alert("Mật Khẩu gồm 6 - 18 ký tự.");
			document.getElementById('MatKhau').focus();
			return false;
			}
		if(MatKhau != NhapLaiMatKhau){
			alert("Mật khẩu và Xác Nhận Mật Khẩu phải giống nhau.");
			document.getElementById('NhapLaiMatKhau').focus();
			return false;
			}
		reHoVaTen = /[^\s]/;
		if(reHoVaTen.test(HoVaTen) == false){
			alert("Họ Và Tên không được để trống.");
			document.getElementById('HoVaTen').focus();
			return false;
			}
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
		reDiaChi = /[^\s]/;
		if(reDiaChi.test(DiaChi) == false){
			alert("Địa chỉ nhận hàng không được để trống.");
			document.getElementById('DiaChi').focus();
			return false;
			}
		if(NgaySinh == ''){
			alert("Ngày Sinh không được để trống.");
			document.getElementById('NgaySinh').focus();
			return false;
			}
	}
</script>
<div class="div" id="duongdan">
    <font color="#666666">
    	<a id="duongdan" href="../home.asp">Trang chủ</a>
        &ensp;>&ensp;<font color="#FF0000">Đăng Ký</font>
    </font>
</div>
<div style="background-image:url(../photo/anhnen.gif)">
    <div style="padding:30px; margin-left:30%;">
        <font color="#FF0000" face="Segoe UI" size="+3"><b>ĐĂNG KÝ</b></font>
    </div>
    <center><font color="#FF0000">(Vui lòng điền đầy đủ các thông tin bên dưới để đăng ký.)</font></center>
	<form onSubmit="return test();" action="KiemTraDangKy.asp">
      <table width="59%" align="center">
        <tr>
          <td width="29%" align="left" valign="middle" style="font-size:25px;">Tên đăng nhập:</td>
          <td width="71%"><input class="boxlogin" type="text" name="Ten" id="Ten"></td>
        </tr>
        <tr>
          <td align="left" valign="middle" class="FontText">&nbsp;</td>
          <td><strong>(Tên đăng nhập đã được sử dụng, vui lòng chọn tên khác)</strong></td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Mật khẩu:</td>
          <td>
          <input class="boxlogin" type="password" name="MatKhau" id="MatKhau"></td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Xác nhận mật khẩu:</td>
          <td>
          <input class="boxlogin" type="password" name="NhapLaiMatKhau" id="NhapLaiMatKhau"></td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Họ và Tên:</td>
          <td><input class="boxlogin" type="text" name="HoVaTen" id="HoVaTen" placeholder="Họ và tên đầy đủ."></td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Email:</td>
          <td>
          <input class="boxlogin" type="email" name="Email" id="Email" placeholder="Ví dụ: abc@example.com"></td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Số điện thoại:</td>
          <td>
          <input class="boxlogin" type="number" name="SDT" id="SDT"></td>
        </tr>
          <tr>
          <td align="left" valign="middle" style="font-size:25px;">Địa chỉ:</td>
          <td>
          <textarea class="boxlogin" style="resize:none;" rows="3" name="DiaChi" id="DiaChi"></textarea></td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Ngày sinh:</td>
          <td>
              <input class="boxlogin" type="date" max="2010-01-01" min="1950-01-01" name="NgaySinh" id="NgaySinh">
          </td>
        </tr>
        <tr>
          <td align="left" valign="middle" style="font-size:25px;">Giới tính:</td>
          <td><input type="radio" name="GT" value="Nam" checked>
          Nam 
          <input type="radio" name="GT" value="Nữ">
          Nữ
          </td>
        </tr>
        <tr>
          <td></td>
          <td>
          	<input type="checkbox" checked required> <b>Tôi đồng ý với <a href="DieuKhoan.asp#DangKy" target="_blank">Điều khoản</a> của TNTT SHOP.</b>
          </td>
        </tr>
        <tr>
          <td align="left" valign="middle">&nbsp;</td>
          <td>
          <input class="nutlogin" type="submit" name="submit" id="textfield2" value="Đăng Ký">
          <input class="nutlogin" type="reset" name="reset" id="textfield3" value="Nhập lại"></td>
        </tr>
      </table>
  </form>
<% 
	}
%>
<link rel="shortcut icon" href="../Templates/mobilesmartphoneicon.ico">
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
<div id="top"><a href="#"><img src="../photo/backtotop.png" width="40px" /></a></div>
</body>
</html>