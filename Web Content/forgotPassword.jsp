<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - Banasthali Vidyapith</title>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { 
            font-family: Arial, sans-serif; 
            background: linear-gradient(to bottom, #a6dcef, #ffffff); 
            min-height: 100vh; 
            color: #333; 
            display: flex; 
            flex-direction: column; 
            align-items: center; 
            justify-content: center;
            text-align: center;
        }

   .navbar {
            width: 100%;
            background-color: #1565c0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar .logo {
            display: flex;
            align-items: center;
        }

        .navbar .logo img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
            border-radius: 50%;
        }

        .navbar .logo span {
            font-size: 20px;
            font-weight: bold;
            color: #fff;
        }

        .navbar .links {
            list-style: none;
            display: flex;
            gap: 20px;
            margin-right: 100px;
        }

        .navbar .links a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }

        .navbar .links a:hover {
            color: #ffeb3b;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 600px; 
            width: 2000px; 
            margin-top: 20px;
        }

        .heading { 
            font-size: 30px; 
            font-weight: bold; 
            margin-bottom: 20px; 
            color: #1565c0;
            text-align: center;
        }

        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            text-align: center;
            margin: 15px auto;
            font-size: 25px;
        }

        .form-container h2 { margin-bottom: 10px; }

        .form-container input { 
            width: 100%; 
            padding: 10px; 
            margin: 10px 0; 
            border: 1px solid #ccc; 
            border-radius: 5px; 
            font-size:20px;
        }

        .form-container button { 
            width: 100%; 
            padding: 10px; 
            background-color: #1565c0; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            font-size: 20px; 
        }

        .form-container button:hover { background-color: #003c8f; }

        .error { 
            color: red; 
            margin-top: 10px; 
            display: none; 
        }

        .info-box {
            background-color: #d4edda;
            color: #155724;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
   <div class="navbar">
        <div class="logo">
            <img src="images/bv.jpeg" alt="College Logo" />
            <span>Banasthali Vidyapith Placement Portal</span>
        </div>
        <ul class="links">
            <li><a href="frontpg.jsp">Home</a></li>
            <li><a href="aboutUs.jsp">About</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
            <li><a href="placement.jsp">Placements</a></li>
        </ul>
    </div>
    <div class="main-content">
        <div class="heading">Forgot Password</div>
        <div class="form-container">
            <h2>Enter your email address</h2>
            <form action="newPassword.jsp" method="POST">
                <input type="email" name="email" placeholder="Enter email address" required />
                <button type="submit">Continue</button>
            </form>
        </div>
    </div>
</body>
</html>