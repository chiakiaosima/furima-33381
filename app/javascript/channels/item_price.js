window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxPrice = document.getElementById("add-tax-price");
  const ProfitPrice = document.getElementById("profit")
  const tax = 0.1;
  const tax_fee = inputValue * tax;
  const profit_fee = inputValue - tax_fee;
  addTaxPrice.innerHTML = tax_fee;
  ProfitPrice.innerHTML = profit_fee;
})

  
});