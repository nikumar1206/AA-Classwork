import { combineReducers } from "redux";
import { stepsReducer } from "./steps_reducer.js";
import { todosReducer } from "./todos_reducer.js";

export const rootReducer = combineReducers({
  todos: todosReducer,
  steps: stepsReducer,
});
