import * as APIUtil from '../util/api_util';

// Constants for Action Creators
export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS";
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

// ----------------------- ACTION CREATORS -----------------------

// Receiving `giphys` as an argument, `receiveSearchGiphys` returns an
// Action Object to be dispatched to the reducer
export const receiveSearchGiphys = (giphys) => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys: giphys
  }
}

// -------------------- THUNK ACTION CREATORS --------------------

// `fetchSearchGiphys` returns another function that takes in a searchTerm,
// and when called with dispatch as an argument, dispatches synchronously
// after the AJAX request finishes and returns to us a Promise
export const fetchSearchGiphys = (searchTerm) => (dispatch) => {
  APIUtil.fetchSearchGiphys(searchTerm)
    .then(giphys => dispatch(receiveSearchGiphys(giphys.data)));
}