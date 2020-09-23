document.addEventListener("DOMContentLoaded", function () {
    const myCanvas = document.getElementById("game-canvas");
    myCanvas.width = 500;
    myCanvas.height = 500; 

    const context = myCanvas.getContext("2d");
    window.ctx = context;
    let game = new Game();
    // game.draw(ctx);
    // window.game = game;
    let gameview = new GameView(game, context);
    gameview.start();
});

console.log("Webpack is working!")


const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;
const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;
const Game = require("./game.js");
window.Game = Game;
const GameView = require("./game_view.js");
window.GameView = GameView;