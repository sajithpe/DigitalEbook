<%-- 
    Document   : bookManagement
    Created on : Dec 17, 2020, 12:01:51 AM
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
<script>
    $(document).ready(function () {
       getbdata();
        setTimeout(function () {
            $('#bklist').DataTable();
        }, 200);
    });
</script>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#Mytable2 tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
<script>

    function refreshsel() {

        $("#besel").val("");
        $("#besel").html("");
    }
</script>



<!-- Tab panes -->



<div class="container mt-3">
    <div id="btblArea" class="table-responsive">

        <br>
      
    </div>

</div>     

<br><br>

<!-- Modal for Book Edit-->
<div class="modal fade" id="EditBook" role="dialog">
    <div class="modal-dialog modal-sm">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header ">

                <h4 class="modal-title" >Edit Book Details </h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body needs-validation" id="be_mod_body">

                <div class="container">

                    <div class="card mb-3" style="max-width: 500px">
                        <img id="be_tmb" class="card-img-top" src="" alt="Card image cap">
                    </div>

                    <!--<form action="" id="form_bk_edit" name="bkEditForm" method="post" enctype="multipart/form-data">-->
                        <div class="form-group">
                            <label for="be_name">Book Name:</label>
                            <input type="text" class="form-control" id="be_name" name="bename" required>           

                        </div>
                        <div class="form-group">
                            <label for="be_auth">Author:</label>
                            <input type="text" class="form-control" id="be_auth" name="beauth" required>            

                        </div>
                        <div class="form-group">
                            <label for="be_ty">Book Type:</label>
                            <select name="betype" id="be_ty" class="custom-select mb-3" required>
                                <option selected></option>
                                <option value="ebk">Ebook</option>
                                <option value="abk">Audio Book</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="becatg">Book category:</label>
                            <select onclick="refreshsel();" name="becat" id="be_catg" class="custom-select mb-3" required>
                                <option id="besel" value=""></option>
                                <%
                                    ResultSet rsbe = db_connection.search("SELECT * FROM book_cats WHERE cat_del='n'");
                                    while (rsbe.next()) {
                                        String rsbe_id = rsbe.getString("cats_id");
                                        String rsbe_cat = rsbe.getString("cat_name");
                                %>
                                <option name="be_cat_name" value="<% out.println(rsbe_id); %>"/><% out.println(rsbe_cat); %></option>
                                <%}%>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="be_del">Status:</label><br>
                            <label class="radio-inline pr-sm-3">
                                <input type="radio" id="be_deln" name="uedel"> Active  
                            </label>
                            <label class="radio-inline ml-sm-2">
                                <input type="radio" id="be_dely" name="uedel"> In Active  
                            </label>

                        </div>
                       <input style="display: none" type="text" id="be_id" name="beimgid" value=""/>     
                    <!--</form>-->

                    <form id="formbe" action="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                       
                        <input style="display: none"type="text" class="form-control" id="bk_imgn" name="beimgn" required>
        
                    </div>     
                    <div class="form-group" style="display:">
                        <label for="bk_category">Upload new image:</label>
                        <br>
                        <input type="file" id="myFilebe" name="filename3">
                    </div>                      
        
                </form>
                    <div id="be_ermsg1"class="alert alert-danger" role="alert" style="display: none">Please fill out all fields.</div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group">
                    <button   type="button" class="btn btn-success" onclick="be_checkthis();
                            return false;" data-dismiss="static" > Update </button>
                    <button type="reset" class="btn btn-warning ml-5" data-dismiss="modal" onclick="">Cancel</button>
                </div>
            </div>
        </div>

    </div>
</div>


<!-- End of Modal for Book Edit-->
