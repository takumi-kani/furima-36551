window.addEventListener("load",()=>{

  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("input", () => {
    const inputValue = inputPrice.value;

    const addTax = document.getElementById("add-tax-price")
    const taxNum = (Math.floor(inputValue * 0.1))
    addTax.innerHTML = taxNum.toLocaleString();

    const profitPrice = document.getElementById("profit")
      const price_result = inputValue * 0.1
      const priceNum = (Math.ceil(inputValue - price_result))
      profitPrice.innerHTML = priceNum.toLocaleString();
  })
})

.toLocaleString()