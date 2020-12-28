function getXmlHttpRequest() {
    var xmlhttp;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("Browser Doesnt Support Ajax!");
    }
    ;

    return xmlhttp;
}
;

function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}

function log_out() {

    sessionStorage.clear();
    localStorage.clear();
    deleteAllCookies();
    $(location).attr("href", "index.jsp");


}

function remove_fav() {

    var rem_bid = $("#uRL_bid").val();
    var rem_uid = window.uid;

    var xmlHttp = getXmlHttpRequest();

    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    document.getElementById("upNomsg").innerHTML = res;
                    $("#upNomod").modal();

                } else {
                    getRLdata();
                    setTimeout(function () {
                        $('#rLlist').DataTable();
                    }, 200);
                    document.getElementById("upOkmsg").innerHTML = res;
                    $("#upOkmod").modal();

                }
            }
        }

        xmlHttp.open("POST", "UpdateLaterList", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("rem_bid=" + rem_bid + "&rem_uid=" + rem_uid);
    }
}

function read_now() {

 var rn_bkfile = $("#uRL_bfile").val();
 var rn_bktmb = $("#uRL_btmb").val();
 var rn_bktit = $("#uRL_btit").val();        
         
    download_bk(rn_bkfile,rn_bktit,rn_bktmb); 
    

}

function rLbk_row(rm_bkid, rm_bkfile, rm_bktmb, rm_bktit) {



    $("#uRL_bid").val(rm_bkid);
    $("#uRL_bfile").val(rm_bkfile);
    $("#uRL_btmb").val(rm_bktmb);
    $("#uRL_btit").val(rm_bktit);
    $("#upConfmod").modal();

}

function readlater_bk(rlbkid, pgtype) {

    var rl_bkid = rlbkid;
    var rl_uid = window.uid;
    var pageType = pgtype;
    if (rl_uid == "noUn") {

        document.getElementById("userNo").click();
    } else {


        var xmlHttp = getXmlHttpRequest();

        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 0) {

                        if (pageType == "bktop") {
                            document.getElementById("rateNoMsg").innerHTML = ("<strong >This book is already in favourites..!</strong>");
                            $("#rateNoMod").modal('show');
                        } else if (pageType == "bkfilt") {
                            document.getElementById("rateNoMsg2").innerHTML = ("<strong >This book is already in favourites..!</strong>");
                            $("#rateNoMod2").modal('show');
                        } else {
                            document.getElementById("rateNoMsgS").innerHTML = ("<strong >This book is already in favourites..!</strong>");
                            $("#rateNoModS").modal('show');
                        }


                    } else {

                        if (pageType == "bktop") {
                            document.getElementById("rateOkMsg").innerHTML = ("<strong >Book added to read later list..!</strong>");
                            $("#rateOkMod").modal('show');
                        } else if (pageType == "bkfilt") {
                            document.getElementById("rateOkMsg2").innerHTML = ("<strong >Book added to read later list..!</strong>");
                            $("#rateOkMod2").modal('show');
                        } else {
                            document.getElementById("rateOkMsgS").innerHTML = ("<strong >Book added to read later list..!</strong>");
                            $("#rateOkModS").modal('show');
                        }

                    }
                }
            }

            xmlHttp.open("POST", "BookReadLater", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("rl_uid=" + rl_uid + "&rl_bkid=" + rl_bkid);
        }
    }
}

function download_bk(dbkfile, dbktit, dbtmb) {

    var d_bkfile = dbkfile;
    var file_type = d_bkfile.slice(d_bkfile.length - 3);
    var trname = dbktit;
    var isrc = dbtmb;
    if (window.uname == "noUn") {

        document.getElementById("userNo").click();
    } else {

        if (file_type == "pdf") {

            document.getElementById("bkViewer").setAttribute('data', d_bkfile);
            document.getElementById("pdfatag").setAttribute('href', d_bkfile);
            document.getElementById("bodyPart").style.display = "none";
            document.getElementById("bookPart").style.display = "block";
        } else if (file_type == "mp3") {

            document.getElementById("bodyPart").style.display = "none";
            document.getElementById("bookPart").style.display = "none";
            document.getElementById("playerPart").style.display = "block";
            $("#player").vpplayer({
                src: d_bkfile,
                trackName: trname,
                type: "audio/mp3",
                preloadMessage: "LOADING...",
                imgsrc: isrc
                        //view: "basic", // or minimal
                        //playerColor: "black",
                        // displayColor: "green"

            });
        }
    }
}

function getRLdata() {

    var thisUser = window.uid;

    var xmlHttp = getXmlHttpRequest();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    document.getElementById("uRdLtrArea").innerHTML = res;

                } else {

                    document.getElementById("uRdLtrArea").innerHTML = res;

                }
            }
        }

        xmlHttp.open("POST", "RdLtrForList", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("s_usr=" + thisUser);
    }
}

function getbdata() {
    var s_text2 = "ss";
    var xmlHttp = getXmlHttpRequest();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    document.getElementById("btblArea").innerHTML = ("<div class='alert alert-warning'><strong>Sorry!</strong> No Books found...!</div>");

                } else {

                    document.getElementById("btblArea").innerHTML = res;
                }
            }
        }

        xmlHttp.open("POST", "BookForlist", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("s_text2=" + s_text2);
    }
}

function getudata() {

    var s_text = "ss";
    var xmlHttp = getXmlHttpRequest();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    alert("no users found");
                } else {


                    document.getElementById("utblArea").innerHTML = res;
                }
            }
        }

        xmlHttp.open("POST", "UsersForList", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("s_text=" + s_text);
    }
}

function bedit_save() {


    var bes_tmb = $("#be_tmb").attr('src');
    var bes_id = $("#be_id").val();
    var bes_tit = $("#be_name").val();
    var bes_auth = $("#be_auth").val();
    var bes_type = $("#be_ty").val();
    var bes_cat = $("#be_catg").val();
    var bes_del = "";
    if ($("#be_dely").is(":checked")) {
        bes_del = "y";
    } else {
        bes_del = "n";
    }

//alert(bes_id);
    var xmlHttp = getXmlHttpRequest();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 1) {

                    var btable = $("#bklist").DataTable();
                    btable.clear().destroy();
                    $("#EditBook").modal('hide');
                    getbdata();
                    setTimeout(function () {
                        $('#bklist').DataTable();
                    }, 200);
                    document.getElementById("okmsg").innerHTML = ("<strong >Book details updated successfully!</strong> ");
                    $("#saveokmod").modal('show');
                } else {
                    $("#EditBook").modal('hide');
                    document.getElementById("nomsg").innerHTML = ("<strong >Error Occured!</strong>");
                    $("#saveNomod").modal('show');
                }
            }
        }

        xmlHttp.open("POST", "AdminUpdateBook", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("up_bid=" + bes_id + "&up_btit=" + bes_tit + "&up_bauth=" + bes_auth + "&up_btype=" + bes_type + "&up_bcat=" + bes_cat + "&up_bdel=" + bes_del);
    }
}

function upload_newimg() {

    var form = document.getElementById("formbe");
    //  var formData = new FormData(form);

    var fileContent = new FormData(form);
    fileContent.append("file", $('input[type=file]')[0].files[0]);
    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: "BkEditCheck",
        data: fileContent,
        processData: false,
        contentType: false,
        success: function (response) {
            $("#EditBook").modal('hide');
            document.getElementById("okmsg").innerHTML = ("<strong >New image updated successfully!</strong> ");
            $("#saveokmod").modal('show');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            $("#EditBook").modal('hide');
            document.getElementById("nomsg").innerHTML = ("<strong >Error Occured in Image update!</strong>");
            $("#saveNomod").modal('show');
        }

    });
}

function be_checkthis() {

    var bed_cat = $("#be_catg").val();
    var bed_tmb = $("#be_tmb").attr('src');
    var bed_id = $("#be_id").val();
    var bed_tit = $("#be_name").val();
    var bed_auth = $("#be_auth").val();
    var bed_type = $("#be_ty").val();
    var bed_cat = $("#be_catg").val();
    var bed_del = "";
    if ($("#be_deln").is(":checked")) {
        bed_del = "n";
    } else {
        bed_del = "y";
    }

    if (bed_cat == "" || bed_tit == "" || bed_auth == "") {
        $("#be_ermsg1").show();
        $("#be_ermsg1").fadeOut(4000);
    } else {

        var newfile = $("#myFilebe").val();
        if (newfile.length > 0) {

            upload_newimg();
            bedit_save();
            $("#myFilebe").val("");
        } else {
            bedit_save();
        }
    }

}

function edit_rowbk(beid, betit, beauth, betype, becatn, bedel, befile, betmb, becatid) {

    $("#be_tmb").attr('src', betmb);
    $("#be_name").val(betit);
    $("#be_auth").val(beauth);
    $("#be_id").val(beid);
    var newbetmb = betmb.slice(5, -4);
    //newbetmb = betmb.slice(5);
    $("#bk_imgn").val(newbetmb);
    if (betype == "ebk") {
        $("#be_ty").val("ebk");
    } else if (betype == "abk") {
        $("#be_ty").val("abk");
    }

    $("#besel").val(becatid);
    $("#besel").html(becatn);
    if (bedel == "Active") {
        $("#be_deln").prop("checked", true);
    } else if (bedel == "InActive") {
        $("#be_dely").prop("checked", true);
    }

    $("#EditBook").modal();
}

function edit_row(ueid, ueun, uemail, uetype, uepass, uedel) {
    $("#EditUser").modal();
    $("#ue_id").val(ueid);
    $("#ue_uname").val(ueun);
    $("#ue_email").val(uemail);
    $("#ue_pass").val(uepass);
    if (uetype == "Admin") {
        $("#ue_ad").prop("checked", true);
    } else {
        $("#ue_us").prop("checked", true);
    }
    if (uedel == "Active") {
        $("#ue_deln").prop("checked", true);
    } else {
        $("#ue_dely").prop("checked", true);
    }
}

function uedit_save() {

    var uesid = $("#ue_id").val();
    var uesun = $("#ue_uname").val();
    var uesmail = $("#ue_email").val();
    var uespass = $("#ue_pass").val();
    var uesdel = "";
    var uesty = "";
    if ($("#ue_ad").is(":checked")) {
        uesty = "a";
    } else {
        uesty = "u";
    }
    if ($("#ue_deln").is(":checked")) {
        uesdel = "n";
    } else {
        uesdel = "y";
    }


    if (uesun == "" || uesmail == "" || uespass == "") {


        $("#saveNomod").modal();
        document.getElementById("nomsg").innerHTML = ("<strong >Please Fill all the fields!</strong>");
    } else {

        var xmlHttp = getXmlHttpRequest();
        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 0) {
                        document.getElementById("nomsg").innerHTML = ("<strong >Duplicated Email!</strong>");
                        $("#saveNomod").modal();
                    } else {

//                        
                        getudata();
                        setTimeout(function () {
                            $('#ulist').DataTable();
                        }, 200);
                        document.getElementById("okmsg").innerHTML = ("<strong >User updated successfully!</strong> ");
                        $("#saveokmod").modal();
                    }
                }
            }

            xmlHttp.open("POST", "AdminUpdateUser", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("up_id2=" + uesid + "&up_un2=" + uesun + "&up_em2=" + uesmail + "&up_pw2=" + uespass + "&up_type2=" + uesty + "&up_del2=" + uesdel);
        }
    }
}

function search_books() {

    var s_text = document.getElementById("search1").value;
    var xmlHttp = getXmlHttpRequest();
    document.getElementById("home_tab").click();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    document.getElementById("deck2").innerHTML = ("<div class='alert alert-warning'><strong>Sorry!</strong> No Books found...!</a></div>");
                } else {

                    document.getElementById("hbk_pg").style.display = "none";
                    document.getElementById("sbk_pg").style.display = "block";
                    document.getElementById("deck2").innerHTML = res;
                }
            }
        }

        xmlHttp.open("POST", "BookSearch", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("s_text=" + s_text);
    }

}

function rate_book2() {


    var bkid2 = document.getElementById("ratebkid2").value;
    var radio2 = document.getElementsByName('2stars');
    var ratings2 = [];
    var r2 = "";
    for (var i2 = 0; i2 < radio2.length; i2++) {
        if (radio2[i2].checked) {
            ratings2.push(radio2[i2].value);
            r2 = ratings2;
        }
    }

    if (ratings2 == "") {

        document.getElementById("RateWinClose2").click();
        setTimeout(function () {
            document.getElementById("rateNo2").click();
        }, 1000);
    } else {

        var xmlHttp = getXmlHttpRequest();
        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 0) {

                        document.getElementById("RateWinClose2").click();
                        setTimeout(function () {
                            document.getElementById("rateNo2").click();
                        }, 1000);
                    } else {

                        document.getElementById("RateWinClose2").click();
                        setTimeout(function () {
                            filter_thisx();
                            document.getElementById("rateOk2").click();
                        }, 1000);
                    }
                }
            }

            xmlHttp.open("POST", "RateBook", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("bk_id=" + bkid2 + "&rate=" + r2);
        }

    }

}

function rate_book() {


    var bkid = document.getElementById("ratebkid").value;
    var radio = document.getElementsByName('stars');
    var ratings = [];
    var r = "";
    for (var i = 0; i < radio.length; i++) {
        if (radio[i].checked) {
            ratings.push(radio[i].value);
            r = ratings;
        }
    }

    if (ratings == "") {

        document.getElementById("RateWinClose").click();
        setTimeout(function () {
            document.getElementById("rateNo").click();
        }, 1000);
    } else {

        var xmlHttp = getXmlHttpRequest();
        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 0) {

                        document.getElementById("RateWinClose").click();
                        setTimeout(function () {
                            document.getElementById("rateNo").click();
                        }, 1000);
                    } else {

                        document.getElementById("RateWinClose").click();
                        setTimeout(function () {
                            document.getElementById("rateOk").click();
                        }, 1000);
                    }
                }
            }

            xmlHttp.open("POST", "RateBook", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("bk_id=" + bkid + "&rate=" + r);
        }

    }

}

function rate_bookS() {


    var bkid = document.getElementById("ratebkidS").value;
    var radio = document.getElementsByName('starsS');
    var ratings = [];
    var r = "";
    for (var i = 0; i < radio.length; i++) {
        if (radio[i].checked) {
            ratings.push(radio[i].value);
            r = ratings;
        }
    }

    if (ratings == "") {

        document.getElementById("RateWinCloseS").click();
        setTimeout(function () {
            document.getElementById("rateNoS").click();
        }, 1000);
    } else {

        var xmlHttp = getXmlHttpRequest();
        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 0) {

                        document.getElementById("RateWinCloseS").click();
                        setTimeout(function () {
                            document.getElementById("rateNoS").click();
                        }, 1000);
                    } else {

                        document.getElementById("RateWinCloseS").click();
                        setTimeout(function () {
                            document.getElementById("rateOkS").click();
                        }, 1000);
                    }
                }
            }

            xmlHttp.open("POST", "RateBook", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("bk_id=" + bkid + "&rate=" + r);
        }

    }

}

function check_ratingS() {
    if (window.uname == "noUn") {

        document.getElementById("userNoS").click();
    } else {

        document.getElementById("starRateS").click();
    }

}

function check_rating() {
    if (window.uname == "noUn") {

        document.getElementById("userNo").click();
    } else {

        document.getElementById("starRate").click();
    }

}

function check_rating2() {
    if (window.uname == "noUn") {

        document.getElementById("userNo2").click();
    } else {

        document.getElementById("starRate2").click();
    }

}

function rate_this2(id, thumb, tit, auth) {
    if (window.uname == "noUn") {

        document.getElementById("userNo2").click();
    } else {
        document.getElementById("bookimg_rt2").src = thumb;
        document.getElementById("booktitle_rt2").innerHTML = tit;
        document.getElementById("bookauth_rt2").innerHTML = auth;
        document.getElementById("ratebkid2").value = id;
        document.getElementById("starRate2").click();
    }
}

function rate_this(id, thumb, tit, auth) {
    if (window.uname == "noUn") {

        document.getElementById("userNo").click();
    } else {
        document.getElementById("bookimg_rt").src = thumb;
        document.getElementById("booktitle_rt").innerHTML = tit;
        document.getElementById("bookauth_rt").innerHTML = auth;
        document.getElementById("ratebkid").value = id;
        document.getElementById("starRate").click();
    }
}

function rate_thisS(id, thumb, tit, auth) {
    if (window.uname == "noUn") {

        document.getElementById("userNoS").click();
    } else {
        document.getElementById("bookimg_rtS").src = thumb;
        document.getElementById("booktitle_rtS").innerHTML = tit;
        document.getElementById("bookauth_rtS").innerHTML = auth;
        document.getElementById("ratebkidS").value = id;
        document.getElementById("starRateS").click();
    }
}

function user_area() {
    document.getElementById("home1").style.display = "none";
    document.getElementById("books1").style.display = "none";
    document.getElementById("adminarea1").style.display = "none";
    document.getElementById("userarea1").style.display = "block";
    if (window.uname == "noUn") {

        document.getElementById("udetail_div").style.display = "none";
        document.getElementById("ureg_div").style.display = "none";
        document.getElementById("ulog_div").style.display = "block";
    } else {
        document.getElementById("ureg_div").style.display = "none";
        document.getElementById("ulog_div").style.display = "none";
        document.getElementById("udetail_div").style.display = "block";
        my_profile();
    }
}

function upload_btn() {


    var bkType = document.getElementById("bk_ty").value;
    var bkFile = document.getElementById("bk_File").value;
    var splitters = bkFile.split('.');
    var fileEx = splitters[1];
    var countNo = splitters.length;
    if (countNo > 2) {
        document.getElementById("adBnomsg").innerHTML = ("<strong >Upload file name should not include Dot seperators..!</strong> ");
        $("#adbNomod").modal();
    } else {

        if (bkType == "ebk" && fileEx != "pdf") {
            document.getElementById("adBnomsg").innerHTML = ("<strong >Book type Ebook only accepts PDF files..!</strong> ");
            $("#adbNomod").modal();
        } else if (bkType == "abk" && fileEx != "mp3") {
            document.getElementById("adBnomsg").innerHTML = ("<strong >Book type Audiobook only accepts mp3 files..!</strong> ");
            $("#adbNomod").modal();
        } else {
            document.getElementById("bk_ex").value = fileEx;
            document.getElementById('form_bk_upload').action = "file_upload";
            //document.getElementById('form_bk_upload').submit();
            upload_addBook();
        }
    }
}

function upload_addBookImg() {


    var formadbkimg = document.getElementById("form_bkImg_upload");
    var fileContentadbkImg = new FormData(formadbkimg);
    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: "BkAudioImgUpload",
        data: fileContentadbkImg,
        processData: false,
        contentType: false,
        success: function (response) {


//            document.getElementById("adBokmsg").innerHTML = ("<strong >New Book updated successfully!</strong> ");
            document.getElementById("adBokmsg").innerHTML = (response);
            $("#adbOkmod").modal('show');
            // formadbkimg.reset();


        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            document.getElementById("adBnomsg").innerHTML = ("<strong >Error Occured in Image update!</strong>");
            $("#adbNomod").modal('show');
        }

    });
}

function upload_addBook() {

    var formadbk = document.getElementById("form_bk_upload");
    var booktype = document.getElementById("bk_ty").value;
    //fileContent.append("file", $('input[type=file]')[0].files[0]);
    var fileContentadbk = new FormData(formadbk);
    $.ajax({
        type: "POST",
        enctype: "multipart/form-data",
        url: "file_upload",
        data: fileContentadbk,
        processData: false,
        contentType: false,
        success: function (response) {


            if (booktype == "abk") {
                document.getElementById("bk_tmbName").value = response;
                formadbk.reset();
                upload_addBookImg();
            } else {
                document.getElementById("adBokmsg").innerHTML = ("<strong >New Book updated successfully!</strong> ");
                $("#adbOkmod").modal('show');
                formadbk.reset();
            }

        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

            document.getElementById("adBnomsg").innerHTML = ("<strong >Error Occured in Book update!</strong>");
            $("#adbNomod").modal('show');
        }

    });
}

function user_icon_btn() {
    document.getElementById("usr_edt").disabled = false;
    document.getElementById("user_tab").click();
}

function filter_thisx() {

    var radios = document.getElementsByName('shuffle-filter');
    var filters = [];
    var fil = "";
    for (var i2 = 0; i2 < radios.length; i2++) {
        if (radios[i2].checked) {
            filters.push(radios[i2].value);
            fil = filters;
        }

    }



    var xmlHttp = getXmlHttpRequest();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    document.getElementById("deck1").innerHTML = '<div class="col-sm-3 alert alert-danger">No books found!</div>';
                } else {

                    document.getElementById("deck1").innerHTML = res;
                }
            }
        }

        xmlHttp.open("POST", "BookFilters", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("filter_c=" + fil);
    }
}

function my_profile() {

    var s_id = window.uid;
    var xmlHttp = getXmlHttpRequest();
    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {


                    document.getElementById("myprotext").innerHTML = "No User details";
                    $("#myprotext").show();
                    $("#myprotext").fadeOut(4000);
                } else {

                    document.getElementById("myprodata").innerHTML = res;
                }
            }
        }

        xmlHttp.open("POST", "UserSearch", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("search_id=" + s_id);
    }
}

function home_btn() {

    document.getElementById("books1").style.display = "none";
    document.getElementById("adminarea1").style.display = "none";
    document.getElementById("userarea1").style.display = "none";
    document.getElementById("home1").style.display = "block";
    document.getElementById("sbk_pg").style.display = "none";
    document.getElementById("hbk_pg").style.display = "block";
}

function books_btn() {
    document.getElementById("adminarea1").style.display = "none";
    document.getElementById("userarea1").style.display = "none";
    document.getElementById("home1").style.display = "none";
    document.getElementById("books1").style.display = "block";
    setTimeout(function () {
        filter_thisx();
    }, 500);
}

function admin_btn() {

    document.getElementById("userarea1").style.display = "none";
    document.getElementById("home1").style.display = "none";
    document.getElementById("books1").style.display = "none";
    document.getElementById("adminarea1").style.display = "block";
}

function create_acc_btn() {
    window.uname == "noUn"

    document.getElementById("udetail_div").style.display = "none";
    document.getElementById("ulog_div").style.display = "none";
    document.getElementById("ureg_div").style.display = "block";
}

function addbooks_btn() {

    document.getElementById("addbook").click();
}

function edit_details_btn() {

    document.getElementById("prouname").removeAttribute("readonly");
    document.getElementById("proemail").removeAttribute("readonly");
    document.getElementById("propw").removeAttribute("readonly");
    document.getElementById("usr_updt").removeAttribute("disabled");
    document.getElementById("usr_cnsl").removeAttribute("disabled");
    document.getElementById("usr_edt").disabled = true;
}

function update_user_btn() {

    var up_id = document.getElementById("prouid").value;
    var up_un = document.getElementById("prouname").value;
    var up_em = document.getElementById("proemail").value;
    var up_pw = document.getElementById("propw").value;
    if (up_un == "" || up_em == "" || up_pw == "") {

        document.getElementById("er").innerHTML = "Fill the required details";
        $("#er").show();
        $("#er").fadeOut(4000);
    } else {

        var xmlHttp = getXmlHttpRequest();
        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == "no") {

                        document.getElementById("er").innerHTML = "Theis email already exists";
                        $("#er").show();
                        $("#er").fadeOut(4000);
                    } else {

                        document.getElementById("suc").innerHTML = "Updated Successfully";
                        $("#suc").show();
                        $("#suc").fadeOut(4000);
                        user_area();
                        document.getElementById("usr_edt").disabled = false;
                    }

                }
            }

            xmlHttp.open("POST", "UpdateUser", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("up_id1=" + up_id + "&up_un1=" + up_un + "&up_em1=" + up_em + "&up_pw1=" + up_pw);
        }
    }
}