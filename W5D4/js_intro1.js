function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLibs(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  result = [];
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0) {
      continue;
    } else if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      result.push(array[i]);
    }
  }
  return result;
}

function isPrime(number) {
  if (number < 2) {
    return false;
  }
  let i = 2;
  while (i < number) {
    if (number % i === 0) {
      return false;
    }
    i++;
  }
  return true;
}

function sumOfNPrimes(n) {
  let numPrimes = 0;
  let sum = 0;
  let i = 1;
  while (numPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      numPrimes++;
    }
    i++;
  }
  return sum;
}