const MovingObject = require("./moving_object");
const Util = require("./utils")


function Asteroid(options) {
    // this.radius = 75
    // this.color = "pink"
    // this.game = options[game]
    // this.vel = Util.randomVec(1)
    MovingObject.call(this, options)
} 

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;