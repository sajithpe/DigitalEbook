
function getXmlHttpRequest() {
    var xmlhttp;

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        alert("Browser Doesnt Support Ajax!");
    }

    return xmlhttp;
}


function loading(st, id) {

    if (st == 1) {

        document.getElementById(id).style.display = "block";
    } else {

        document.getElementById(id).style.display = "none";
    }
}

var user_id = 0;
function edit_for_search(u_id) {

    var uid = u_id;
    user_id = u_id;

    var xmlHttp = getXmlHttpRequest();

    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {
                loading(1, "load_img");
                //document.getElementById("load_img").style.display = "block";
            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                loading(1, "load_img");
                // document.getElementById("load_img").style.display = "none";
                document.getElementById("mod_body1").innerHTML = res;

            }
        }

        xmlHttp.open("POST", "edit_for_search", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("u1=" + uid);
    }
}

function update_user() {

    var u1 = document.getElementById("uname").value;
    var n1 = document.getElementById("name1").value;
    var n2 = document.getElementById("name2").value;
    var em = document.getElementById("email").value;
    var update_uid = user_id;




    var xmlHttp = getXmlHttpRequest();

    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {
                // loading(1);
            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                $("#u_list").load("UserList.jsp #u_list");
                //document.getElementById("mod_body1").innerHTML = res;



            }
        }

        xmlHttp.open("POST", "update_user", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("un1=" + u1 + "&nm1=" + n1 + "&nm2=" + n2 + "&em1=" + em + "&uid1=" + update_uid);
    }
}



var u_stat = 0;

var del_stat = 0

function test(id, d, c) {


    del_stat = d;
    user_id = id;
    count = "h" + c;
    username = document.getElementById(count).value;

    document.getElementById("mod_id").innerHTML = id;
    document.getElementById("mod_un").innerHTML = username;

}


function del_user() {

    alert(user_id);
}

function list_users() {


    alert("test");

    document.getElementById("table_div").style.display = "block";


}

