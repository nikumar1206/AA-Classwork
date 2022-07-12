import React from "react";

export class ToDoListitem extends React.Component {
  constructor(props) {
    super(props);
  }

  handleremove = (e) => {
    e.preventDefault();
    const todoItem = Object.assign({}, this.props.todo);
    this.props.removeTodo(todoItem);
  };

  handleDone = (e) => {
    e.preventDefault();
    const updateItem = Object.assign({}, this.props.todo);
    updateItem.done = !updateItem.done;
    this.props.receiveTodo(updateItem);
    console.log(updateItem);
  };

  doneToggle = () => {
    if (this.props.todo.done) {
      return "Undo";
    } else {
      return "Done!";
    }
  };

  render = () => {
    return (
      <li>
        {this.props.todo.title} Done:{String(this.props.todo.done)}
        <br />
        <button id="done_todo" onClick={this.handleDone}>
          {this.doneToggle()}
        </button>
        <button id="remove_todo" onClick={this.handleremove}>
          Remove Me!
        </button>
      </li>
    );
  };
}
