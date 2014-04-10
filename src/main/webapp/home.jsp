<%--
  Created by IntelliJ IDEA.
  User: traw
  Date: 07/04/14
  Time: 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP Page</title>
    <script type="text/javascript">
        function showuser(str){
            var xreq;
            if(str==""){
                document.getElementById("showtext").innerHTML="";
                return;
            }
            if(window.XMLHttpRequest){
                xreq = new XMLHttpRequest();
            } else {
                xreq = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xreq.onreadystatechange = function(){
                if( (xreq.readyState) == 4 && (xreq.status == 200) ){
                    document.getElementById("showtext").innerHTML = xreq.responseText;
                }
            }
            console.log("sending request to : " + str);
            xreq.open("get", "getstudent?getstudent="+str, "true");
            xreq.send();
        }
    </script>
</head>
<body>
<form>
    <select name="user" onchange="showuser(this.value)">
        <option value="">Select Student name...</option>
        <option value="2">urvashi</option>
        <option value="1">rajdip</option>
        <option value="2">sanju</option>
    </select>
</form>
<br/>
<div id="showtext">The response will come here</div>
</body>
</html>
