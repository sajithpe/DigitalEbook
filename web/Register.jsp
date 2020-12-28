<%-- 
    Document   : Register
    Created on : Oct 3, 2020, 2:03:46 PM
    Author     : SajithPe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/userArea_css.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/navigation_js.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
    <script src="js/login_js.js"></script>-->

    <body>
        <div class="container-fluid col-sm-8 border">
            <h2>Please fill below data</h2>



            <div class="form-group">
                <label for="uname">Username:</label>
                <input type="text" class="form-control" id="uname" placeholder="Enter user name" name="uname">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
            </div>
            <div class="form-group">
                <label for="pw">Password:</label>
                <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
            </div>

            <button class="btn btn-primary" onclick="reg_user();
                    return false;">Register</button>

            <br><br>
        </div>
        <br>
        <div class="container" id="er1">

            <div class="alert alert-danger fade show" role="alert" id="er1" style="display: none" >
                Email already exists..!
            </div>
        </div>

    </body>

</html>
