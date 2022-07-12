function MovingObject(options) {
    this.pos = options.pos
    this.vel = options.vel
    this.radius = options.radius
    this.color = options.color
    this.game = options.game
}
MovingObject.prototype.draw = function(ctx) {
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, Math.PI * 2, false);
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.lineWidth = 5;
    ctx.strokeStyle = this.color;
    ctx.stroke();
}

MovingObject.prototype.move = function() {
    console.log(this.pos);
    this.pos[0] += this.vel[0]
    this.pos[1] += this.vel[1]
    this.pos = this.game.wrap(this.pos)
}

MovingObject.prototype.isCollidedWith= function(otherObject) {
    let distance = sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2)
    let acc_for_radi = distance - (2 * this.radius)
    if (acc_for_radi < 0) {
        return true
    }
    return false
}


module.exports = MovingObject;
