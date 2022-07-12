const Asteroid = require("./asteroids");
const Util = require("./utils")
function Game() {
    this.DIM_X = window.innerWidth;
    this.DIM_Y = window.innerHeight;
    this.NUM_ASTEROIDS = 12;
    this.asteroids = [];
    this.addAsteroids();
}


Game.prototype.addAsteroids = function() {
    for (i = 0; i < this.NUM_ASTEROIDS; i++) {
        let rand_x = Math.floor(Math.random() * this.DIM_X);
        let rand_y = Math.floor(Math.random() * this.DIM_Y);
        console.log(this);
        let a = new Asteroid({
            pos:[rand_x, rand_y],
            vel: Util.randomVec(0.8),
            radius: 55,
            color: "purple",
            game: this
        })
        console.log(a);
        this.asteroids.push(a)
    }
}

Game.prototype.draw = function(ctx) {
    ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
    ctx.fillStyle = "lightblue";
    ctx.fillRect(0,0, this.DIM_X, this.DIM_Y);
    for (let i = 0 ; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx)
    }
}

Game.prototype.moveObjects = function() {
    for (let i = 0; i< this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
}

Game.prototype.wrap = function(pos) {
    let x = pos[0]
    let y = pos[1]
    if (x > this.DIM_X + 60) {
        pos[0] = -60
    } else if (x < -60) {
        pos[0] = this.DIM_X + 60
    }
    if (y > this.DIM_Y + 60) {
        pos[1] = -60
    } else if (y < -60) {
        pos[1] = this.DIM_Y + 60
    }
    return pos
}

Game.prototype.checkCollisions = function() {
    for (i = 0; i < this.asteroids; i++) {
        for (j = 0; j < this.asteroids; j++) {
            if (this.asteroids[j] != this.asteroids[i] && this.asteroids[i].isCollidedWith(this.asteroids[j])) {
                alert("COLLISION")
            }
        }
    }
}

Game.prototype.step
module.exports = Game;