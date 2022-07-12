export default class Bird {

    constructor(canvas) {
        this.velocity = 0;
        this.canvas = canvas
        this.posX = canvas.width/3;
        this.posY = canvas.height/2;
    }
    drawBird(ctx) {
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.posX, this.posY, 40, 30)
    }
    animate(ctx) {
        this.drawBird(ctx);
        this.move()
    }
    move() {
        this.posY += this.velocity
        this.velocity += 0.09
    }
    flap() {
        this.velocity = -5
    }

};
