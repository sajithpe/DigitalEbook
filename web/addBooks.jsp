<%@page import="dbpack.db_connection"%>
<%@page import="java.sql.ResultSet"%>
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
        $("#bk_ty").on('change', function () {

            var t = $(this).val();
            if (t == "abk") {
                $("#ad_img").show();
                $("#bkimg2").prop("disabled", false);
            } else {
                $("#ad_img").hide();
                $("#bkimg2").prop("disabled", true);

            }
        });

    });


    function checkthis() {

        var bkName = document.getElementById("bk_name").value;
        var bkAuthor = document.getElementById("bk_auth").value;
        var bkType = document.getElementById("bk_ty").value;
        var bkCat = document.getElementById("bk_catg").value;
        var bkFile = document.getElementById("bk_File").value;
        var bkImage = document.getElementById("bkimg2").value;

        if (bkName == "" || bkAuthor == "" || bkType == "" || bkCat == "" || bkFile == "") {
            document.getElementById("adBnomsg").innerHTML = ("<strong >All fields are mandatory..!</strong> ");
            $("#adbNomod").modal();
        } else {

            if (bkType == "ebk") {

                if (bkFile == "") {
                    document.getElementById("adBnomsg").innerHTML = ("<strong >Please select a PDF file..!</strong> ");
                    $("#adbNomod").modal();
                } else {
                    upload_btn();
                }

            } else if (bkType == "abk") {

                if (bkFile == "" || bkImage == "") {
                    document.getElementById("adBnomsg").innerHTML = ("<strong >Please select a MP3 file and an Image..!</strong> ");
                    $("#adbNomod").modal();
                } else {
                    upload_btn();
                }
            }

        }

    }
</script>




<div class="container col-8">
    

    <form action="" id="form_bk_upload" name="bkUploadForm" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
        <h3>Add new books</h3>
        <div class="form-group">
            <label for="bk_name">Book Name:</label>
            <input type="text" class="form-control" id="bk_name" name="bkname" required>           
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="bk_auth">Author:</label>
            <input type="text" class="form-control" id="bk_auth" name="bkauth" required>            
            <div class="invalid-feedback">Please fill out this field.</div>
        </div>
        <div class="form-group">
            <label for="bk_ty">Book Type:</label>
            <select name="bktype" id="bk_ty" class="custom-select mb-3" required>
                <option selected></option>
                <option value="ebk">Ebook</option>
                <option value="abk">Audio Book</option>
            </select>
        </div>
        <div class="form-group">
            <label for="bk_catg">Book category:</label>
            <select name="bkcat" id="bk_catg" class="custom-select mb-3" required>
                <option selected></option>
                <%
                    ResultSet rs = db_connection.search("SELECT * FROM book_cats WHERE cat_del='n'");
                    while (rs.next()) {
                        String rs_id = rs.getString("cats_id");
                        String rs_cat = rs.getString("cat_name");
                %>
                <option name="ab_cat_name" value="<% out.println(rs_id); %>"/><% out.println(rs_cat); %></option>
                <%}%>
            </select>
        </div>
        <div class="form-group">
            <label for="bk_category">Upload Book:</label>
            <br>
            <input type="file" id="bk_File" name="bkfile" required/>
            <div class="invalid-feedback">Please fill out this field.</div>
            <input style="display: none" type="text" id="bk_ex" name="fileex" value="" >
        </div>
    </form>
    <form action="" id="form_bkImg_upload" name="bkImgUploadForm" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
        <div id="ad_img"class="form-group" style="display:none">
            <label for="bk_category">Upload Image for Audio book</label>
            <br>
             <input style="display: none" type="text" id="bk_tmbName" name="bkimgn">
            <input  type="file" id="bkimg2" name="bkimg" required/>
            <div class="invalid-feedback">Please fill out this field.</div>
           
           
            <br>
        </div> 
    </form>
    <div class="btn-group">
        <button   type="button" class="btn btn-success" onclick="checkthis();
                return false;" > Upload </button>
        <button type="reset" class="btn btn-warning ml-5">Cancel</button>
    </div>
    <div class="form-group">

    </div>

</div>


<div class="alert alert-danger" role="alert" id="er1" style="display: none" >


</div>
<!-- message box modals-->
<div class="modal" id="adbOkmod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-success">
                <div id="adBokmsg" class="alert alert-success">

                </div>
            </div>
            <div class="modal-footer alert-success text-center">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal" id="adbNomod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-danger">
                <div id="adBnomsg" class="alert alert-danger">

                </div>
            </div>
            <div class="modal-footer alert-danger text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<!-- end of message box modals-->


