function calculate () {
  const count_tax_price = document.getElementById("item-price");
  count_tax_price.addEventListener("keyup", () => {
    const inputValue = count_tax_price.value;
    
    const add_tax_price = document.getElementById("add-tax-price");
    const tax_price_magnification = 0.1;
    const tax_price_calculate = inputValue * tax_price_magnification;
    add_tax_price.innerHTML = Math.floor(tax_price_calculate);

    const profit = document.getElementById("profit");
    const profit_price_calculate = inputValue - tax_price_calculate;
    profit.innerHTML = Math.floor(profit_price_calculate);
  });
};

window.addEventListener('load', calculate)