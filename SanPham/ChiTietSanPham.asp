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
    	<a id="duongdan" href="../home.asp" class="iconhome">Trang chủ</a>
    	&ensp;>&ensp;<a id="duongdan" href="congnghe.asp">Công nghệ</a>
        &ensp;>&ensp;Chi tiết sản phẩm
</div>
<table width="100%" class="div">
  <tr>
    <td width="14%" valign="top">
        <div>
            <h3><i class="icondanhmuc"></i> DANH MỤC</h3>
            <ul class="ul">
                <a href="dienthoai.asp"><li class="li"><i class="icondt"></i> Điện thoại</li></a>
                <a href="maytinhbang.asp"><li class="li"><i class="iconmtb"></i> Máy tính bảng</li></a>
                <a href="phukien.asp"><li class="li"><i class="iconpk"></i> Phụ kiện</li></a>
            </ul>
        </div>
	</td>
    <td width="86%" valign="top">
    <%
		var TenSP = Request("TenSP");
		cnn=Server.CreateObject("ADODB.Connection");
		cnn.Open(cStr);
		rsSP=Server.CreateObject("ADODB.Recordset");
		LoaiSP = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP,NSX,LoaiSP, AnhSP,ManHinh,HDH,CameraChinh,CameraPhu,CPU,RAM,ROM,KetNoi,Sim,TheNho,Pin,KM,TTThem,ThoiGianThem FROM ThongTinSP WHERE TenSP = N'"+TenSP+"'";
		rsSP.Open(LoaiSP,cnn);
		if(!rsSP.EOF){
		    var TenSP = rsSP.Fields.Item("TenSP").Value;
		    GiaSP = rsSP.Fields.Item("GiaSP").Value;
		    NSX = rsSP.Fields.Item("NSX").Value;
		    LoaiSP = rsSP.Fields.Item("LoaiSP").Value;
		    AnhSP = rsSP.Fields.Item("AnhSP").Value;
		    ManHinh = rsSP.Fields.Item("ManHinh").Value;
		    HDH = rsSP.Fields.Item("HDH").Value;
		    CameraChinh = rsSP.Fields.Item("CameraChinh").Value;
		    CameraPhu = rsSP.Fields.Item("CameraPhu").Value;
		    CPU = rsSP.Fields.Item("CPU").Value;
		    RAM = rsSP.Fields.Item("RAM").Value;
		    ROM = rsSP.Fields.Item("ROM").Value;
		    KetNoi = rsSP.Fields.Item("KetNoi").Value;
		    Sim = rsSP.Fields.Item("Sim").Value;
		    TheNho = rsSP.Fields.Item("TheNho").Value;
		    Pin = rsSP.Fields.Item("Pin").Value;
		    KM = rsSP.Fields.Item("KM").Value;
		    TTThem = rsSP.Fields.Item("TTThem").Value;
		    if(LoaiSP == 'DT' || LoaiSP == 'MTB'){
	%>
        <table width="100%">
            <tr>
                <td style="background-color:rgba(0, 255, 239, 0.59);margin:0px;font-size:30px;color:red;padding-left:20px;font-family:Arial;" colspan="3"><%=               TenSP%></td>
            </tr>
            <tr>
                <td width="30%" valign="top"><img src="../photo/<%=AnhSP%>" width="300px" /></td>
                <td width="35%" valign="top">
                    <table width="100%" style="box-shadow: 10px 0px 0px 0px rgb(189, 189, 189);">
                        <tr style="background-color:rgb(245, 245, 245);">
                            <td style="padding:8px 5px;" width="40%">Hãng sản xuất</td>
                            <td style="padding:8px 5px;" width="60%"><%=               NSX%></td>
                        </tr>
                        <tr>
                            <td style="padding:8px 5px;" width="40%">Màn hình</td>
                            <td style="padding:8px 5px;" width="60%"><%=               ManHinh%></td>
                        </tr>
                        <tr style="background-color:rgb(245, 245, 245);">
                            <td style="padding:8px 5px;" width="40%">Hệ điều hành</td>
                            <td style="padding:8px 5px;" width="60%"><%=               HDH%></td>
                        </tr>
                        <tr>
                            <td style="padding:8px 5px;" width="40%">Camera chính</td>
                            <td style="padding:8px 5px;" width="60%"><%=               CameraChinh%></td>
                        </tr>
                        <tr style="background-color:rgb(245, 245, 245);">
                            <td style="padding:8px 5px;" width="40%">Camera phụ</td>
                            <td style="padding:8px 5px;" width="60%"><%=               CameraPhu%></td>
                        </tr>
                        <tr>
                            <td style="padding:8px 5px;" width="40%">CPU</td>
                            <td style="padding:8px 5px;" width="60%"><%=               CPU%></td>
                        </tr>
                        <tr style="background-color:rgb(245, 245, 245);">
                            <td style="padding:8px 5px;" width="40%">RAM</td>
                            <td style="padding:8px 5px;" width="60%"><%=               RAM%></td>
                        </tr>
                        <tr">
                            <td style="padding:8px 5px;" width="40%">ROM</td>
                            <td style="padding:8px 5px;" width="60%"><%=               ROM%></td>
                        </tr>
                        <tr style="background-color:rgb(245, 245, 245);">
                            <td style="padding:8px 5px;" width="40%">Kết nối</td>
                            <td style="padding:8px 5px;" width="60%"><%=               KetNoi%></td>
                        </tr>
                        <tr>
                            <td style="padding:8px 5px;" width="40%">Thẻ sim</td>
                            <td style="padding:8px 5px;" width="60%"><%=               Sim%></td>
                        </tr>
                        <tr style="background-color:rgb(245, 245, 245);">
                            <td style="padding:8px 5px;" width="40%">Hỗ trợ thẻ nhớ</td>
                            <td style="padding:8px 5px;" width="60%"><%=               TheNho%></td>
                        </tr>
                        <tr>
                            <td style="padding:8px 5px;" width="40%">Dung lượng pin</td>
                            <td style="padding:8px 5px;" width="60%"><%=               Pin%></td>
                        </tr>
                    </table>
                </td>
                <td width="35%" valign="top" style="background-color:rgb(239, 239, 239);">
                    <table width="100%" style="padding:8px 5px;">
                        <tr>
                            <td><b>Giá bán:</b></td>
                            <td><font color="red" size="+2"><%=               GiaSP%> VNĐ</font></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border:solid 1px rgb(196, 196, 196);padding:10px 5px;background-color:rgb(245, 234, 210);line-height:1.5;">
                                <b>Bảo hành</b><br />
                                &#9679; Bảo hành (1 năm) tất cả phẩn cứng trên máy (Bao gồm cả màn hình, nguồn,...)<br />
                                &#9679; Phần mềm hỗ trợ miễn phí trọn đời.<br />
                                &#9679; Đổi mới trong 7 ngày đầu nếu phát sinh lỗi.<br />
                                &#9679; Dùng thử 3 ngày miễn phí (không cần lý do hoàn 100% tiền).
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <b style="color:red;font-size:20px;">Khuyến mãi + tặng kèm:</b><br />
                                &rarr; <%=               KM%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <b style="color:red;font-size:20px;">Thông tin khác:</b><br />
                                &rarr; <%=               TTThem%>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <%		    } 
		    if(LoaiSP == 'PK'){
    %>
        <table width="100%">
            <tr>
                <td style="background-color:rgba(0, 255, 239, 0.59);margin:0px;font-size:30px;color:red;padding-left:20px;font-family:Arial;" colspan="2"><%=               TenSP%></td>
            </tr>
            <tr>
                <td width="30%" valign="top"><img src="../photo/<%=AnhSP%>" width="300px" /></td>
                <td width="70%" valign="top" style="background-color:rgb(239, 239, 239);">
                    <table width="100%" style="padding:8px 5px;">
                        <tr>
                            <td><b>Giá bán:</b></td>
                            <td><font color="red" size="+2"><%=               GiaSP%> VNĐ</font></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="border:solid 1px rgb(196, 196, 196);padding:10px 5px;background-color:rgb(245, 234, 210);line-height:1.5;">
                                <b>Bảo hành</b><br />
                                &#9679; Bảo hành 6 tháng.<br />
                                &#9679; Dùng thử 3 ngày miễn phí (không cần lý do hoàn 100% tiền).
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <b style="color:red;font-size:20px;">Khuyến mãi + tặng kèm:</b><br />
                                &rarr; <%=               KM%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <b style="color:red;font-size:20px;">Thông tin khác:</b><br />
                                &rarr; <%=               TTThem%>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    <%		    } %>
                    <b style="color:red;font-size:30px;">Sản phẩm cùng hãng <%=           NSX%></b><br />
                    <%
		    //tạo đối tượng Connection
		    cnn1=Server.CreateObject("ADODB.Connection");
		    //Mở Connection String cStr trong cnn.asp
		    cnn1.Open(cStr);
		    //tạo đối tượng Recordset
		    rs1=Server.CreateObject("ADODB.Recordset");
		    //tạo câu lệnh SQL
		    DTMTB = "SELECT TenSP, FORMAT(GiaSP, '#,##0') AS GiaSP, AnhSP FROM ThongTinSP WHERE NSX='"+NSX+"' AND TenSP != N'"+TenSP+"'";
		    //thực thi câu lệnh SQL
		    rs1.Open(DTMTB,cnn1);
		    if(!rs1.EOF){
		        var index1=0;
		        rs1.MoveFirst();
		        while(!rs1.EOF){
		            index1++;
		            var TenSP1=rs1.Fields.Item("TenSP").Value;
		            GiaSP1=rs1.Fields.Item("GiaSP").Value;
		            AnhSP1=rs1.Fields.Item("AnhSP").Value;
                    %>
                    <form action="ChiTietSanPham.asp" style="float:left;">
                        <div class="sanpham" style="margin-top:10px;">
                            <center><button type="submit" style="border:none;background-color:transparent;outline:none;cursor:pointer;"><img width="150px" height="150px" src="../photo/<%=AnhSP1%>" title="<%=TenSP1%>" alt="<%=TenSP1%>"></button></center>
                            <div class="name">
                                <table>
                                    <tr height="50px">
                                        <td>
                                            <input style="background-color:transparent;outline:none;border:none;font-weight:bold;font-family:'Times New Roman';width:200px;cursor:default;font-size:20px;" name="TenSP" title="<%=TenSP1%>" value="<%=TenSP1%>" readonly />
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                            <b><font color="#FF0000" size="+1">Giá: <%=                                                  GiaSP1%> VNĐ</font></b>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                    <%
		            rs1.MoveNext(); //duyệt record tiếp theo
		        }}}
                        if(rsSP.EOF){
                    %>
        <div align="center" style="font-size:30px;color:red;">Sản phẩm không tồn tại.</div>
        <% } %>
    </td>
  </tr>
</table>
<br><br>
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
