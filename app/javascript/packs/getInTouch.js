const getInTouch = () => {
  const button = document.getElementById('send-email');
  const form = document.getElementById('email-form');
  if (button) {
    button.addEventListener('click', () => {
      form.classList.toggle('hidden');
    });
  }
}

export { getInTouch }
