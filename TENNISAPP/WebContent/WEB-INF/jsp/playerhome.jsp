<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>TennAPP</title>
  <%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="resources/player-home/img/favicon.png" rel="icon">
  <link href="resources/player-home/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
   <spring:url value="resources/player-home/lib/bootstrap/css/bootstrap.min.css" var="bootstrapmincss"/>
  <link rel="stylesheet" href="${bootstrapmincss}"> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!-- Libraries CSS Files -->
  <link href="resources/player-home/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/animate/animate.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/player-home/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="resources/player-home/css/style.css" rel="stylesheet">

  <style type="text/css">
  .centredisplay input {
    border-radius: 0px;
    background: transparent;
    color: #000;
    border: 1px solid #ccc;
}
a:focus {
    color: #fff !important;
    outline: none;
    text-decoration: none;
}
.custom-a{
    color: #fff!important;
    background-color: #18d26e!important;
    border: none;
    display: inline-block;
    padding: 8px 16px;
    vertical-align: middle;
    overflow: hidden;
    text-decoration: none;
    color: inherit;
    background-color: inherit;
    text-align: center;
    cursor: pointer;
    white-space: nowrap;
}
  </style>
</head>

<body ng-app="myApp" ng-controller="myCtrl" ng-init="init()">

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="playerhome" class="scrollto">TennAPP</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
        <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
        <li><a href="organiserlogin" style="padding: 5px 10px 6px 10px;">Organizer</a></li>
        </c:if>
          <li class="menu-active"><a href="#intro">Home</a></li>
          <li><a href="#portfolio">Tournaments</a></li>
		  <li><a href="#services">Academis</a></li>
          <li><a href="#contact">Contact</a></li>
          <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
		  <li><a href="#" data-toggle="modal" data-target="#loginOrRegisterModel" ng-click="globalTournament(-1)">Login</a></li>
		  </c:if>
		  <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
		   <li><a href="./playerlogout" >Logout</a></li>
		 </c:if>
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->

  <!--==========================
    Intro Section
  ============================-->
  <section id="intro">
    <div class="intro-container">
      <div id="introCarousel" class="carousel  slide carousel-fade" data-ride="carousel">

        <ol class="carousel-indicators"></ol>

        <div class="carousel-inner" role="listbox">

          <div class="carousel-item active">
            <div class="carousel-background"><img src="resources/player-home/img/intro-carousel/1.jpg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2>Do You Play?</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <a href="#featured-services" class="btn-get-started scrollto">Let's Play</a>
              </div>
            </div>
          </div>

          <div class="carousel-item">
            <div class="carousel-background"><img src="resources/player-home/img/intro-carousel/2.jpg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2>Do You Organize?</h2>
                <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut.</p>
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <a href="organiserlogin" class="btn-get-started scrollto">Let's organize</a>
                </c:if>
              </div>
            </div>
          </div>

          <div class="carousel-item">
            <div class="carousel-background"><img src="resources/player-home/img/intro-carousel/3.jpeg" alt=""></div>
            <div class="carousel-container">
              <div class="carousel-content">
                <h2>Do You Need Space?</h2>
                <p>Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt omnis iste natus error sit voluptatem accusantium.</p>
                <a href="#featured-services" class="btn-get-started scrollto">Let's Book</a>
              </div>
            </div>
          </div>
        </div>

        <a class="carousel-control-prev" href="#introCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon ion-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="carousel-control-next" href="#introCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon ion-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>

      </div>
    </div>
  </section><!-- #intro -->

  <main id="main">
    <!--==========================
      Featured Services Section
    ============================-->
    <div class="row" style="display: none;" id="hideMainDiv">
			<!-- alert Open -->
				<div class="col-sm-12" style="margin-top: 12px;position: fixed;top: 5em;left: 29em;z-index: 2;width: auto;">
					<div class="alert alert-success " id="success-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideSuccessAlert()" >&times;</a>
						<strong>Success! </strong> {{successmsg}}
					</div>
					<div class="alert alert-danger " id="danger-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideDangerAlert()" >&times;</a>
						<strong>Error! </strong> {{errormsg}}
					</div>
					<div class="alert alert-info " id="info-alert">
						<a href="#" class="close" aria-label="close" aria-label="close" onclick="hideInfoAlert()">&times;</a>
						<strong>Info! </strong> {{infomsg}}
					</div>
				</div>
		   <!-- alert close -->
			</div>
			
    <section id="featured-services">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 box">
            <i class="ion-ios-tennisball-outline"></i>
            <h4 class="title"><a href="">Register Tournament</a></h4>
            <p class="description">As a Player, you can register any upcoming Tournments from our listings</p>
          </div>

          <div class="col-lg-4 box box-bg">
            <i class="ion-ios-timer-outline"></i>
            <h4 class="title"><a href="">Organize Tournament</a></h4>
            <p class="description">As a Organizer, you can conduct Tournament with minimal steps from our App</p>
          </div>

          <div class="col-lg-4 box">
            <i class="ion-ios-calendar-outline"></i>
            <h4 class="title"><a href="">Book Your Court</a></h4>
            <p class="description">Book a court near to you from our Academies listings</p>
          </div>

        </div>
      </div>
    </section><!-- #featured-services -->
	<!--==========================
      Portfolio Section
    ============================-->
    <section id="portfolio"  class="section-bg" >
      <div class="container">

        <header class="section-header">
          <h3 class="section-title">Tournaments</h3>
        </header>

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              
              <li ng-class="liveClass" ng-click="filterFun(false)">Current</li>
              <li ng-class="upcomingClass" ng-click="filterFun(true)">Upcoming</li>
			  <!-- <li ng-class="allClass" ng-click="filterFun()">All</li> -->
            </ul>
          </div>
        </div>
        <div class="row portfolio-container" ng-if="!liveOrUpcoming">
          <div class="col-lg-4 col-md-6 portfolio-item wow fadeInUp" ng-repeat="list in liveTournaments | limitTo:6">
            <div class="portfolio-wrap">
              <figure>
                <img src="{{list.bannerImage}}" class="img-fluid" alt="">
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <a href="#" data-toggle="modal" data-target="#loginOrRegisterModel" class="link-preview" title="View" ng-click="globalTournament(list.tournamentId)"><i class="ion ion-eye"></i></a>
                </c:if>
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
                 <a href="redirectToShowTournament?tournamentId={{list.tournamentId}}" class="link-preview" title="View" ng-click="globalTournament(list.tournamentId)"><i class="ion ion-eye"></i></a>
                </c:if>
                <a href="#" class="link-details" title="More Details" ng-click="showTournamentModel(list);"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4>{{list.title}}</h4>
                <p>{{list.location}}</p>
              </div>
            </div>
          </div>
          <div ng-if="liveTournaments.length > 6" style="width: 100%;">
          <a href="view_list" class="custom-a" style="float: right;">More..</a>
          </div>
        </div>
        <div class="row portfolio-container" ng-if="liveOrUpcoming">
          <div class="col-lg-4 col-md-6 portfolio-item wow fadeInUp" ng-repeat="list in upcommingTournaments | limitTo:6">
            <div class="portfolio-wrap">
              <figure>
                <img src="{{list.bannerImage}}" class="img-fluid" alt="">
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
                <a href="#" data-toggle="modal" data-target="#loginOrRegisterModel" class="link-preview" title="View" ng-click="globalTournament(list.tournamentId)"><i class="ion ion-eye"></i></a>
                </c:if>
                <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
                 <a href="redirectToShowTournament?tournamentId={{list.tournamentId}}" class="link-preview" title="View" ng-click="globalTournament(list.tournamentId)"><i class="ion ion-eye"></i></a>
                </c:if>
                <a href="#" class="link-details" title="More Details" ng-click="showTournamentModel(list);"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">{{list.title}}</a></h4>
                <p>{{list.location}}</p>
              </div>
            </div>
          </div>
          <div ng-if="upcommingTournaments.length > 6" style="width: 100%;">
          <a href="view_list" class="custom-a" style="float: right;">More..</a>
          </div>
        </div>

      </div>
    </section><!-- #portfolio -->

    <!--==========================
      Services Section
    ============================-->
    <section id="services">
      <div class="container">

        <header class="section-header wow fadeInUp">
          <h3>Academis</h3>
          <p>Do you want to book a court, Find your nearest Academy/Court</p>
        </header>

        <div class="row">

          <div class="col-lg-4 col-md-6 box wow bounceInUp" data-wow-duration="1.4s" ng-repeat = "list in venueDetails | limitTo:6">
            <div class="icon"><i class="ion-ios-location-outline"></i></div>
            <h4 class="title"><a href="">{{list.venueName}}</a></h4>
            <p class="description">{{list.venueLocation}}</p>
            <p class="description" style="color: #18d26e" ng-if="list.venuelight == 0">Courts - {{list.noOfCourts}} (lighted) </p>
            <p class="description" style="color: #18d26e" ng-if="list.venuelight == 1">Courts - {{list.noOfCourts}} (Non lighted) </p>
            <button class="btn btn-info" style="background: #18d26e;float:right;border-radius:0px;border:0px;"> Book</button>
          </div>
          <div ng-if="venueDetails.length > 6" style="width: 100%;">
          <a href="view_academy_list" class="custom-a" style="float: right;">More..</a>
          </div>

        </div>

      </div>
    </section><!-- #services -->

   
	 <!--==========================
      Call To Action Section
    ============================-->
    <section id="call-to-action" class=" testimonials wow fadeIn">
      <div class="container">

        <header class="section-header">
          <h3>News</h3>
        </header>

        <div class="owl-carousel testimonials-carousel">

          <div class="testimonial-item">
            <img src="resources/player-home/img/avatar.jpg" class="testimonial-img" alt="">
            <h3>Tarak Arjun</h3>
            <h4>Winner of Lanco Open</h4>
            <p>
              <img src="resources/player-home/img/quote-sign-left.png" class="quote-sign-left" alt="">
              Played a wonderful tournament with score 0-4, 0-4. by this he owned no. 1 board
              <img src="resources/player-home/img/quote-sign-right.png" class="quote-sign-right" alt="">
            </p>
          </div>

          <div class="testimonial-item">
            <img src="resources/player-home/img/avatar.jpg" class="testimonial-img" alt="">
            <h3>Tarak Arjun</h3>
            <h4>Winner of Lanco Open</h4>
            <p>
              <img src="resources/player-home/img/quote-sign-left.png" class="quote-sign-left" alt="">
              Played a wonderful tournament with score 0-4, 0-4. by this he owned no. 1 board
              <img src="resources/player-home/img/quote-sign-right.png" class="quote-sign-right" alt="">
            </p>
          </div>

          <div class="testimonial-item">
            <img src="resources/player-home/img/avatar.jpg" class="testimonial-img" alt="">
            <h3>Tarak Arjun</h3>
            <h4>Winner of Lanco Open</h4>
            <p>
              <img src="resources/player-home/img/quote-sign-left.png" class="quote-sign-left" alt="">
              Played a wonderful tournament with score 0-4, 0-4. by this he owned no. 1 board
              <img src="resources/player-home/img/quote-sign-right.png" class="quote-sign-right" alt="">
            </p>
          </div>

          <div class="testimonial-item">
            <img src="resources/player-home/img/avatar.jpg" class="testimonial-img" alt="">
            <h3>Tarak Arjun</h3>
            <h4>Winner of Lanco Open</h4>
            <p>
              <img src="resources/player-home/img/quote-sign-left.png" class="quote-sign-left" alt="">
              Played a wonderful tournament with score 0-4, 0-4. by this he owned no. 1 board
              <img src="resources/player-home/img/quote-sign-right.png" class="quote-sign-right" alt="">
            </p>
          </div>

          <div class="testimonial-item">
            <img src="resources/player-home/img/avatar.jpg" class="testimonial-img" alt="">
            <h3>Tarak Arjun</h3>
            <h4>Winner of Lanco Open</h4>
            <p>
              <img src="resources/player-home/img/quote-sign-left.png" class="quote-sign-left" alt="">
              Played a wonderful tournament with score 0-4, 0-4. by this he owned no. 1 board
              <img src="resources/player-home/img/quote-sign-right.png" class="quote-sign-right" alt="">
            </p>
          </div>

        </div>

      </div>
    </section><!-- #call-to-action -->

    <!--==========================
      Contact Section
    ============================-->
    <section id="contact" class="section-bg wow fadeInUp">
      <div class="container">

        <div class="section-header">
          <h3>Contact Us</h3>
          <p>We are here to always help you !!!!</p>
        </div>

        <div class="row contact-info">

          <div class="col-md-4">
            <div class="contact-address">
              <i class="ion-ios-location-outline"></i>
              <h3>Address</h3>
              <address>Gachbowli, Hyderabad</address>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-phone">
              <i class="ion-ios-telephone-outline"></i>
              <h3>Phone Number</h3>
              <p><a href="tel:+155895548855">+1 0000 000 00</a></p>
            </div>
          </div>

          <div class="col-md-4">
            <div class="contact-email">
              <i class="ion-ios-email-outline"></i>
              <h3>Email</h3>
              <p><a href="mailto:info@example.com">info@zambientsystems.com</a></p>
            </div>
          </div>

        </div>

        <div class="form">
          <form ng-submit="sendMessageToOrgainer()" method="post" role="form">
            <div class="form-row">
              <div class="form-group col-md-6">
                <input type="text" name="name1" class="form-control" id="name1" placeholder="Your Name*" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                <div class="validation"></div>
              </div>
              <div class="form-group col-md-6">
                <input type="email" class="form-control" name="email1" id="email1" placeholder="Your Email*" data-rule="email1" data-msg="Please enter a valid email" />
                <div class="validation"></div>
              </div>
            </div>
            <div class="form-group">
              <input type="text" class="form-control" name="subject1" id="subject1" placeholder="Subject*" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
              <div class="validation"></div>
            </div>
            <div class="form-group">
              <textarea class="form-control" name="message1" id="message1" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message*"></textarea>
              <div class="validation"></div>
            </div>
            <div class="text-center"><button type="submit">Send Message</button></div>
          </form>
        </div>

      </div>
    </section><!-- #contact -->

  </main>

  <!--==========================
    Footer
  ============================-->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <h3>TennAPP</h3>
            <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus. Scelerisque felis imperdiet proin fermentum leo. Amet volutpat consequat mauris nunc congue.</p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="#intro">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#portfolio">Tournaments</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#services">Academis</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#contact">Contact</a></li>
              <!-- <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li> -->
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              Zambient Info Systems <br>
              Gachbowli, Hyderabad<br>
              Telangana <br>
              <strong>Phone:</strong> +1 0000 000 000<br>
              <strong>Email:</strong> info@zambientsystems.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
              <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
              <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            </div>

          </div>

          <div class="col-lg-3 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna veniam enim veniam illum dolore legam minim quorum culpa amet magna export quem marada parida nodela caramase seza.</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit"  value="Subscribe">
            </form>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>TennAPP</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
        Powered by <a href="http://zambientsystems.com/">Zambient Info Systems</a>
      </div>
    </div>
  </footer><!-- #footer -->

   <!-- The Modal -->
   <div class="modal fade" id="viewTournament">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title">{{tournament.title}}</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" style ="padding: 0px;">
           
          <img src="{{tournament.bannerImage}}" class="img-fluid" alt="">
          
          <div class="row" style="padding: 10px;">
          <div class="col-lg-6">
            <b > {{tournament.tournamentStartDate}}</b>
            <address> {{tournament.location}}</address>
          </div>
          <c:if test="${sessionScope['scopedTarget.userSession'].loginType == 0}">
         <!--  <div class="col-lg-6"><button class="btn btn-info" style="background: #18d26e;float:right;" ng-click="registerForTournament(tournament.tournamentId);"> Register</button></div> -->
           <div class="col-lg-6"><a href="redirectToShowTournament?tournamentId={{tournament.tournamentId}}" target="_blank" class="btn btn-info" style="background: #18d26e;float:right;">More..</a></div>
          </c:if>
          <c:if test="${sessionScope['scopedTarget.userSession'].loginType == NAN}">
          <div class="col-lg-6"><button class="btn btn-info" style="background: #18d26e;float:right;" data-toggle="modal" data-target="#loginOrRegisterModel"> More..</button></div>
          </c:if>
        </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- Login/register Model -->
  <div class="modal fade" id="loginOrRegisterModel">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title">Login/Register</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body " style ="padding: 0px;">
         <div style="padding: 15px;font-size: 12px;" ng-show="signInTab">
          <form ng-submit="validatePlayerLogin()" method="post" name="loginByPlayer" ngnativevalidate="" class="centredisplay login-bg ng-valid-pattern ng-valid-maxlength ng-dirty ng-valid-parse ng-valid ng-valid-required">
	         <div class="">
	              <label for="name" class="active">MOBILE NO.*</label>
				 <input type="text" id="userId" name="userId" class="form-control ng-valid-pattern ng-valid-maxlength ng-not-empty ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched" ng-model="userId" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="loginPlyrValidate = null">
				 <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$error.number" class="ng-hide">Not valid number!</span>
			     <span style="color:Red;font-size: .8em;" ng-show="loginByPlayer.userId.$dirty&amp;&amp;loginByPlayer.userId.$error.pattern" class="ng-hide">Only Numbers Allowed, should 10 digits!</span>
			</div>
			<div class="">
			     <label for="name" class="active">PASSWORD*</label>
				 <input type="password" id="loginpassword" name="loginpassword" class="form-control ng-valid-maxlength ng-not-empty ng-dirty ng-valid-parse ng-valid ng-valid-required ng-touched" ng-model="loginpassword" maxlength="10" required="required" ng-click="loginPlyrValidate = null">
		    </div><br>
		    <div class="">
		       <p style="margin: 0px;color: red;font-size: 12px;">{{loginPlyrValidate}}</p>
		        <a href="#" style="float: right;font-size: 15px;color: #565656;" ng-click="forgotPassword()">Forgot Password?</a>
				      <button type="submit" class="btn btn-info" style="background: #18d26e;width: 100%;">LOGIN</button>
		     </div>
	           <br>
            <a href="#" ng-click="signUpTabShowHide()">Not registered? Create an account</a>
	     </form>
	     </div>
	     <div style="padding: 15px;font-size: 12px;" ng-show="signUpTab">
	     <form ng-submit="validatePlayerRegistration()" name="registerByPlayer" ngNativeValidate class="centredisplay">
	       <div class="row">
	         <div class="col-sm-12"> 
	        <label for="name">Name*</label>
			<input type="text" id="name" class="form-control" ng-model="name" name="name" maxlength="20" required="required" autocomplete="off" ng-click="registerPlyrValidate = null">
	       </div>
	     </div>
	        <div class="row">
			    <div class="col-sm-6"> 
			        <label for="phone">Phone*</label>
			        <input type="text" id="phone" ng-model="phone" name="phone" class="form-control" ng-pattern="/^[0-9]{10}$/" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				    <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.phone.$error.number">Not valid number!</span>
				    <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.phone.$dirty&&registerByPlayer.phone.$error.pattern">Only Numbers Allowed, should 10 digits!</span>
			    </div>
			    <div class="col-sm-6"> 
			    <label for="email">Email*</label>
			    <input type="email" id="email" ng-model="email" name="email" class="form-control" maxlength="45" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
	            <span style="color:Red;font-size: 1em;" ng-show="registerByPlayer.email.$dirty&&registerByPlayer.email.$error.email">Not valid email!</span>
			    </div>
			</div>
				<div class="row">
				     <div class="col-sm-6"> 
				      <label for="pwd">Password*</label>
				      <input type="password" id="pwd" ng-model="pwd" name="pwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				     </div>
				     <div class="col-sm-6"> 
				     <label for="repwd">Confirm Password*</label>
				      <input type="password" id="repwd" ng-model="repwd" name="repwd" class="form-control" maxlength="10" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
				     </div>
				 </div>
				<div class="row">
				    <div class="col-sm-6"> 
				    <label for="address">Address*</label>
					<textarea type="text" id="address" ng-model="address" name="address" class="md-textarea form-control" rows="1" maxlength="150" required="required" ng-click="registerPlyrValidate = null" autocomplete="off"></textarea>
					</div>
					<div class="col-sm-6"> 
					<label for="dateOfBirth">Date of Birth*</label>
					<input type="text" id="dateOfBirth" ng-model="dateOfBirth" class="form-control" required="required" ng-click="registerPlyrValidate = null" autocomplete="off">
					</div>
			   </div>
			   <div class="row">
				    <div class="col-sm-12"> 
				    <label for="address">Select Ranking*</label>
				    <select ng-model="rankItem" ng-options="rankdata.rankName for rankdata in rankList" class="form-control" name="rankItem" id="rankid" style="border-radius: 0px;background: transparent;border: 1px solid #ccc;" autocomplete="off">
		            </select>
					</div>
			   </div>
			    <div class="" ng-if="rankItem.rankId != 1">
			      <div class="row">
					  <div class="col-sm-6"> 
					      <label for="itaId">Id</label>
					      <input type="text" id="itaId" ng-model="itaId" class="form-control" pattern="\d*" maxlength="10" autocomplete="off">
					  </div>
				      <div class="col-sm-6"> 
				          <label for="itaRank">Rank</label>
					      <input type="text" id="itaRank" ng-model="itaRank" class="form-control" pattern="\d*" maxlength="10" autocomplete="off">
					  </div>
			       </div>
			     </div><br>
			     <div class="row">
					  <div class="col-sm-6"> 
					  <div class="custom-control custom-radio">
					  <input type="radio" class="custom-control-input" id="male" value="0" name="gender" checked>
					  <label class="custom-control-label" for="male">Male</label>
				       </div>
					  </div>
					  <div class="col-sm-6"> 
					  <div class="custom-control custom-radio">
					  <input type="radio" class="custom-control-input" id="female" value="1" name="gender">
					  <label class="custom-control-label" for="female">Female</label>
					  </div>
					  </div>
					  </div><br>
					   <p style="margin: 0px;color: red;font-size: 12px;">{{registerPlyrValidate}}</p>
			         <div class="row"> 
				     <div class="col-sm-12">
						  <button type="submit" class="btn btn-info" style="background: #18d26e;width: 100%;">REGISTER</button>
				     </div>
			     </div>
		     <br>
		     <div><a href="#" ng-click="signInTabShowHide()">Already registered user ? LOGIN</a></div>
		  </form>
	     </div>
	     <div style="padding: 15px;font-size: 12px;" ng-show="forgetPwd">
			  <form ng-submit="validateForgetPassword()" class="centredisplay">
				<div class="">
					<label>Mobile*</label> <input type="text" id="orguserforgetId" name="orguserforgetId" class="form-control" ng-model="orguserforgetId" pattern="\d*" maxlength="10" required="required">
				</div>
				<br>
				<p style="margin: 0px; color: red; font-size: 12px;">{{changePwdValidate}}</p>
				<div class="">
					<button type="submit" class="btn btn-info" style="background: #18d26e;width: 100%;">Email LINK</button>
				</div>
				<br>
				<div>
					<a href="#"  ng-click="signInTabShowHide()"> LOGIN</a>
				</div>
			</form>
		</div>
        </div>
      </div>
    </div>
  </div>
  <!-- Alert Popup Open -->
<div class="modal fade" id="alertPopup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="color: #18d26e;">
        <h6 class="modal-title" id="exampleModalLabel">Alert!</h6>
        <button type="button" class="close" onclick="hideAlert()" style="color: #000;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body alertmsg">
      </div>
      <div class="modal-footer d-flex" style="padding: 5px;">
        <button type="button" onclick="hideAlert()" class="btn btn-success" style="padding: 6px 12px 6px 12px;">Ok</button>
      </div>
    </div>
  </div>
</div>
<!-- Alert popup close -->
  <input type="hidden" name="popupmsg" id="popupmsg" value="${message}" />
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  
  <script src="resources/player-home/lib/jquery/jquery.min.js"></script>
   
  <script src="resources/player-home/lib/jquery/jquery-migrate.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  <script src="resources/player-home/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/player-home/lib/easing/easing.min.js"></script>
  <script src="resources/player-home/lib/superfish/hoverIntent.js"></script>
  <script src="resources/player-home/lib/superfish/superfish.min.js"></script>
  <script src="resources/player-home/lib/wow/wow.min.js"></script>
  <script src="resources/player-home/lib/waypoints/waypoints.min.js"></script>
  <script src="resources/player-home/lib/counterup/counterup.min.js"></script>
  <script src="resources/player-home/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="resources/player-home/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="resources/player-home/lib/lightbox/js/lightbox.min.js"></script>
  <script src="resources/player-home/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="resources/player-home/contactform/contactform.js"></script>
  
  
  <!-- Template Main Javascript File -->
  <script src="resources/player-home/js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script  src="resources/javascript/custom/playerHome.js" ></script>
  <spring:url value="/resources/javascript/custom/common.js" var="commonjs"/>
  <script src="${commonjs}"></script>
</body>

