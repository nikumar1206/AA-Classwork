class View {

  constructor(game, el) {
    this.game = game;
    this.el = el;
    this.setupBoard();
    this.bindEvents();
  }



  setupBoard() {
    // game.board
    // const ttt = document.querySelector('.ttt');
    let ul = document.createElement("ul");
    // const grid = [];
    let counter = 1;
    for (let i = 0; i < 3; i++) {
      // li.setAttribute
      for (let j = 0; j < 3; j++) {

        let li = document.createElement("li");
        li.setAttribute("data-pos", `[${i},${j}]`);
        li.setAttribute("id", `${counter}`);

        // grid.push(li);
        counter += 1;
        ul.appendChild(li);
      }
    }
    this.el.appendChild(ul)
    // console.log(this.el);
    // think we create a for loop
    // append into an array?
    // add an attribute for the position??
  }

  bindEvents() { 
    this.el.addEventListener("click", (event) => {this.handleClick(event)})
  }

  handleClick(e) {
    if (e.target.tagName) {
      let box_clicked = e.target
      let pos = JSON.parse(box_clicked.getAttribute("data-pos"))
      this.game.playMove(pos)
      this.makeMove(box_clicked)
      this.game.swapTurn();
    }

    // let grid = Array.from(document.querySelectorAll("li"));
    // // console.log(e)
    // grid.map(box => {
    //   let pos = JSON.parse(box.getAttribute("data-pos"))   //"[0,0]"
    //   // console.log(pos)
    //   box.addEventListener("click", this.makeMove(pos));
    // });
    // this.el.addEventListener("click", console.log(e.target))
  }

  makeMove(square) {
    square.innerText = this.game.currentPlayer
    if ( this.game.isOver() ) {
      if (this.game.winner()) {
        alert(`${this.game.winner()} has won!`)
      } else {
        alert("no winner it is a tie!")
      }
    }
  }

  // should make a reset board func
}

module.exports = View;
