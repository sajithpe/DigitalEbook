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




<style>
    @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

    fieldset, label { margin: 0; padding: 0; }
    body{ margin: 20px; }
    h1 { font-size: 1.5em; margin: 10px; }

    /****** Style Star Rating Widget *****/

    .ratingS { 
        border: none;
        float: left;
    }

    .ratingS > input { display: none; } 
    .ratingS > label:before { 
        margin: 5px;
        font-size: 1.25em;
        font-family: FontAwesome;
        display: inline-block;
        content: "\f005";
    }

    .ratingS > .half:before { 
        content: "\f089";
        position: absolute;
    }

    .ratingS > label { 
        color: #ddd; 
        float: right; 
    }

    /***** CSS Magic to Highlight Stars on Hover *****/

    .ratingS > input:checked ~ label, /* show gold star when clicked */
    .ratingS:not(:checked) > label:hover, /* hover current star */
    .ratingS:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

    .ratingS > input:checked + label:hover, /* hover current star when changing rating */
    .ratingS > input:checked ~ label:hover,
    .ratingS > label:hover ~ input:checked ~ label, /* lighten current selection */
    .ratingS > input:checked ~ label:hover ~ label { color: #FFED85;  } 



</style>
<div class=" row ml-3 ">
    <h3 class="alert-success">Search results</h3>
</div>

<div  class="container-fluid d-flex justify-content-center">

    <div id="deck2" class="row g-2 center-block col-lg-12">

    </div>
</div>                


<div class="modal overflow-auto modal-sm offset-sm-4"  role="dialog" id="RateWinS" >
    <div class="modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-block ">

                <h3 class="modal-title text-center">Rate this Book</h3>

            </div>
            <div class="modal-body text-center" id="ratebodyS">

                <div class="card text-center" style="">
                    <img id="bookimg_rtS" class="card-img-top img-fluid" src="" alt="Card image cap" style="max-width: 95%">

                    <div class="card-body text-center text-primary">
                        <div class="text-center text-primary" id="booktitle_rtS">
                        </div>

                        <div class="text-success text-center mt-2" id="bookauth_rtS">
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-center">
                        <input type="text" id="ratebkidS" style="display: none" value=""/>

                        <fieldset class="ratingS">
                            <input type="radio" id="star5S" name="starsS" value="5" /><label class="full text-center" for="star5S" title="Very Good - 5 stars"></label>

                            <input type="radio" id="star4S" name="starsS" value="4" /><label class="full text-center" for="star4S" title="Good - 4 stars"></label>

                            <input type="radio" id="star3S" name="starsS" value="3" /><label class="full text-center" for="star3S" title="Normal - 3 stars"></label>

                            <input type="radio" id="star2S" name="starsS" value="2" /><label class="full text-center" for="star2S" title="Bad - 2 stars"></label>

                            <input type="radio" id="star1S" name="starsS" value="1" /><label class="full text-center" for="star1S" title="Very Bad - 1 star"></label>

                        </fieldset>

                    </div>
                    <div class=" h-25 text-info text-center">

                        <button id="rate1S" type="button" class="btn btn-primary mr-3 my-2"  onclick="rate_bookS();
                                return false;">Rate</button>
                        <button id="RateWinCloseS" type="button" class="btn btn-secondary ml-3 my-2" data-dismiss="modal">Close</button>
                        <button style="display: none" id="rateOkS" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rateOkModS" data-backdrop="false">Open Modal</button>
                        <button style="display: none" id="rateNoS" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rateNoModS" data-backdrop="false">Open Modal</button>
                        <button style="display: none" id="userNoS" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#userNoModS" data-backdrop="false">Open Modal</button>
                    </div>

                </div>                        


            </div>

        </div>
    </div>
</div> 


<!-- Modal -->
<div class="modal" id="rateOkModS" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div id="rateOkMsgS" class="modal-body alert-success">
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

<div class="modal" id="rateNoModS" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div id="rateNoMsgS" class="modal-body alert-danger">
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
<div class="modal" id="userNoMods" role="dialog">
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