<%-- 
    Document   : veryfirstpg
    Created on : Jan 20, 2025, 6:55:06 PM
    Author     : pragy
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banasthali Vidyapith - Placement Portal</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(to bottom, #a6dcef, #ffffff); 
            font-family: 'Times New Roman', serif;
            overflow: hidden;
        }

        .title-container {
            text-align: left;
            display: flex;
            align-items: center;
            padding: 20px;
            border: 2px solid #000080;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 2s ease-in-out;
        }

        .logo {
            width: 80px;
            height: 80px;
            margin-right: 20px;
            border-radius: 10px;
            border: 2px solid #000080;
        }

        .text {
            display: flex;
            flex-direction: column;
        }

        h1, h2 {
            margin: 0;
            font-weight: bold;
            color: #000080; 
        }

        h1 {
            font-size: 2.5rem;
            line-height: 1.2;
        }

        h2 {
            font-size: 1.5rem;
            line-height: 1.5;
            margin-top: 8px;
            opacity: 0;
            margin-left: 100px;
        }

        .fade-out {
            animation: fadeOut 1s forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeOut {
            to {
                opacity: 0;
            }
        }

        @media (max-width: 768px) {
            .title-container {
                flex-direction: column;
                text-align: center;
            }

            .logo {
                margin: 0 0 20px 0;
            }
        }
    </style>
</head>
<body>
    <div class="title-container" id="main-container">
        <img src="<%= request.getContextPath() %>/images/bv.jpeg" alt="College Logo" class="logo" />
        <div class="text">
            <h1 id="animated-title"></h1>
            <h2 id="animated-subtitle"></h2>
        </div>
    </div>

    <script>
        const title = "BANASTHALI  VIDYAPITH";
        const subtitle = "PLACEMENT  PORTAL";
        const titleElement = document.getElementById("animated-title");
        const subtitleElement = document.getElementById("animated-subtitle");
        const mainContainer = document.getElementById("main-container");
        let titleIndex = 0;
        let subtitleIndex = 0;

        function typeTitle() {
            if (titleIndex < title.length) {
                titleElement.textContent += title[titleIndex];
                titleIndex++;
                setTimeout(typeTitle, 150); 
            } else {
                typeSubtitle(); 
            }
        }

        function typeSubtitle() {
            if (subtitleIndex < subtitle.length) {
                subtitleElement.textContent += subtitle[subtitleIndex];
                subtitleElement.style.opacity = 1; 
                subtitleIndex++;
                setTimeout(typeSubtitle, 100); 
            } else {
                setTimeout(() => {
                    mainContainer.classList.add("fade-out");
                    setTimeout(() => {
                        window.location.href = "frontpg.jsp"; 
                    }, 1000); 
                }, 2000); 
            }
        }

        typeTitle(); 
    </script>
</body>
</html>