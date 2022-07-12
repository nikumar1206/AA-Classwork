import { connect } from "react-redux";
import { GiphysSearch } from "./giphys_search";
import { fetchSearchGiphys } from "../actions/giphy_actions";

export const mapStateToProps = (state) => ({
  giphys: receiveSearchGiphys(state),
});

export const mapDispatchToProps = (dispatch) => ({
  fetchSearchGiphys: (giphys) => dispatch(fetchSearchGiphys(giphys)),
});

export const createConnectedComponent = connect(
  mapStateToProps,
  mapDispatchToProps
);

export const GiphysSearchContainer = createConnectedComponent(GiphysSearch);
