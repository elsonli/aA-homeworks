import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';

// The `giphysReducer` takes in the Current State and an Action Object, and
// depending on the Action's type, returns a New State with none ~ all of the
// key-value pairs modified
const giphysReducer = (currState = [], action) => {
  Object.freeze(currState);
  switch (action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      return action.giphys;
    default:
      return currState;
  }
}

export default giphysReducer;