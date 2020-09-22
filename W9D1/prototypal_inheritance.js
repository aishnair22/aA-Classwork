//Surrogate Style
Function.prototype.inherits1 = function (SuperClass) {
    function Surrogate() {}
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
}

//Object.create Style
Function.prototype.inherits = function (SuperClass) {
    this.prototype = Object.create(SuperClass.prototype);
    this.prototype.constructor = this;
}

function MovingObject() {}

MovingObject.prototype.moves = function () {
    console.log('we are moving');
}

function Ship() { }
Ship.inherits(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);

ship = new Ship();
ship.moves();

obj = new MovingObject();
obj.moves();
