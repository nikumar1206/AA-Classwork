import React from "react";
import * as Minesweeper from "../minesweeper.js";
import Board from "./board";

export default class Game extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      board: new Minesweeper.Board(9, 8),
    };
  }

  updateGame = (tile, isFlagged) => {
    console.log(tile);
    if (isFlagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }
    this.setState({
      board: this.state.board,
    });

    if (this.state.board.won()) {
      alert("You have Won!");
    } else if (this.state.board.lost()) {
      alert("You Lost!");
    }
  };

  restartGame = () => {
    this.setState({ board: new Minesweeper.Board(9, 8) });
  };
  render = () => {
    return (
      <div id="board-container">
        <Board boardProp={this.state.board} updateGameProp={this.updateGame} />

        <button onClick={this.restartGame} type="button">
          Restart Game!
        </button>
      </div>
    );
  };
}
