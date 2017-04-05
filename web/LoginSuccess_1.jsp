<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>DEMO3</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="cssBoot/bootstrap.min.css">
        <link rel="stylesheet" href="cssBoot/demo.css">
        <link rel="stylesheet" href="cssBoot/fakeLoader.css">
    </head>
    <body>
    <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
        <div class="fakeloader"></div>

     
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/fakeLoader.min.js"></script>
        <script>
            $(document).ready(function(){
                $(".fakeloader").fakeLoader({
                    timeToHide:1200,
                    bgColor:"#3498db",
                    spinner:"spinner4"
                });
            });
        </script>

    </body>
</html>



