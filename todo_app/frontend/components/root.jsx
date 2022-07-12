import React from "react";
import { Provider } from "react-redux";
import { App } from "./app";

export const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <App />
    </Provider>
  );
};
