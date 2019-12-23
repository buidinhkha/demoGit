<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
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
    <form action="TimKiem.asp">
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
    | <a href="../TaiKhoan/DangXuat.asp"><font color="#FF3300"><b>Đăng xuất</b></font></a>
	<%
          cnnTB=Server.CreateObject("ADODB.Connection");
          cnnTB.Open(cStr);
          rsTB=Server.CreateObject("ADODB.Recordset");
          TB = "SELECT Count(MaPH) AS SLTB FROM PhanHoiTV WHERE TrangThai = 'CHUADOC' AND ThanhVien = '"+Session("Ten")+"'";
          rsTB.Open(TB,cnnTB);
          var SLTB =rsTB.Fields.Item("SLTB").Value;
      %>
      <a href="../Thanh_Vien/ThongBao.asp" style="margin-left:3%;border:none;"><img src="../photo/thongbao.png" width="30px" title="Thông báo" /><b style="color:red;vertical-align:top;"><%=SLTB%></b></a>
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
<div class="div" id="duongdan">
    <font color="#666666">
    	<a id="duongdan" href="../home.asp" class="iconhome">Trang chủ</a>
    	&ensp;>&ensp;Công nghệ
    </font>
</div>

<div class="div">
    <a href="dienthoai.asp" class="danhmuc">Điện thoại</a>
</div>
<table width="100%">
	<tr>
    	<td>
<!--Điện thoại-->
<div class="div" style="height:350px;">
		<%
			//tạo đối tượng Connection
			cnn=Server.CreateObject("ADODB.Connection");
			//Mở Connection String cStr trong cnn.asp
			cnn.Open(cStr);
			//tạo đối tượng Recordset
			rs=Server.CreateObject("ADODB.Recordset");
			//tạo câu lệnh SQL
			sSQL = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP, AnhSP FROM ThongTinSP WHERE LoaiSP='DT' ORDER BY ThoiGianThem DESC";
			//thực thi câu lệnh SQL
			rs.Open(sSQL,cnn);

			var index1=0;
			rs.MoveFirst();
			while(index1 < 5){
				index1++;
			var TenSP=rs.Fields.Item("TenSP").Value;
			var GiaSP=rs.Fields.Item("GiaSP").Value;
			var AnhSP=rs.Fields.Item("AnhSP").Value;
		%>
	<form action="ChiTietSanPham.asp" style="float:left;">
                <div class="sanpham" style="margin-top:10px;">
                    <center><button type="submit" style="border:none;background-color:transparent;outline:none;cursor:pointer;"><img width="150px" height="150px" src="../photo/<%=AnhSP%>" title="<%=TenSP%>" alt="<%=TenSP%>"></button></center>
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
			rs.MoveNext(); //duyệt record tiếp theo
			}
		%>
</div>
<div class="div">
	<a href="maytinhbang.asp" class="danhmuc">Máy tính bảng</a>
</div>
		</td>
	</tr>
    <tr>
    	<td>
<!--Máy tính bảng-->
<div class="div" style="height:350px;">
		<%
			
			//tạo đối tượng Connection
			cnnmtb=Server.CreateObject("ADODB.Connection");
			//Mở Connection String cStr trong cnn.asp
			cnnmtb.Open(cStr);
			//tạo đối tượng Recordset
			rs=Server.CreateObject("ADODB.Recordset");
			//tạo câu lệnh SQL
			sSQL1 = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP, AnhSP FROM ThongTinSP WHERE LoaiSP='MTB' ORDER BY ThoiGianThem DESC";
			//thực thi câu lệnh SQL
			rs.Open(sSQL1,cnnmtb);
			var index2=0;
			rs.MoveFirst();
			while(index2 < 5){
				index2++;
			var TenSPmtb=rs.Fields.Item("TenSP").Value;
			var Giamtb=rs.Fields.Item("GiaSP").Value;
			var AnhSPmtb=rs.Fields.Item("AnhSP").Value;
		%>
	<form action="ChiTietSanPham.asp" style="float:left;">
                <div class="sanpham" style="margin-top:10px;">
                    <center><button type="submit" style="border:none;background-color:transparent;outline:none;cursor:pointer;"><img width="150px" height="150px" src="../photo/<%=AnhSPmtb%>" title="<%=TenSPmtb%>" alt="<%=TenSPmtb%>"></button></center>
                    <div class="name">
                        <table>
                            <tr height="50px">
                                <td>
                                    <input style="background-color:transparent;outline:none;border:none;font-weight:bold;font-family:'Times New Roman';width:200px;cursor:default;font-size:20px;" name="TenSP" title="<%=TenSPmtb%>" value="<%=TenSPmtb%>" readonly />
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    <b><font color="#FF0000" size="+1">Giá: <%=Giamtb%> VNĐ</font></b>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </form>
        <%
			rs.MoveNext(); //duyệt record tiếp theo
			}
		%>
</div>

<div class="div">
	<a href="phukien.asp" class="danhmuc">Phụ kiện</a>
</div>
		</td>
	</tr>
    <tr>
    	<td>
<!--Phụ kiện-->
<div class="div" style="height:370px; margin-bottom:10px;">
	<%
			
			//tạo đối tượng Connection
			cnnpk=Server.CreateObject("ADODB.Connection");
			//Mở Connection String cStr trong cnn.asp
			cnnpk.Open(cStr);
			//tạo đối tượng Recordset
			rs=Server.CreateObject("ADODB.Recordset");
			//tạo câu lệnh SQL
			sSQL2 = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP, AnhSP FROM ThongTinSP WHERE LoaiSP='PK' ORDER BY ThoiGianThem DESC";
			//thực thi câu lệnh SQL
			rs.Open(sSQL2,cnnpk);
			var index2=0;
			rs.MoveFirst();
			while(index2 < 5){
				index2++;
			var TenSPpk=rs.Fields.Item("TenSP").Value;
			var GiaPK=rs.Fields.Item("GiaSP").Value;
			var AnhSPpk=rs.Fields.Item("AnhSP").Value;
		%>
	<form action="ChiTietSanPham.asp" style="float:left;">
                <div class="sanpham" style="margin-top:10px;">
                    <center><button type="submit" style="border:none;background-color:transparent;outline:none;cursor:pointer;"><img width="150px" height="150px" src="../photo/<%=AnhSPpk%>" title="<%=TenSPpk%>" alt="<%=TenSPpk%>"></button></center>
                    <div class="name">
                        <table>
                            <tr height="50px">
                                <td>
                                    <input style="background-color:transparent;outline:none;border:none;font-weight:bold;font-family:'Times New Roman';width:200px;cursor:default;font-size:20px;" name="TenSP" title="<%=TenSPpk%>" value="<%=TenSPpk%>" readonly />
                                </td>
                            </tr>
                            <tr align="center">
                                <td>
                                    <b><font color="#FF0000" size="+1">Giá: <%=GiaPK%> VNĐ</font></b>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                </form>
        <%
			rs.MoveNext(); //duyệt record tiếp theo
			}
		%>
</div>
		</td>
	</tr>
</table>
<link rel="shortcut icon" href="../Templates/mobilesmartphoneicon.ico">
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
