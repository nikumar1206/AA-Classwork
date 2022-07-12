export const allTodos = (state) => {
  let todoArr = Object.values(state.todos);
  return todoArr;
};
