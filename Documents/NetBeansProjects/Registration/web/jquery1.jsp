<%-- 
    Document   : jquery1
    Created on : 24-Feb-2020, 08:21:29
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="base.jsp"></jsp:include>
        <script type="text/javascript">
        $(document).ready(function(){
       // alert('hello');
       
       // $("button").click(function(){alert('hello');});
        
        $("#b1").click(function(){
            alert('hello');
        });
        
        $("#b2").click(function(){
            $("#div1").hide(1000);
        });
    });
        </script>
    </head>
   
    <body>
        <h1>Hello World!</h1>
        <button id="b1">Click me</button> <br/>
        <button id="b2">Click again</button>
        
        <div id="div1" style="height: 100px; background-color: orange"></div>
    </body>
</html>
