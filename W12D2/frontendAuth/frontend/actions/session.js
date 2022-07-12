import * as SessionAPI from "../utils/session";

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";
// makes sure they are the same as reducers will not throw error

export const receiveCurrentUser = (user) => ({
  type: RECEIVE_CURRENT_USER,
  user,
});
export const logoutCurrentUser = () => ({
  type: LOGOUT_CURRENT_USER,
});

export const createNewUser = (formUser) => (dispatch) =>
  SessionAPI.postUser(formUser).then((user) =>
    dispatch(receiveCurrentUser(user))
  );

// curries and receive action from thunk middleware
// createNewUser will be called from the form for signing up.
// if postUser to database (post request thru user controller) is successful, it will output a user
// on success, use the aciton action receiveCurrentUuser to create action with payload user.

export const login = (formUser) => (dispatch) =>
  SessionAPI.postSession(formUser).then((user) =>
    dispatch(receiveCurrentUser(user))
  );

export const logout = () => (dispatch) =>
  SessionAPI.deleteSession().then(dispatch(logoutCurrentUser()));
