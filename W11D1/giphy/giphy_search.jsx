import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

// Testing on the window
// import * as APIUtil from "./util/api_util";
// import * as GiphyActions from "./actions/giphy_actions";
// window.fetchSearchGiphysUtil = APIUtil.fetchSearchGiphys;
// window.receiveSearchGiphys = GiphyActions.receiveSearchGiphys;
// window.fetchSearchGiphysAction = GiphyActions.fetchSearchGiphys;

// Use a Document Ready Callback to grab the Root div of the HTML page
// and render the Root of our App in its place
document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();

  // At this point, we can also place the Store onto the window for testing
  // window.store = store;

  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
});