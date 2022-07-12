import React from "react";
import { receiveTodo } from "../../actions/todo_actions";

export class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: "",
      body: "",
      done: false,
    };
  }

  uniqueId = () => {
    return new Date().getTime();
  };

  setTitle = (e) => {
    e.preventDefault();
    this.setState({ title: e.currentTarget.value });
  };
  setBody = (e) => {
    e.preventDefault();
    this.setState({ body: e.currentTarget.value });
  };
  setTrue = (e) => {
    e.preventDefault();
    e.currentTarget.checked = true;
    this.setState({ done: true });
  };

  setFalse = (e) => {
    e.preventDefault();
    e.currentTarget.checked = true;
    this.setState({ done: false });
  };

  reset = () => {
    this.setState({
      title: "",
      body: "",
    });
    console.log(this.state);
  };

  handleClick = (e) => {
    e.preventDefault();
    // console.log("click is being called")
    const todo = Object.assign({}, this.state);
    todo.id = this.uniqueId();
    this.props.receiveTodo(todo);
    this.reset();
  };

  render = () => {
    return (
      <div id="todoform">
        <p>Please add a todo using the following form</p>

        <label htmlFor="title">Title</label>
        <input
          type="text"
          name=""
          id="title"
          onChange={this.setTitle}
          value={this.state.title}
        />
        <br />
        <label htmlFor="body">Body</label>
        <input
          type="text"
          name=""
          id="body"
          onChange={this.setBody}
          value={this.state.body}
        />
        <br />

        <button type="submit" onClick={this.handleClick}>
          Submit!
        </button>
      </div>
    );
  };
}
