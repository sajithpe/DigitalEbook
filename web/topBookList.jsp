<%-- 
    Document   : topBookList
    Created on : Nov 7, 2020, 10:07:26 AM
    Author     : SajithPe
--%>
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

    .rating2 { 
        border: none;
        float: left;
    }

    .rating2 > input { display: none; } 
    .rating2 > label:before { 
        margin: 5px;
        font-size: 1.25em;
        font-family: FontAwesome;
        display: inline-block;
        content: "\f005";
    }

    .rating2 > .half:before { 
        content: "\f089";
        position: absolute;
    }

    .rating2 > label { 
        color: #ddd; 
        float: right; 
    }

    /***** CSS Magic to Highlight Stars on Hover *****/

    .rating2 > input:checked ~ label, /* show gold star when clicked */
    .rating2:not(:checked) > label:hover, /* hover current star */
    .rating2:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

    .rating2 > input:checked + label:hover, /* hover current star when changing rating */
    .rating2 > input:checked ~ label:hover,
    .rating2 > label:hover ~ input:checked ~ label, /* lighten current selection */
    .rating2 > input:checked ~ label:hover ~ label { color: #FFED85;  } 



</style>
<div class=" row ml-3 ">
    <h3 class="alert-success">Top Rated Books</h3><br>
</div><br>
<div class="container-fluid d-flex justify-content-center">


    <div class="row g-2 center-block">
        <%

            ResultSet rs = db_connection.search("SELECT *, TRUNCATE(bk_rating.bk_rate / bk_rating.rate_count,0) AS rate"
                    + " FROM ((bk_dtl LEFT JOIN book_cats ON bk_dtl.cats_id = book_cats.cats_id) "
                    + "LEFT JOIN bk_rating ON bk_dtl.bk_id = bk_rating.bk_id) WHERE bk_del='n' ORDER BY rate DESC ");
            while (rs.next()) {

                String rs_tit = rs.getString("bk_name");
                String rs_auth = rs.getString("bk_author");
                String rs_cat = rs.getString("cat_name");
                String rs_bkfile = rs.getString("bk_file");
                String rs_tmb = rs.getString("bk_tmb");
                int rs_rate = rs.getInt("rate");
                String rs_bkid = rs.getString("bk_id");
                String starimg = null;

                if (rs_rate == 0) {
                    starimg = "images/Star_0.png";
                } else if (rs_rate == 1) {
                    starimg = "images/Star_rating_1.png";
                } else if (rs_rate == 2) {
                    starimg = "images/Star_rating_2.png";
                } else if (rs_rate == 3) {
                    starimg = "images/Star_rating_3.png";
                } else if (rs_rate == 4) {
                    starimg = "images/Star_rating_4.png";
                } else if (rs_rate == 5) {
                    starimg = "images/Star_rating_5.png";
                }


        %>

        <div class="col-11  col-lg-3 card-deck">
            <div class="card mb-3" style="max-width: 540px">
                <img id="bookimg" class="card-img-top" src="<% out.println(rs_tmb); %>" alt="Card image cap">


                <div class="card-header text-center">
                    <a href="product.html" title="View Product" id="bkTitle">
                        <% out.println(rs_tit); %></a>
                </div>
                <div class="card-body text-success text-center">
                    <% out.println(rs_auth); %>
                </div>
                <div class="card-footer text-info text-center mb-1">
                    <% out.println(rs_cat); %>
                </div>
                <div class="row my-1">
                    <div class="col mx-2">
                        <h3 onclick="download_bk('<%=rs_bkfile%>','<%=rs_tit%>','<%=rs_tmb%>');" class="btn btn-danger btn-block">Download</h3>
                    </div>
                    <div class="col mx-2">
                        <h3 onclick="readlater_bk('<%=rs_bkid%>','bktop')" class="btn btn-primary btn-block">Read later</h3>
                    </div>

                </div>

                <div class="row my-1 text-center">
                    <div class="my-2 btn-sm btn-light mx-auto d-block" style="max-width: 50%">
                        <input id="rateValue" type="text" hidden="true" value="<% out.println(rs_rate); %>">
                        <input id="bookid" type="text" hidden="true" value="<% out.println(rs_bkid); %>">
                        <img class="img-fluid mx-auto d-block" src="<% out.println(starimg);%>" onclick="rate_this('<%=rs_bkid%>', '<%=rs_tmb%>', '<%=rs_tit%>', '<%=rs_auth%>');">
                        <button style="display: none"id="starRate" data-toggle="modal" data-target="#RateWin"></button>
                    </div>
                </div>

            </div>
        </div><br>

        <%
                ;
            }
        %>
    </div>
</div>               

<div class="modal overflow-auto modal-sm offset-sm-4"  role="dialog" id="RateWin" >
    <div class="modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header d-block ">

                <h3 class="modal-title text-center">Rate this Book</h3>

            </div>
            <div class="modal-body text-center" id="ratebody1">

                <div class="card text-center" style="">
                    <img id="bookimg_rt" class="card-img-top img-fluid" src="" alt="Card image cap" style="max-width: 95%">

                    <div class="card-body text-center text-primary">
                        <div class="text-center text-primary" id="booktitle_rt">
                        </div>

                        <div class="text-success text-center mt-2" id="bookauth_rt">
                        </div>
                    </div>

                    <div class="card-footer d-flex justify-content-center">
                        <input type="text" id="ratebkid" style="display: none" value=""/>

                        <fieldset class="rating2">
                            <input type="radio" id="star5" name="stars" value="5" /><label class="full text-center" for="star5" title="Very Good - 5 stars"></label>

                            <input type="radio" id="star4" name="stars" value="4" /><label class="full text-center" for="star4" title="Good - 4 stars"></label>

                            <input type="radio" id="star3" name="stars" value="3" /><label class="full text-center" for="star3" title="Normal - 3 stars"></label>

                            <input type="radio" id="star2" name="stars" value="2" /><label class="full text-center" for="star2" title="Bad - 2 stars"></label>

                            <input type="radio" id="star1" name="stars" value="1" /><label class="full text-center" for="star1" title="Very Bad - 1 star"></label>

                        </fieldset>

                    </div>
                    <div class=" h-25 text-info text-center">

                        <button id="rate1" type="button" class="btn btn-primary mr-3 my-2"  onclick="rate_book();
                                return false;">Rate</button>
                        <button id="RateWinClose" type="button" class="btn btn-secondary ml-3 my-2" data-dismiss="modal">Close</button>
                        <button style="display: none" id="rateOk" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rateOkMod" data-backdrop="false">Open Modal</button>
                        <button style="display: none" id="rateNo" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#rateNoMod" data-backdrop="false">Open Modal</button>
                        <button style="display: none" id="userNo" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#userNoMod" data-backdrop="false">Open Modal</button>
                    </div>

                </div>                        


            </div>

        </div>
    </div>
</div> 


<!-- Modal -->
<div class="modal" id="rateOkMod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div id="rateOkMsg" class="modal-body alert-success">
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

<div class="modal" id="rateNoMod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div id="rateNoMsg" class="modal-body alert-danger">
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

<div class="modal" id="userNoMod" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">

            <div class="modal-body alert-danger">
                <div class="alert alert-danger center-block">
                    <strong>Please login first...!!!</strong> 
                </div>
            </div>
            <div class="modal-footer alert-danger text-center">
                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="user_icon_btn();">OK</button>
            </div>
        </div>

    </div>
</div>