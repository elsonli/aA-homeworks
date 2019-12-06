// Simple Timeout
window.setTimeout(() => {
  alert('HAMMERTIME');
}, 5000);

// Timeout Plus Closure
function hammerTime(time) {
  setTimeout(() => {
    alert(`${time} is hammertime!`);
  }, time);
};

// Some tea? Some biscuits?
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

reader.question("Would you like some tea?", function (first) {
  console.log(`You replied ${first}.`);
  reader.question("Would you like some biscuits?", function (second) {
    console.log(`You replied ${second}.`);
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';
    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
  })
})