window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    addTax.innerHTML = Math.floor(inputValue*0.1)
    // console.log(addTax.innerHTML);
    profit.innerHTML = Math.floor(inputValue - addTax.innerHTML)
    // console.log(profit.innerHTML);
   
  })
})  