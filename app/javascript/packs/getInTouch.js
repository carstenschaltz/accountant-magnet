const getInTouch = () => {
  const button = document.getElementById('send-email');
  const form = document.getElementById('email-form');
  const sendNow = document.getElementById('send-now');

  if (button) {
    button.addEventListener('click', (event) => {
      event.preventDefault();
      form.classList.toggle('hidden');
    });
    sendNow.addEventListener('click', (event) => {
      event.preventDefault();
      Rails.fire(form, 'submit');
    });
  }
}

export { getInTouch }
