<%-- 
    Document   : adminArea
    Created on : Nov 8, 2020, 8:58:58 PM
    Author     : SajithPe
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.db_connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/userArea_css.css">
<script src="js/navigation_js.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="./js/vpplayer.js"></script>-->
<!--<script>
    $(document).ready(function () {
        $('#ulist').DataTable({
            dom: 'Bfrtip',
            retrieve: true,
        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<script>
    function reloadTable() {





    }
</script>-->

<div class="row">
    <div class="container pb-1 col border">
        <br>
        <!-- Nav pills -->
        <ul class="nav flex-column nav-pills" role="tablist">
            <li class="nav-item ">
                <a class="nav-link active " data-toggle="pill" href="#usrmgmt">User Management</a>
            </li>
            <li class="nav-item">
                <a class="nav-link"  data-toggle="pill" href="#bkmgmt">Book Management</a>
            </li>
<!--            <li class="nav-item">
                <a class="nav-link"  id="addbks" data-toggle="pill" href="#addbook">Categories</a>
            </li>-->
        </ul>
    </div>
    <!-- Tab panes -->
     <div class="tab-content col-lg-10 border">
        <div id="usrmgmt" class="container tab-pane active"><br>
            <div class="row ">
                <div class="col-sm-8">
                    <h3 id="usrmgmttext">User Management</h3> 
                </div>

            </div>

            <div class="container  border pb-1" id="usrmgmtdata" >

                <jsp:include page="userManagement.jsp"/>   

                <br><br>
            </div>


            <br>
            <div class="alert alert-danger" style="display: none" id="er"></div>
            <div class="alert alert-success" style="display: none" id="suc"> </div>

        </div>
        <div id="bkmgmt" class="container tab-pane fade"><br>
            <h3>Manage Books</h3>
            <div class="container  border pb-1" id="bkmgmtdata" >

                <jsp:include page="bookManagement.jsp"/>   

                <br><br>
            </div>
        </div>
        <div id="addbook" class="container tab-pane fade"><br>

        </div>
    </div>
</div>



<!-- message box modals-->
<div class="modal" id="saveokmod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-success">
                <div id="okmsg" class="alert alert-success">

                </div>
            </div>
            <div class="modal-footer alert-success text-center">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal" id="saveNomod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-danger">
                <div id="nomsg" class="alert alert-danger">

                </div>
            </div>
            <div class="modal-footer alert-danger text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<!-- end of message box modals-->