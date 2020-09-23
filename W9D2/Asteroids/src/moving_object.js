function MovingObject(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}

MovingObject.prototype.draw = function(ctx) {
    ctx.beginPath();
    // ctx.arc(x, y, radius, startAngle, endAngle[, anticlockwise]);
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.fillStyle = this.color;
    ctx.fill();
};

MovingObject.prototype.move = function() {
    newFirst = this.pos[0] + this.vel[0];
    newSecond = this.pos[1] + this.vel[1];
    this.pos = [newFirst, newSecond];
};

// const mo = new MovingObject({
//     pos: [30, 30],
//     vel: [10, 10],
//     radius: 5,
//     color: "#00FF00"
// });

// mo.draw(ctx);
// console.log(mo);

module.exports = MovingObject;


// Phase III: Draw a Circle
// To draw the circle:

// Invoke beginPath with no arguments
// Invoke arc with the appropriate dimensions to draw a circle
// Pick a color to set as strokeStyle
// Set the lineWidth attribute to some integer
// Invoke stroke with no arguments
// Open index.html in your browser to view it
// To fill in the circle:

// Pick a color to set as fillStyle
// Invoke fill with no arguments
// Open index.html in your browser to view it

// const canvas = document.querySelector('canvas');
// const ctx = canvas.getContext('2d');

// ctx.beginPath();
// ctx.arc(100, 75, 50, 0, 2 * Math.PI);
// ctx.stroke();