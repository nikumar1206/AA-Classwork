import { connect } from "react-redux";
import { createNewUser } from "../../actions/session";
import SignUp from "./signup";

export const mapDispatchtoProps = (dispatch) => ({
  createNewUser: (formUser) => dispatch(createNewUser(formUser)),
});

export const SignUpContainer = connect(null, mapDispatchtoProps)(SignUp);
export default SignUpContainer;
