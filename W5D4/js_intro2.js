function titleize(arr, printCallback) {
  let result = arr.map(name => `Mx. ${name} Jingleheimer Schmidt`);
  printCallback(result);
}

titleize(["Mary", "Brian", "Leo"], (arr) => {
  arr.forEach(name => console.log(name));
});