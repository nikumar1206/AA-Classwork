const Game = require("./game");

function GameView(ctx) {
    this.ctx = ctx;
    this.game = new Game();
}

GameView.prototype.start = function() {
    setInterval(() => {
        this.game.draw(this.ctx)
        this.game.moveObjects()
    }, 0);
}

module.exports = GameView