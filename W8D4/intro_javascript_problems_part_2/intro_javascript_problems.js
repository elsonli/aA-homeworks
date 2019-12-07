function printCallback(name) {
  let capitalized = name;
  return `Mx. ${capitalized} Jingleheimer Schmidt`;
}

function titleize(nameArr, callback) {
  let mappedNames = nameArr.map(callback);
  for (name of mappedNames) {
    console.log(name);
  }
}

// console.log(titleize(["Mary", "Brian", "Leo"], printCallback));

function Elephant(name, height, tricksArr) {
  this.name = name;
  this.height = height;
  this.tricksArr = tricksArr;
}

Elephant.prototype.trumpet = function() {
  return `${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`;
}

Elephant.prototype.grow = function() {
  this.height += 12;
  return this.height;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricksArr.push(trick);
  return this.tricksArr;
}

Elephant.prototype.play = function() {
  let rand = Math.floor(Math.random() * this.tricksArr.length);
  let trick = this.tricksArr[rand];
  return `${this.name} is ${trick}!`;
}

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
}

// herd.forEach(Elephant.paradeHelper)

function dinerBreakfast() {
  let order = ["cheesy scrambled eggs"];
  return function(food) {
    order.push(food);
    return `I'd like ${order.join(' and ')} please.`;
  }
}

let bfastOrder = dinerBreakfast();
console.log(bfastOrder("chocolate chip pancakes"));
console.log(bfastOrder("grits"));