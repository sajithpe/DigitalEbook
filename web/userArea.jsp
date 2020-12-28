<%-- 
    Document   : userArea
    Created on : Nov 8, 2020, 11:39:00 AM
    Author     : SajithPe
--%>
<!--<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/userArea_css.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/navigation_js.js"></script>-->


<script>
    $(document).ready(function () {


        $('.list-group-item').click(function (e) {
            e.preventDefault();
            $('.list-group-item').removeClass('active');
            $(this).addClass('active');
        });
    });
</script>
<style>

</style>


<div class="row">
    <div class="container pb-1 col border">
        <br>
        <!-- Nav pills -->
        <ul class="nav flex-column nav-pills" role="tablist">
            <li class="nav-item ">
                <a class="nav-link active" data-toggle="pill" href="#myprofile">My Profile</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"  data-toggle="pill" href="#favourite" onclick="getRLdata();">Favourites</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"  id="addbks" data-toggle="pill" href="#addbook">Add books</a>
            </li>
        </ul>
    </div>
    <!-- Tab panes -->
    <div class="tab-content col-lg-10 border">
        <div id="myprofile" class="container tab-pane active"><br>
            <div class="row ">
                <div class="col-sm-8">
                    <h3 id="myprotext">My Profile</h3> 
                </div>
                <div class="col">
                    <button id="usr_edt"class="btn btn-secondary" onclick="edit_details_btn()
                    return false;">Edit details</button>
            </div><br>
            </div>
            <div class="col-sm1"></div>
            <div class="container  border pb-1" id="myprodata" >

                               
                <br><br>
            </div><br>
            <div class="alert alert-danger" style="display: none" id="er"></div>
            <div class="alert alert-success" style="display: none" id="suc"> </div>
            
        </div>
        <div id="favourite" class="container tab-pane fade"><br>
            <h3>Favourites</h3>
            
            <%@include file="readLaterlist.jsp" %>
        </div>
        <div id="addbook" class="container tab-pane fade"><br>
            
            <%@include file="addBooks.jsp" %>
        </div>
    </div>
</div>



