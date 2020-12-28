<%@page import="java.sql.ResultSet"%>
<%@page import="dbpack.db_connection"%>
<!--<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/userArea_css.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src = "js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/navigation_js.js"></script>-->

<script>


</script>


<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    fieldset, label { margin: 0; padding: 0; }
    body{ margin: 20px; }
    h1 { font-size: 1.5em; margin: 10px; }

    /****** Style Star Rating Widget *****/

    .rating { 
        border: none;
        float: left;
    }

    .rating > input { display: none; } 
    .rating > label:before { 
        margin: 5px;
        font-size: 1.25em;
        font-family: FontAwesome;
        display: inline-block;
        content: "\f005";
    }

    .ratin2 > .half:before { 
        content: "\f089";
        position: absolute;
    }

    .rating > label { 
        color: #ddd; 
        float: right; 
    }

    /***** CSS Magic to Highlight Stars on Hover *****/

    .rating > input:checked ~ label, /* show gold star when clicked */
    .rating:not(:checked) > label:hover, /* hover current star */
    .rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

    .rating > input:checked + label:hover, /* hover current star when changing rating */
    .rating > input:checked ~ label:hover,
    .rating > label:hover ~ input:checked ~ label, /* lighten current selection */
    .rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 



</style>

<div class="container-fluid p-3 my-3 border">
    <div class=" row ml-3">
        <h3 class="alert-success">Our large collection of Ebooks</h3>
    </div>
    <div class="row">
        <div class="col">
            <h6 class="mb-1">Categories</h6>
        </div>
    </div>
    <div class="flex-row mb-3">
        <div class="btn-group btn-group-toggle" data-toggle="buttons">
            <ul class="nav nav-pills nav-justified">

                <form style="display: none" id="filterform" action=""> <input id="filterval"type="text" value=""> </form>

                <label class="btn btn-outline-primary active mr-1 mb-1">
                    <input onclick="filter_thisx();" type="radio" name="shuffle-filter" value="All" checked="checked"/> All
                </label> 
                <%

                    ResultSet rs2 = db_connection.search("SELECT * FROM book_cats WHERE cat_del='n'");

                    while (rs2.next()) {

                        String rs_id = rs2.getString("cats_id");
                        String rs_cat = rs2.getString("cat_name");

                %>
                <label class="btn btn-outline-primary active mr-1 mb-1">

                    <input type="hidden" name="hid" value="<% out.print(rs_id); %>"/>
                    <input id="filter1" type="radio" name="shuffle-filter" onclick="filter_thisx();" value="<% out.println(rs_id); %>"/> <% out.println(rs_cat); %>
                </label> 
                <%}%>
            </ul>
        </div>
    </div>

</div>
<div  class="container-fluid d-flex justify-content-center">

    <div id="deck1" class="row g-2 center-block col-lg-12">






    </div>
</div>               


<div class="modal overflow-auto modal-sm offset-sm-4"  role="dialog" id="RateWin2" >
    <div class="modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-block ">

                <h3 class="modal-title text-center">Rate this Book</h3>

            </div>
            <div class="modal-body text-center" id="ratebody2">

                <div class="card text-center" style="">
                    <img id="bookimg_rt2" class="card-img-top img-fluid" src="" alt="Card image cap" style="max-width: 95%">

                    <div class="card-body text-center text-primary">
                        <div class="text-center text-primary" id="booktitle_rt2">
                        </div>

                        <div class="text-success text-center mt-2" id="bookauth_rt2">
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-center">
                        <input type="text" id="ratebkid2" style="display: none" value=""/>

                        <fieldset class="rating">
                            <input type="radio" id="2star5" name="2stars" value="5" /><label class="full text-center" for="2star5" title="Very Good - 5 stars"></label>

                            <input type="radio" id="2star4" name="2stars" value="4" /><label class="full text-center" for="2star4" title="Good - 4 stars"></label>

                            <input type="radio" id="2star3" name="2stars" value="3" /><label class="full text-center" for="2star3" title="Normal - 3 stars"></label>

                            <input type="radio" id="2star2" name="2stars" value="2" /><label class="full text-center" for="2star2" title="Bad - 2 stars"></label>

                            <input type="radio" id="2star1" name="2stars" value="1" /><label class="full text-center" for="2star1" title="Very Bad - 1 star"></label>

                        </fieldset>

                    </div>
                    <div class=" h-25 text-info text-center">

                        <button id="rate1" type="button" class="btn btn-primary mr-3 my-2"  onclick="rate_book2();
                                return false;">Rate</button>
                        <button id="RateWinClose2" type="button" class="btn btn-secondary ml-3 my-2" data-dismiss="modal">Close</button>
                        <button style="display: none" id="rateOk2" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rateOkMod2" data-backdrop="false">Open Modal</button>
                        <button style="display: none" id="rateNo2" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rateNoMod2" data-backdrop="false">Open Modal</button>
                        <button style="display: none" id="userNo2" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#userNoMod2" data-backdrop="false">Open Modal</button>
                    </div>

                </div>                        


            </div>

        </div>
    </div>
</div> 


<!-- Modal -->
<div class="modal" id="rateOkMod2" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div id="rateOkMsg2" class="modal-body alert-success">
                <div class="alert alert-success">
                    <strong>Rating updated successfully!</strong> 
                </div>
            </div>
            <div class="modal-footer alert-success text-center">
                <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal" id="rateNoMod2" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div id="rateNoMsg2" class="modal-body alert-danger">
                <div class="alert alert-danger">
                    <strong>Rating not updated!</strong> 
                </div>
            </div>
            <div class="modal-footer alert-danger text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<div class="modal" id="userNoMod2" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-danger">
                <div class="alert alert-danger center-block">
                    <strong>Please login before rate books</strong> 
                </div>
            </div>
            <div class="modal-footer alert-danger text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="user_icon_btn();">OK</button>
            </div>
        </div>

    </div>
</div>