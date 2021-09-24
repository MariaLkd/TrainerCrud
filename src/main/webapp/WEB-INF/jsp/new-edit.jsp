<%-- 
    Document   : new-trainer
    Created on : Jun 23, 2021, 9:56:52 AM
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"        prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${title}</title>
    </head>
    <body>
        <h1 style="text-align: center;">${h1}</h1>
        <f:form action="${action}" method="POST" modelAttribute="trainer">
            First Name: <f:input path="firstname"  />
            Last Name  <f:input path="lastname"  />
            Subject <f:input path="subject"  />
            <f:hidden path="trainerid" readonly="true" />
            <input type="submit" value="Submit" />
        </f:form>
    </body>
</html>
