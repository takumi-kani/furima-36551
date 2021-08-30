window.addEventListener("load",()=>{

  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input", () => {
    const inputValue = inputPrice.value;

    const addTax = document.getElementById("add-tax-price")
    addTax.innerHTML = (Math.floor(inputValue * 0.1));

    const profitPrice = document.getElementById("profit")
      const price_result = inputValue * 0.1
      profitPrice.innerHTML = (Math.ceil(inputValue - price_result));
  })
})