<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">

       

<!--        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src = "js/jquery.min.js"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/vpplayer.js"></script>
        <link rel="stylesheet" type="text/css" href="css/vpplayer.css">-->



    </head>
    <style>
        body { background-color: #222; font-family: 'Roboto'; }
        h1,h2{ color: #fff; text-align: center; }
        h1 { margin: 150px auto 30px auto; }
        .demo {
            max-width: 800px;
            margin: 20px auto;
        }
    </style>
    <script>

        function get_mp3_data() {


        }
        $(document).ready(function () {
            $("#player").vpplayer({
                src: "bks/1608701435273.mp3",
                trackName: window.trname,
                type: "audio/mp3",
                preloadMessage: "LOADING...",
                imgsrc: "tmbs/1608701435273.jpg"
                        //view: "basic", // or minimal
                        //playerColor: "black",
                        // displayColor: "green"

            });
        });
    </script>

    <body>


        <div id="player" class="demo"></div>

    </body>

</html>
