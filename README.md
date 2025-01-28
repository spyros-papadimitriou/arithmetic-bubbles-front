# Arithmetic Bubbles - Frontend System
  
This project contains the backend code of the [Arithmetic Bubbles](https://globalgamejam.org/games/2025/arithmetic-bubbles-5) game that was implemented in the context of the [Global Game Jam 2025 in Athens](https://globalgamejam.org/jam-sites/2025/global-game-jam-athens).  
  
The game is designed for children in the first grades of primary school to practice arithmetic operations. Each exercise is a quiz, where avatars present possible answers in bubbles. The game interacts with a backend server that verifies the accuracy of the answers and generates new exercises. Currently, the exercises are generated randomly. However, we plan to introduce algorithms in the future to assess each student's knowledge level and provide personalized exercises.  
  
It is implemented in Godot 4 and it communicates with a backend system which provides suitable API endpoints for creating arithmetic exercises.  
  
The backend is implemented using Java 17, Spring Boot and MariaDB and the source code is located at https://github.com/spyros-papadimitriou/arithmetic-bubbles-back.