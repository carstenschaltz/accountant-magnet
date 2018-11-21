const switchFunc = (button, id) => {
  const buttons = document.querySelectorAll(button);
  buttons.forEach((button, index) => {
    button.addEventListener('click', (e) => {
      e.preventDefault();
      $(`#enquiry-tabs a[href="#t${index + id}"]`).tab('show');
    })
  });
}

const next = () => {
  switchFunc('.next-button', 2)
}

const back = () => {
  switchFunc('.back-button', 1)
}

const skip = () => {
  switchFunc('.skip-button', 3)
}


export { next, back, skip }
