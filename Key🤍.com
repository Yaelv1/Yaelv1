<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(45deg, #ff9a9e, #fad0c4);
            font-family: Arial, sans-serif;
            overflow: hidden;
        }
        .container {
            text-align: center;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            max-width: 80%;
            position: relative;
        }
        h1 {
            color: #ff4b6e;
            font-size: 2.5em;
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }
        .message {
            font-size: 1.2em;
            color: #666;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .heart {
            position: fixed;
            font-size: 20px;
            animation: float 4s ease-in-out infinite;
        }
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        .button {
            background: #ff4b6e;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 1.1em;
            transition: transform 0.3s;
        }
        .button:hover {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>♥ KEILY ♥</h1>
        <div class="message">
            Eres la persona que ilumina mis días.<br>
            Cada momento contigo es especial.<br>
            Tu sonrisa es mi felicidad.<br>
            ¡Te quiero muchísimo!
        </div>
        <button class="button" onclick="showLove()">Presiona aquí ❤️</button>
    </div>

    <script>
        function showLove() {
            for(let i = 0; i < 20; i++) {
                createHeart();
            }
        }

        function createHeart() {
            const heart = document.createElement('div');
            heart.className = 'heart';
            heart.innerHTML = '❤️';
            heart.style.left = Math.random() * 100 + 'vw';
            heart.style.animationDuration = (Math.random() * 3 + 2) + 's';
            heart.style.opacity = Math.random();
            document.body.appendChild(heart);

            setTimeout(() => {
                heart.remove();
            }, 5000);
        }
    </script>
</body>
</html>
