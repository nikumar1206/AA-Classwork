const View = require ("./ttt-view")
const Game = require ("./game")

document.addEventListener("DOMContentLoaded", () => {
  const el = document.querySelector(".ttt")
  const newGame = new Game()
  const newView = new View(newGame, el)

  // newView.setupBoard()
  newView.handleClick(event);

});


