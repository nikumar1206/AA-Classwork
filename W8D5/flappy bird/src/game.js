import Level from './level.js';
import Bird from './bird.js';

export default class FlappyBird {
  constructor(canvas) {
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.play();
  }
  animate() {
    // this.level.animate(this.ctx)
    // this.level.drawBackground(this.ctx);
    this.bird.animate(this.ctx)
    if (this.running){
      setTimeout(() => {requestAnimationFrame(this.animate.bind(this))}, 0);
    }
  
  }

  restart() {
    this.level = new Level(this.dimensions);
    // this.level.drawBackground(this.ctx);
    this.bird = new Bird(this.dimensions)
    this.bird.drawBird(this.ctx)
    this.animate();
  }

  play() {
    this.running = true
    this.restart()
    this.animate()
  }

  click() {
    console.log("bloop");
    // if (!this.running) return this.play();
    this.bird.flap()

  }
}
