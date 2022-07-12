import { connect } from "react-redux";
import { ToDoList } from "./todo_list";
import { allTodos } from "../../reducers/selectors";
import { receiveTodo, removeTodo } from "../../actions/todo_actions";

export const mapStateToProps = (state) => ({
  todos: allTodos(state)
});

export const mapDispatchToProps = (dispatch) => ({
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: todo => dispatch(removeTodo(todo))
});

export const createConnectedComponent = connect(
  mapStateToProps,
  mapDispatchToProps
);

export const Todolistcontainer = createConnectedComponent(ToDoList);
