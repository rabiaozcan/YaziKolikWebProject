<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.ArrayList,com.yazikolik.model.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Kitap Satış Sitesi">
    <meta name="keywords" content="kitap,okumak,eğitim,roman,edebiyat">
    <meta name="author" content="Rabia ÖZCAN, Yahya Furkan KILIÇOĞLU,Muhammed Abdurrahman ÖTÜN, Hüseyin MUTLU">
    <!--CSS bağımlılıkları-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <!--Javascript Bağımlılıkları-->
    <script> <%@ include file = "static/js/fontawesome-icons.js" %></script>
    <title>YaziKolik</title>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
    <style type="text/css">
    <%@ include file = "static/css/style.css" %>
    </style>
    <style>
    .google-maps {
        position: relative;
        padding-bottom: 75%; // Burası en-boy oranıdır. 
        height: 0;
        overflow: hidden;
    }
    .google-maps iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 100% !important;
        height: 100% !important;
    }
</style>
</head>
<body>
<nav class="navbar" style="background-color: #F1EBF5;">
    <div class="container-fluid py-2 row text-center">
      <div class="col-md-2">
      <a class="navbar-brand ms-2" href="/index">
        <!-- Logo boyutu width ve height ile ayarlanabilir -->
        <img src="static/img/logo.png" alt="" class="rounded-circle img-fluid">
      </a>
    </div>
    <div class="col-md-7 my-4">
      <form class="d-flex w-100">
        <input class="form-control" type="search" placeholder="Kitap veya Yazar Adı" aria-label="Search" id="searchInput">
        <button class="btn btn-outline-primary ms-2 d-flex" id="searchBtn" type="submit"><i class="fas fa-search pt-1 pe-1"></i>Ara</button>
      </form>
    </div>
      <div class="col-md-3">
      <div class="btn-group-vertical me-2">
     	<c:choose>
        <c:when test="${sessionScope.user != null}">
        <c:if test="${sessionScope.user.isSu() }">
        <a href="admin" class="btn btn-outline-primary mb-2 btn-sm">
        <i class="fa fa-snowflake-o" aria-hidden="true"></i><span class="px-2">Admin</span>
        </a>
        </c:if>

        
        <a href="LogoutServlet" class="btn btn-outline-primary mx-1">
         <i class="fas fa-sign-out-alt"></i><span class="px-2">Çıkış Yap</span>
       	</a>
        </c:when>
        <c:otherwise>
        <a href="register" class="btn btn-outline-primary btn-sm">
          <i class="fas fa-user-plus"></i><span class="px-2">Üye Ol</span>
        </a>
        <a href="login" class="btn btn-outline-primary mt-2 btn-sm">
          <i class="fas fa-user-check"></i><span class="px-2">Giriş Yap</span>
        </a>
         </c:otherwise>
     	</c:choose>
        <a href="basket" class="btn btn-outline-danger btn-sm mt-2"><span id="basketCounter" class="badge bg-warning rounded-pill mx-1">${basketList.size()}</span><i
            class="fas fa-shopping-cart"></i><span class="px-2">Sepet</span></a>
      </div>
    </div>
  </nav>





  <!-- Kategori gösterim yeri-->
  <div class="container-fluid" style="background-color: #4887B0;">
    <div class="text-center py-3">
      <a class="nav-1 rounded-3 mx-1 px-2 category-item" href="#">Edebiyat</a>
      <a class="nav-2 rounded-3 mx-1 px-2 category-item" href="#">Eğitim</a>
      <a class="nav-3 rounded-3 mx-1 px-2 category-item" href="#">Felsefe</a>
      <a class="nav-4 rounded-3 mx-1 px-2 category-item" href="#">Bilim</a>
      <a class="nav-5 rounded-3 mx-1 px-2 category-item" href="#">Yazılım</a>
    </div>
  </div>

<section id="productjsp">
<%@ include file="products.jsp" %>
</section>

<footer class="footer mt-auto" style="background-color: #F1EBF5;">
        <div class="container-fluid">
            <div class="row row-cols-3 text-center">
                <div class="col">
                	<div class="my-1"><a class="footer-link" href="#"><b>Kategoriler</b></a></div>
                    <div class="my-1"><a class="footer-link" href="#">Edebiyat</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Eğitim</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Felsefe</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Bilim</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Yazılım</a></div>
                </div>
                <div class="col">
                    <div class="my-1"><a class="footer-link" href="#"><b>İletişim</b></a></div>
                    <div class="my-1"><a class="footer-link" href="#">Email: furkan.kilicoglu@bil.omu.edu.tr</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Email: abdurrahman.otun@bil.omu.edu.tr</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Email: rabia.ozcan@bil.omu.edu.tr</a></div>
                    <div class="my-1"><a class="footer-link" href="#">Email: huseyin.mutlu@bil.omu.edu.tr</a></div>
                </div>
                <div class="col ">
                <div class="google-maps" >
                	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11978.07358235022!2d36.18899684401959!3d41.36282063753321!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40887eff9abfffe9%3A0x96d2f4886017389e!2zNDHCsDIxJzUxLjgiTiAzNsKwMTEnMDQuMCJF!5e0!3m2!1str!2str!4v1624139653817!5m2!1str!2str" width="2,66" height="2" style="border:0;"></iframe>
                	
                </div>
                <div class="my-1"><a class="footer-link" href="https://www.google.com/maps/place/41%C2%B021'51.8%22N+36%C2%B011'04.0%22E/@41.3644013,36.1669385,14z/data=!4m6!3m5!1s0x40887eff9abfffe9:0x96d2f4886017389e!7e2!8m2!3d41.3644013!4d36.184448">Adres: Atakum/Samsun</a></div>
            </div>
            </div>
            <div class="border-top container text-center py-2 text-muted">© Copyright 2021 - Bu Ödevin Tüm Hakları Saklıdır.</div>
        </div>
    </footer>

	<script type="text/javascript" 
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>

 <script>
 $(function () {
	  $("#searchBtn").click(function(){
		  	var searchInput = $("#searchInput").val();
		  	console.log(searchInput);
		    document.getElementById("productjsp").innerHTML="";
	        $.post("/YaziKolik/index", {action:"search",searchInput:searchInput }, function (data) {
	            $("#productjsp").html(data);
	        });
		    
		    
	  });	 
	  $(".btn-decrease").click(function(){
		    var currentVal = parseInt($(this).next().val());
		    if(currentVal > 1){
		        currentVal -= 1;
		        $(this).next().val(currentVal);
		    }
		  });
		  $(".btn-increase").click(function(){
		    var currentVal = parseInt($(this).prev().val());
		    if(currentVal < 50){
		        currentVal += 1;
		        $(this).prev().val(currentVal);
		    }
		  });
		});
 
 $('.cartAdd').click(function (){
     var deger;
     var values = [];
     for ( var i =0; i<4;i++){
     deger=$(this).parent().prev().children("p:nth("+i+")").text();
     if(i==3){
         var price = parseFloat(deger);
         var quantity = parseInt($(this).next().next().val());
         var cost = price * quantity;
         values.push(cost.toFixed(3));
         continue;
     }
     values.push(deger);
     }
     values.push(quantity);
     console.log(values[0]);
     console.log(values[4]);
     $.post("/YaziKolik/index", {action:"addBasket",productTitle:values[0],productQuantity:values[4]}, function (basketCounter) {
    	 document.getElementById("basketCounter").innerHTML=basketCounter;
     });
     
     console.log(values); //değerleri alıp almadığını görmek istedim.
     $('.toast').toast('show');
     //values dizisini ajax komutları ile servletdaki sessiona yolla
});

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" ></script>
</body>
</html>

