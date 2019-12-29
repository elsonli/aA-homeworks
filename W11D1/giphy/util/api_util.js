// Given a `searchTerm` entered by a user, `fetchSearchGiphys` will make an
// AJAX call to the Giphy API
export const fetchSearchGiphys = (searchTerm) => {
  return $.ajax({
    method: "GET",
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=RroDn01BjRYZlpI7uMavWwvb9anaEwyL&limit=2`
  });
}