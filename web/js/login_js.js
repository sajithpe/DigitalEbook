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


function loguser() {

    var em = document.getElementById("email").value;
    var pw = document.getElementById("pwd").value;
    if (em == "" || pw == "") {

        document.getElementById("er1").style.display = "block";
        document.getElementById("er1").innerHTML = "Fill the required details";

        return false;

    } else {

        var xmlHttp = getXmlHttpRequest();

        if (xmlHttp != null) {
            xmlHttp.onreadystatechange = function () {
                if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {

                }
                if (xmlHttp.readyState == 4) {
                    var res = xmlHttp.responseText;
                    if (res == 0) {

                        document.getElementById("er1").innerHTML = "Invalid Email or Password";
                        $("#er1").show();
                        $("#er1").fadeOut(4000);

                    } else {

                        var input = res
                        var fields = input.split('&');

                        var success = fields[0];
                        var un = fields[1];
                        var uty = fields[2];
                        var uid = fields[3];

                        sessionStorage.setItem('ses_un', un);
                        sessionStorage.setItem('ses_uty', uty);
                        sessionStorage.setItem('ses_uid', uid);
                        $(location).attr("href", "index.jsp");

                    }
                }
            }

            xmlHttp.open("POST", "LogUser", true);
            xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlHttp.send("em1=" + em + "&pw1=" + pw);
        }
    }

}

function reg_user() {
    var u1 = document.getElementById("uname").value;
    var em = document.getElementById("email").value;
    var pw = document.getElementById("pw").value;



    var xmlHttp = getXmlHttpRequest();

    if (xmlHttp != null) {
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 1 || xmlHttp.readyState == 2 || xmlHttp.readyState == 3) {
                // loading(1);


            }
            if (xmlHttp.readyState == 4) {
                var res = xmlHttp.responseText;
                if (res == 0) {

                    //document.getElementById("er1").style.display = "block";
                    $("#er1").show();
                    $("#er1").fadeOut(4000);
                } else {

                    $(location).attr("href", "index.jsp");
                }

            }
        }

        xmlHttp.open("POST", "CreatAcc", true);
        xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlHttp.send("un1=" + u1 + "&em1=" + em + "&pw1=" + pw);
    }
}



