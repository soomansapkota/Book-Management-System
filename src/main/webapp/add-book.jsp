<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Book</title>

    <!-- Bootstrap CSS for responsiveness and styling -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Tomato color theme for the page -->
    <style>
        body {
            background-color: #f1e7e7; /* Tomato background */
            color: white;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 50px;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-tomato {
            background-color: #ff6347; /* Tomato button */
            color: white;
        }

        .btn-tomato:hover {
            background-color: #e5533e; /* Darker shade on hover */
        }

        h1 {
            color: #ff6347; /* Tomato color for heading */
        }
    </style>
</head>
<body>

<!-- Main container -->
<div class="container">
    <h1 class="text-center">Add New Book</h1>
    <form action="/insert" method="POST">
        <!-- Name Field -->
        <div class="form-group">
            <label for="name">Book Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter book name" required>
        </div>

        <!-- ISBN Field -->
        <div class="form-group">
            <label for="isbn">ISBN</label>
            <input type="text" class="form-control" id="isbn" name="isbn" placeholder="Enter ISBN" required>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-tomato btn-block">Add Book</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
