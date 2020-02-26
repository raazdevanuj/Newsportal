<%-- 
    Document   : register
    Created on : 19-Feb-2020, 07:19:23
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="base.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript">
            function checkAccept(x,y){
                if(x.checked){
                    y.disabled=false;
               }
               else
               {
                   y.disabled=true;
               }
            }
              function comparePwds(x,y){
                if(x===y)
                    return true;
                else {
                    alert("Password and Confirm Password not matched !!");
                    return false;
                }
            }
           function checkage(x)
           {
               var today =new Date();
               var y= new Date(x);
               if((today.getFullYear()-y.getFullYear())<18)
               {
                   alert("please enter vaild dob");
                   return false;
               }
               return true;
           }
             function varifyUserid(x,y){
               ajax = new XMLHttpRequest();
                ajax.open("GET","UserController?op=varify&userid="+x,true);
                ajax.send();
                
                ajax.onreadystatechange=function(){
                    if (this.readyState==4 && this.status==200){
                        y.innerHTML=this.responseText;
                    }
                };
            }
            function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                   pic.src= e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
             </script>
    </head>
    <body class="bg-dark">
        <form enctype="multipart/form-data" action="UserController?op=Add" method="post" onsubmit="return comparePwds(password.value,rpassword.value)&& checkage(dob.value);"> 
    <center>
        <h2  class="text-light bg-dark shadow ">REGISTRATION FORM </h2>
        <table class="bg-secondary text-white font-weight-bold" border="2" width="50%" class="form"> 
            <tr>
                <td>Enter your Name </td>
                <td><input type="text" name="name" required="required" autocomplete="off" class="form-control"/> </td>
            </tr> <tr>
                <td>Enter your Father's Name </td>
                <td><input type="text" name="fname" required="required" class="form-control"/> </td>
            </tr>
             <tr>
                <td>Enter UserId </td>
                <td><input type="email" required="required" name="userid" class="form-control" onblur="varifyUserid(this.value,s1);"/><br/>
                    <span id="s1"> </span>
                </td>
            </tr>
              <tr>
                <td>Enter Password </td>
                <td><input type="password" name="password" id="password" class="form-control" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" />
                    <span><b>Password should be minimum 8 char and contains<br> one Upper, one Lower, one Special and one digit</b></span></td>
            </tr>
            <tr>
                <td>Retype Password </td>
                <td><input type="password" name="rpassword" id="rpassword" class="form-control"/></td>
            </tr>
            
             <tr>
                <td>Enter your DOB </td>
                <td><input type="date" name="dob" id="dob" class="form-control" onblur="varifyUserid(this.value,s1);" /> 
                    <span><p id="t"></p></span></td>
            </tr>
             <tr>
                <td>Select Your Gender </td>
                <td> <input type="radio" name="gender" value="Male"> Male</input>
                 <input type="radio" name="gender" value="Female"/>Female<br/>
                </td>
             <tr><td>Select Your Profile Image </td>
           <td>
                 <img src="assets/Images/ophoto.jpg" style="width:200px;height: 200px" class="img" id="pic"/><br/>
              <input type="file" name="photo" id="photoInput" class="form-control"  onchange="readURL(this);" /></td>
            </tr>
            </tr> 
                <td>Select Your Hobbies </td>
                <td>
                    
                    <input type="checkbox" name="hobbies" value="Dancing" >Dancing</input>
                     <input type="checkbox" name="hobbies" value="Singing"/>Singing <br/>
                    <input type="checkbox" name="hobbies" value="Cooking"/>Cooking
                    <input type="checkbox" name="hobbies" value="Drawing"/>Drawing
                 </td>
            </tr>
            <tr>
                <th colspan="2">
                    <input type="checkbox" id="accept" value="accept" onchange="checkAccept(this,submit);">Accept Terms and Conditions
                </th>
            </tr>
            <tr>
                 
                <th class="text-center" colspan="2">
                    <input type="reset" value="Clear" class=" btn btn-dark"/>
                    <input type="submit" value="submit"class=" btn btn-primary" disabled="disabled" id="submit"/> 
                </th>
            </tr>
            
         </table>
    </center>
        </form>
    </body>
</html>