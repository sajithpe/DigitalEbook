<%-- 
    Document   : userManagement
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

<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>-->
<script>
    $(document).ready(function () {
        getudata();
        setTimeout(function () {
            $('#ulist').DataTable();
        }, 200);

    });
</script>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#ulist tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>




<!-- Tab panes -->



<div class="container mt-3">
    <div id="utblArea" class="table-responsive">

        <br>

    </div>

</div>     

<br><br>

<!-- Modal for User Edit-->
<div class="modal fade" id="EditUser" role="dialog">
    <div class="modal-dialog modal-sm">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header ">

                <h4 class="modal-title" >Edit User Details </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body needs-validation" id="mod_body1">
                <div class="form-group">
                    <label for="ue_id">User ID:</label>
                    <input value="" readonly="" type="text" class="form-control" id="ue_id" name="ueid">
                </div>
                <div class="form-group">
                    <label for="ue_uname">Username:</label>
                    <input type="text" class="form-control" id="ue_uname"  name="ueuname" required>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="ue_email">Email:</label>
                    <input type="text" class="form-control" id="ue_email"  name="ueemail" required>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="ue_pass">Password:</label>
                    <input type="password" class="form-control" id="ue_pass"  name="uepass" required>
                    <div class="invalid-feedback">Please fill out this field.</div>
                </div>
                <div class="form-group">
                    <label for="ue_del">Type:</label><br>
                    <label class="radio-inline pr-sm-3">
                        <input type="radio" id="ue_ad" name="uety"> Admin  
                    </label> 
                    <label class="radio-inline ml-sm-2">
                        <input type="radio" id="ue_us" name="uety"> User  
                    </label>
                </div>
                <div class="form-group">
                    <label for="ue_del">Status:</label><br>
                    <label class="radio-inline pr-sm-3">
                        <input type="radio" id="ue_deln" name="uedel"> Active  
                    </label>
                    <label class="radio-inline ml-sm-2">
                        <input type="radio" id="ue_dely" name="uedel"> In Active  
                    </label>

                </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-dark" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal" onclick="uedit_save();
                                    return false">Update</button>
            </div>
        </div>

    </div>
</div>


<!-- End of Modal for User Edit-->

