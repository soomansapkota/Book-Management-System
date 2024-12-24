<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book</title>
    <!-- Bootstrap CSS for responsiveness -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #def1dc; /* Tomato color */
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
        .head{
            color: #59f15b;
        }

        .btn-tomato {
            background-color: #59f15b;
            color: white;
        }

        .btn-tomato:hover {
            background-color: #59f15b;
        }

        .edit-form {
            display: block;
            margin-top: 20px;
        }

        .success-message {
            color: green;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <span class="head">
    <h1 class="text-center">Update Book</h1>
</span>
    <!-- Success message (displays after successful update) -->
    <div id="success-message" class="success-message" style="display:none;">
        <p>Book updated successfully!</p>
    </div>

    <!-- Update Form -->
    <form action="/update" method="POST">
        <!-- Hidden field for book ID -->
        <input type="hidden" name="id" value="${book.id}">

        <div class="form-group">
            <label for="name">Book Name</label>
            <input type="text" class="form-control" id="name" name="name" value="${book.name}" required>
        </div>
        <div class="form-group">
            <label for="isbn">ISBN</label>
            <input type="text" class="form-control" id="isbn" name="isbn" value="${book.isbn}" required>
        </div>

        <button type="submit" class="btn btn-success">Update</button>
    </form>

    <br>
    <a href="/" class="btn btn-primary">Back to Book List</a>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
