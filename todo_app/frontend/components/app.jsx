import React from "react";
import { Todolistcontainer } from "./todos/todo_list_container";

export class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render = () => {
    return (
      <div className="app">
        <h1>My ToDo App</h1>
        <Todolistcontainer />
      </div>
    );
  };
}
