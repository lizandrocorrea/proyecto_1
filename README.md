<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Adivinanza</title>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
    }
    h1 {
        color: #333;
    }
    #adivinanza {
        margin-top: 20px;
    }
    #respuesta {
        margin-top: 20px;
        display: none;
    }
</style>
</head>
<body>
    <h1>¡Adivina el número!</h1>
    <p>Estoy pensando en un número del 1 al 10. ¿Puedes adivinar cuál es?</p>
    <input type="number" id="guess" min="1" max="10">
    <button onclick="checkGuess()">Adivinar</button>
    <div id="respuesta">
        <p id="mensaje"></p>
        <button onclick="resetGame()">Jugar de Nuevo</button>
    </div>

    <script>
        var numeroAleatorio = Math.floor(Math.random() * 10) + 1;
        var intentos = 3;

        function checkGuess() {
            var guess = parseInt(document.getElementById("guess").value);
            var mensaje = document.getElementById("mensaje");

            if (guess === numeroAleatorio) {
                mensaje.textContent = "¡Correcto! ¡Has adivinado el número!";
                mensaje.style.color = "green";
                document.getElementById("respuesta").style.display = "block";
            } else {
                intentos--;
                if (intentos > 0) {
                    mensaje.textContent = "Incorrecto. Inténtalo de nuevo. Te quedan " + intentos + " intentos.";
                    mensaje.style.color = "red";
                } else {
                    mensaje.textContent = "Lo siento, has agotado todos tus intentos. El número era " + numeroAleatorio + ".";
                    mensaje.style.color = "red";
                    document.getElementById("respuesta").style.display = "block";
                }
            }
        }

        function resetGame() {
            numeroAleatorio = Math.floor(Math.random() * 10) + 1;
            intentos = 3;
            document.getElementById("guess").value = "";
            document.getElementById("respuesta").style.display = "none";
            document.getElementById("mensaje").textContent = "";
        }
    </script>
</body>
</html>
