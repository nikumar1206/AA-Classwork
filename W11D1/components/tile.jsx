import React from "react";
import ReactDOM from "react-dom";
import * as Minesweeper from "../minesweeper.js";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);
  }

  handleClick = (e) => {
    console.log(this.props);
    e.preventDefault();
    if (e.altKey) {
      this.props.updategame(this.props.tile, true);
    } else {
      this.props.updategame(this.props.tile, false);
    }
  };

  render = () => {
    const { tile } = this.props;
    let classname = "tile";
    let text = "";

    if (tile.explored) {
      classname += " explored";
      if (tile.adjacentBombCount() > 0) {
        text = tile.adjacentBombCount();
      } else {
        text = " ";
      }
    } else if (tile.bombed) {
      classname += " bomb";
      //   text = "💣";
      text = " ";
    } else if (tile.flagged) {
      text = "🚩";
    } else {
      text = " ";
    }
    return (
      <div onClick={this.handleClick} className={classname}>
        {text}
      </div>
    );
  };
}
