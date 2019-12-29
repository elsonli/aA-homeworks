import { combineReducers } from 'redux';

import giphysReducer from './giphys_reducer';

// `combineReducers` creates the state of our application, assigning control
// of different slices of states to their reducers
const rootReducer = combineReducers({
  giphys: giphysReducer
});

export default rootReducer;