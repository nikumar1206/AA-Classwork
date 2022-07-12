// const MovingObject = require("./moving_object");
// const Asteroid = require("./asteroids")
const GameView = require("./game_view");
window.GameView = GameView
// window.MovingObject = MovingObject;
// window.Asteroid = Asteroid;

window.addEventListener('DOMContentLoaded', (event) => {
    const canvasEl = document.getElementById("canvas");
    canvasEl.width = window.innerWidth;
    canvasEl.height = window.innerHeight;

    const ctx = canvasEl.getContext("2d");

    ctx.fillStyle = "lightblue";
    ctx.fillRect(0, 0, canvasEl.width, canvasEl.height);

    // first_moving_object.draw(ctx)
    // a1.draw(ctx)
    const gameview1 = new GameView(ctx);
    // console.log(gameview1);
    gameview1.start();
})

// first_moving_object = new MovingObject({
//     pos: [400,220],
//     vel: [2,3],
//     radius: 50,
//     color: "green"
// })

// a1 = new Asteroid([100,100])
