import FlappyBird from './game';

const canvas = document.getElementById('bird-game');
let game = new FlappyBird(canvas);

document.addEventListener("keydown", game.click.bind(game)) 