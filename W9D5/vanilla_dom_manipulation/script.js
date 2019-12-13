document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const listContainer = document.getElementsByClassName("list-container")[0];
  listContainer.addEventListener("submit", event => {
    event.preventDefault();
    const listContainerInput = document.getElementsByClassName("favorite-input")[0];
    const inputVal = listContainerInput.value;
    listContainerInput.value = "";
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = inputVal;
    ul.appendChild(li);
  });

  // adding new photos

  // --- your code here!
  const photoShow = document.getElementsByClassName("photo-show-button")[0];
  photoShow.addEventListener("click", event => {
    event.preventDefault();
    const photoContainer = document.getElementsByClassName("photo-form-container")[0];
    photoContainer.classList.remove("hidden");
  });

  const photoUrlInput = document.getElementsByClassName("photo-url-input")[0];
  const photoSubmitInput = document.getElementsByClassName("photo-url-submit")[0];
  photoSubmitInput.addEventListener("click", event => {
    event.preventDefault();
    const urlVal = photoUrlInput.value;
    photoUrlInput.value = "";
    const ul = document.getElementsByClassName("dog-photos")[0];
    const li = document.createElement("li");
    const image = document.createElement("img");
    image.setAttribute("src", urlVal);
    li.appendChild(image);
    ul.appendChild(li);
  });

});
