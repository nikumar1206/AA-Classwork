import React from "react";
import { ToDoListitem } from "./todo_list_item";
import { TodoForm } from "./todo_form";

export class ToDoList extends React.Component {
  constructor(props) {
    super(props);
    // console.log(this.props)
  }

  render = () => {
    // console.log(this.props);
    const todoList = this.props.todos.map((todo) => (
      <ToDoListitem
        todo={todo}
        key={todo.id}
        receiveTodo={this.props.receiveTodo}
        removeTodo={this.props.removeTodo}
      />
    ));

    return (
      <div>
        {todoList}
        <br />
        <TodoForm receiveTodo={this.props.receiveTodo} />
      </div>
    );
  };
}
