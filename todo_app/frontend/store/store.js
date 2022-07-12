import { rootReducer } from "../reducers/root_reducer.js";
import { createStore, applyMiddleware, compose } from "redux";
import logger from "redux-logger";
import { thunk } from "../middleware/thunk";

export const configureStore = (preloadedState = {}) => {
  return createStore(rootReducer, preloadedState, composedEnhancer);
};

const composedEnhancer = compose(
  applyMiddleware(logger),
  applyMiddleware(thunk)
);
