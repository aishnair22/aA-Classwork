const MovingObject = require("./moving_object.js");
const Util = require("./util.js");

const DEFAULT = {
    COLOR: "teal",
    RADIUS: 5
}

function Asteroid(options) {
    MovingObject.call(this, options);

    this.color = DEFAULT.COLOR;
    this.radius = DEFAULT.RADIUS;
    // this.pos = options.pos;
    this.vel = Util.randomVec(50);

}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;