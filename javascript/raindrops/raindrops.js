export const convert = (number) => {
  let response = "";
  if (number % 3 == 0) {
    response += 'Pling';
  }
  if (number % 5 == 0) {
    response += 'Plang';
  } 
  if (number % 7 == 0) {
    response += 'Plong';
  }
  if (response == "") {
    response = number.toString();
  }
  return response;
};
