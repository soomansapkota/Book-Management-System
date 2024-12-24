<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #59f15b">
        <div class="container-fluid">
            <span class="navbar-brand mx-auto fs-3 fw-bold text-center">
                Book Management App
            </span>
        </div>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <span class="container">
        <span class="container text-left">

            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
                New Book</a>
        </span>
        <hr>
        <h3 class="text-center">Book List :</h3>
        <hr>

        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>ISBN</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!--   for (Todo todo: todos) {  -->
            <c:forEach var="book" items="${listBook}">

                <tr>
                    <td>
                        <c:out value="${book.id}" />
                    </td>
                    <td>
                        <c:out value="${book.name}" />
                    </td>
                    <td>
                        <c:out value="${book.isbn}" />
                    </td>
                    <td><a href="edit?id=<c:out value='${book.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="delete?id=<c:out value='${book.id}' />">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
    </span>
</div>
</body>

</html>