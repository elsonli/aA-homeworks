// setTimeout is asynchronous
window.setTimeout(() => {
  alert('HAMMERTIME');
}, 5000);

function hammerTime(time) {
  setTimeout(() => {
    alert(`${time} is hammertime!`);
  }, time);
};