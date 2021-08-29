window.addEventListener("load",()=>{

  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input", () => {
    const inputValue = inputPrice.value;
    console.log(inputValue);

    const addTax = document.getElementById("add-tax-price")
    addTax.innerHTML = (Math.floor(inputValue * 0.1));
     console.log(addTax);

    const profitPrice = document.getElementById("profit")
      const price_result = inputValue * 0.1
      console.log(price_result)
      profitPrice.innerHTML = (Math.ceil(inputValue - price_result));
        console.log(profitPrice);
  })
})