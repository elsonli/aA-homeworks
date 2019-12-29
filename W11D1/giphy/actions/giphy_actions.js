import * as APIUtil from '../util/api_util';

// Constants for Action Creators
export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS";

// Receiving `giphys` as an argument, `receiveSearchGiphys` returns an
// Action Object to be dispatched to the reducer
export const receiveSearchGiphys = (giphys) => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys: giphys
  }
}