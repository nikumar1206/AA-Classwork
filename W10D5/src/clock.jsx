import React from "react";
import ReactDOM from "react-dom";

export default class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date(),
    };
  }

  tick = () => {
    this.setState({
      time: new Date(),
    });
  };

  componentDidMount() {
    let intervalID = setInterval(() => {
      this.tick();
    }, 1000);
    this.setState({
      intervalID: intervalID,
    });
  }

  componentWillUnmount() {
    clearInterval(this.state.intervalID);
  }

  render = () => {
    const time = this.state.time;
    return (
      <div>
        <h1>Clock</h1>
        <h1>
          Date: {time.getHours()}:{time.getMinutes()}:{time.getSeconds()}
        </h1>
      </div>
    );
  };
}
