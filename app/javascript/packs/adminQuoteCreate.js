const checkId = () => {
  console.log('running')
  const accountantInput = document.getElementById('quote_accountant_id');
  const accountantBtn = document.getElementById('accountant-id-btn');
  const accountantText = document.getElementById('accountant-id-text');
  accountantBtn.addEventListener('click', (event) => {
    event.preventDefault();
    console.log(accountantInput.value)
    accountantText.innerHTML = `<%= Accountant.find(${accountantInput.value}).name %>`
  });
};

export { checkId }
