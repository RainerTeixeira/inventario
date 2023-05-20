<!DOCTYPE html>
<html>
<head>
    <title>Página Inicial</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            background-image: url('img/background.jpg');
            background-size: cover;
            background-position: center;
        }

        .container {
            max-width: 400px;
            margin: 100px auto;
            padding: 40px;
            background-color: #ffffff;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: #ffffff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bem-vindo à Página Inicial.</h1>
        <form action="painel.php" method="post">
            <input type="text" name="username" placeholder="Usuário" required>
            <input type="password" name="password" placeholder="Senha" required>
            <input type="submit" value="Login" class="button">
        </form>
    </div>
</body>
</html>
