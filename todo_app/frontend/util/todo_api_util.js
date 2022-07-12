import { receiveTodos } from "../actions/todo_actions";

export const fetchTodos = () => {
  $.ajax({
    url: "api/todos",
    method: "GET",
  }).then((todos) => {
    return dispatch(receiveTodos(todos));
  });
};
