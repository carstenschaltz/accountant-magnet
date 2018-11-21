const toggleActive = () => {
  const serviceChoices = document.querySelectorAll('.service-choice label');
  const tickWrappers = document.querySelectorAll('.tick-wrapper');
  serviceChoices.forEach((service, index) => {
    service.addEventListener('click', (event) => {
      service.classList.toggle('active-enquiry');
      tickWrappers[index].innerHTML = '';
      if (service.classList.contains('active-enquiry')) {
        tickWrappers[index].insertAdjacentHTML('afterbegin', '<svg xmlns="http://www.w3.org/2000/svg" class="check" width="21" height="20" viewBox="0 0 166 150.9"><path d="M0.3 96l62.4 54.1L165.6 0.3"/></svg>');
      }
    });
  });
};

export { toggleActive }
