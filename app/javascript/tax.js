function tax (){
  const priceInput = document.getElementById("item-price");
  const freeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");
 
  priceInput.addEventListener("input", function(){
    const price = parseInt(priceInput.value);
    const tax = isNaN(price) ? 0 : Math.floor(price * 0.1);
    const profit = isNaN(price) ? 0 : price - tax;
 
    freeDisplay.innerHTML = tax.toLocaleString();
    profitDisplay.innerHTML = profit.toLocaleString();
  });
}
export default tax;
window.addEventListener('turbo:load', tax);
window.addEventListener('turbo:render', tax);