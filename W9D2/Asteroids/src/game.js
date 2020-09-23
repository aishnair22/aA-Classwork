const Asteroid = require("./asteroid");

function Game() {
    this.DIM_X = 500;
    this.DIM_Y = 500;
    this.NUM_ASTEROIDS = 1000;
    this.asteroids = [];
    this.addAsteroids();
}

Game.prototype.addAsteroids = function () {
    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
        let newPos = this.randomPosition();
        newAst = new Asteroid({ pos: newPos});
        this.asteroids.push(newAst);
    }
};

Game.prototype.randomPosition = function () {
    let newX = Math.random() * this.DIM_X;
    let newY = Math.random() * this.DIM_Y;
    return [newX, newY];
};

Game.prototype.draw = function(ctx) {
    // context.clearRect(x,y,width,height);
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    // ctx.fillStyle = "blue";
    // ctx.fillRect(0, 0, this.DIM_X, this.DIM_Y);
    this.asteroids.forEach (ele => {
        ele.draw(ctx);
    })
}

Game.prototype.moveObjects = function() {
    this.asteroids.forEach(ele => {
        ele.move();
    })
}

module.exports = Game;