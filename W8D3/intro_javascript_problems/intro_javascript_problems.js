function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping1() // => in block
                  // => in block

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping2() // => out of block
                  // => in block

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping3() // => SyntaxError

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping4() // => in block
                  // => out of block

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// mysteryScoping5() // => SyntaxError

function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

// console.log(madLib('make', 'best', 'guac')); // => "We shall MAKE the BEST guac."

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

// console.log(isSubstring("time to program", "time")) // => true
// console.log(isSubstring("Jump for joy", "joys")) // => false

function fizzBuzz(array) {
  const newArray = [];
  for (let i = 0; i < array.length; i++) {
    let num = array[i];
    if (((num % 3 == 0) || (num % 5 == 0)) && !(num % 15 == 0)) {
      newArray.push(num);
    }
  }
  return newArray;
}

// console.log(fizzBuzz([10, 20, 30, 40, 50, 60, 70, 80, 90])) // => [10, 20, 40, 50, 70, 80]

function isPrime(number) {
  if (number < 2) {
    return false
  }
  for (let i = 2; i < number; i++) {
    if (number % i == 0) {
      return false
    }
  }
  return true
}

// console.log(isPrime(2)) // => true
// console.log(isPrime(10)) // => false
// console.log(isPrime(15485863)) // => true
// console.log(isPrime(3548563)) // => false

function sumOfNPrimes(n) {
  let sum = 0
  let counter = 2
  while (n > 0) {
    if (isPrime(counter)) {
      sum += counter
      n -= 1
    }
    counter += 1
  }
  return sum
}

// console.log(sumOfNPrimes(0)) // => 0
// console.log(sumOfNPrimes(1)) // => 2
// console.log(sumOfNPrimes(4)) // => 17