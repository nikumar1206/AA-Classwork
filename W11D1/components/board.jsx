import React from "react";
import ReactDOM from "react-dom";
import Tile from "./tile";
import Game from "./game";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render = () => {
    return this.props.boardProp.grid.map((row, i) => {
      return (
        <div className="row" key={i}>
          {row.map((tile, j) => {
            return (
              <Tile
                tile={tile}
                key={j}
                updategame={this.props.updateGameProp}
              />
            );
          })}
        </div>
      );
    });
  };
}
