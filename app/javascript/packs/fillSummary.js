const fillSummary = () => {
  const services = document.getElementById('services');
  const subject = document.getElementById('subject');
  const description = document.getElementById('description');
  const locality = document.getElementById('locality');

  const submitTab = document.getElementById('t3');

  var serviceChoices = [];
  const localityBox = document.getElementById('enquiry_is_local');
  const subjectField = document.getElementById('enquiry_title');
  const descriptionField = document.getElementById('enquiry_description');

  const setServices = () => {
    serviceChoices = [];
    $(".service-choices .active-enquiry .service-name").each(function(){
      serviceChoices.push($(this)[0].innerText);
    });
  }

  const fill = (button) => {
    button.addEventListener('click', function(){
      subject.innerHTML = subjectField.value;
      description.innerHTML = descriptionField.value;

      setServices();
      services.innerHTML = '';

      serviceChoices.forEach((choice) => {
        services.insertAdjacentHTML('afterbegin', `<div class="selected-service text-center">${choice}</div>`);
      });

      if (localityBox.checked) {
        locality.classList.remove('hidden')
      }
    })
  }

  const buttons = document.querySelectorAll('.to-final-tab');
  buttons.forEach((button) => {
    fill(button);
  })
}

export { fillSummary }
