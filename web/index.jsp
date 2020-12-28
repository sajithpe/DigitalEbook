<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/userArea_css.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<script src="js/navigation_js.js"></script>-->

<%@ page session="true" %>

<style>
    body {
        background: url('images/library_bg3.jpg') no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        background-size: cover;
        -o-background-size: cover;
    }
</style>

<script type="text/javascript">

    var uname = "noUn";
    var utype = "";
    var uid = "";

    if (sessionStorage.getItem("ses_un") !== null) {

        window.uname = sessionStorage.getItem("ses_un");
        window.utype = sessionStorage.getItem("ses_uty");
        window.uid = sessionStorage.getItem("ses_uid");



    }
    ;

    if (window.utype === "a") {

        setTimeout(function () {
            document.getElementById("adbtn").style.display = "block";
        }, 700);
    }


</script>


<body>
<%@include file="header.jsp" %>
    <div class="container center-block col-sm-11">
        <div class="card border-0 shadow">
            <div id="sitemainbody"class="card-body border-0 col-sm-12">
                <%@include file="Header_navbar.jsp" %>
                <br><br>
                <div id="bookPart" style="display: none"> <%@include file="bookView.jsp" %></div>
                <div id="playerPart" style="display: none"> <%@include file="AudioView.jsp" %></div>
                <div id="bodyPart" style="display: block"> <%@include file="Body_navbar.jsp" %></div>

            </div>
        </div>
    </div>
</body>