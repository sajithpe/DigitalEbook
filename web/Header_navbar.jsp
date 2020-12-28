<%-- 
    Document   : Header_navbar
    Created on : Nov 6, 2020, 1:05:28 AM
    Author     : SajithPe
--%>

<!--<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/userArea_css.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/navigation_js.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>-->
<script>

    window.onload = function () {
        if (uname == "noUn") {
            document.getElementById("loginbtn").style.display = "block";
            document.getElementById("user_icon").title = "Log In";

        } else {
            document.getElementById("logoutbtn").style.display = "block";
            document.getElementById("user_icon").title = uname;
        }
    };


</script>

<div class="bs-example">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand text-primary" href="index.jsp" data-abc="true">
            <h1 style="color: #0056b3">DLibrary Books</h1>
        </a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <!--            <div class="navbar-nav">
                            <a href="#" class="nav-item nav-link active">Home</a>
                            <a href="#" class="nav-item nav-link">Profile</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Messages</a>
                                <div class="dropdown-menu">
                                    <a href="#" class="dropdown-item">Inbox</a>
                                    <a href="#" class="dropdown-item">Sent</a>
                                    <a href="#" class="dropdown-item">Drafts</a>
                                </div>
                            </div>
                        </div>-->
            <!--<form class="form-inline">-->
            <div class="input-group d-flex float-left ml-n3">

                <div class="input-group-append col-sm-12">
                    <div class="btn-group col-sm-11">
                        <input type="text" class="form-control no-gutters" id="search1" placeholder="Search" name="search" >
                        <button type="button" class="btn btn-primary" onclick="search_books();">Search</button>
                    </div>
                    <a href="#" class="navbar-nav d-inline-flex mt-2 mr-3" data-abc="true" role="button" style="text-decoration: none">
                        <i id="user_icon" style="color: #9fcdff; font-size: x-large" class="fa fa-user-circle" data-toggle="tooltip" data-placement="top" title="" onclick="user_icon_btn()"></i>

                    </a>
                    <a href="#" class="d-inline-flex mt-2" data-abc="true" role="button" style="text-decoration: none">
                        <i id="logoutbtn" class="fa fa-sign-out" style="color: tomato; display: none;font-size: x-large" data-toggle="tooltip" data-placement="top" title="Log Out" onclick="log_out()"></i>
                        <i id="loginbtn" class="fa fa-sign-in" style="color: yellowgreen; display: none; font-size: x-large" data-toggle="tooltip" data-placement="top" title="Log In" onclick="user_icon_btn()"></i>
                    </a>

                    </button>  
                </div>
            </div>
            <!--</form>-->
            <!--            <div class="navbar-nav">
                            <a href="#" class="nav-item nav-link">Login</a>
                            
                            
                        </div>-->
        </div>
    </nav>
</div>


