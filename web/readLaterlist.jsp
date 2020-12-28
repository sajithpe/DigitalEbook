<%-- 
    Document   : readLaterlist
    Created on : Dec 27, 2020, 10:27:58 AM
    Author     : SajithPe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
    $(document).ready(function () {
        getRLdata();
        setTimeout(function () {
            $('#rLlist').DataTable();
        }, 200);

    });
</script>
<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#rLlist tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>


<div class="container mt-3">
    <div id="uRdLtrArea" class="table-responsive">


        <br>

    </div>

</div>     


<!-- message box modals-->
<div class="modal" id="upOkmod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-success">
                <div id="upOkmsg" class="alert alert-success">

                </div>
            </div>
            <div class="modal-footer alert-success text-center">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal" id="upNomod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-danger">
                <div id="upNomsg" class="alert alert-danger">

                </div>
            </div>
            <div class="modal-footer alert-danger text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal" id="upConfmod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-warning">
                <div id="upConfmsg" class="alert alert-warning">
                    <div class='alert alert-warning'><strong>Confirm!</strong> What do you want to perform with this book...?</div>
                     <input style="display: none" type="text" id="uRL_bid" name="uRL_bid" value=""/>
                     <input style="display: none" type="text" id="uRL_bfile" name="uRL_bfile" value=""/>
                     <input style="display: none" type="text" id="uRL_btmb" name="uRL_btmb" value=""/>
                     <input style="display: none" type="text" id="uRL_btit" name="uRL_btit" value=""/>
                </div>
            </div>
            <div class="modal-footer alert-warning text-center">
                <div class="btn-group clearfix">
                    <button type="button" class="btn btn-primary mx-2 float-left " data-dismiss="modal" onclick="read_now();">Read now</button>
               
                    <button type="button" class="btn btn-danger mx-2" data-dismiss="modal" onclick="remove_fav();">Remove from favourites</button>
                
                    <button type="button" class="btn btn-dark mx-2 " data-dismiss="modal">Cancel </button>
                
                </div>

            </div>
        </div>

    </div>
</div>

<!-- end of message box modals-->
