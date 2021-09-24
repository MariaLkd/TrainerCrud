<%-- 
    Document   : trainers
    Created on : Jun 20, 2021, 9:06:54 ΑM
    Author     : Maria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trainers</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>-->
        <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.js"></script>
    </head>
    <body>
        <h1 style="text-align:center;">Trainers</h1>
        <button><a href="/new">New Trainer</a></button>
        <br><br>
        <table id="trainers_table" class="display" style="width:100%">
            <thead>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Subject</th>
            <th></th>
            <th></th>
        </thead>
        <tbody>
            <c:forEach items="${trainers}" var="trainer">  
                <tr>
                    <td><c:out value="${trainer.trainerid}"/></td>
                    <td>${trainer.firstname}</td>
                    <td>${trainer.lastname}</td>
                    <td>${trainer.subject}</td>
                    <td><a href="/edit/${trainer.trainerid}">Edit</a></td>
                    <td><a href="/delete/${trainer.trainerid}">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script>
        $(document).ready(function () {
            $('#trainers_table').DataTable();
        });
    </script>
</body>
</html>
