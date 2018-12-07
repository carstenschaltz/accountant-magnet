const fillSummary = () => {
  const services = document.getElementById('services');
  const subject = document.getElementById('subject');
  const description = document.getElementById('description');
  const locality = document.getElementById('locality');

  const industry = document.getElementById('industry');
  const size = document.getElementById('size');
  const location = document.getElementById('location');

  const submitTab = document.getElementById('t3');

  var serviceChoices = [];
  const localityBox = document.getElementById('enquiry_is_local');
  const subjectField = document.getElementById('enquiry_title');
  const descriptionField = document.getElementById('enquiry_description');

  const industryField = document.getElementById('enquiry_industry_string');
  const sizeField = document.getElementById('enquiry_size');
  const locationField = document.getElementById('enquiry_location');
  const networkBox = document.getElementById('enquiry_network');

  const blank_msg = '<i style="color: #CACACA">Blank - fill out to ensure quotes are as relevant as possible</i>'

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
      industry.innerHTML = industryField.value;
      size.innerHTML = sizeField.value;
      location.innerHTML = locationField.value;

      if (industryField.value) {
        industry.innerHTML = industryField.value;
      } else {
        industry.innerHTML = blank_msg
      }

      if (sizeField.value) {
        size.innerHTML = sizeField.value;
      } else {
        size.innerHTML = blank_msg
      }

      if (locationField.value) {
        location.innerHTML = locationField.value;
      } else {
        location.innerHTML = blank_msg
      }

      setServices();
      services.innerHTML = '';

      serviceChoices.forEach((choice) => {
        services.insertAdjacentHTML('afterbegin', `<div class="selected-service text-center">${choice}</div>`);
      });

      if (localityBox.checked) {
        locality_true.classList.remove('hidden')
        locality_false.classList.add('hidden')
      }

      if (networkBox.checked) {
        network_true.classList.remove('hidden')
        network_false.classList.add('hidden')
      } else {
        // NEED TO MAKE MORE ROBUST IF TOGGLED MULTIPLE TIMES
      }

    })
  }

  const buttons = document.querySelectorAll('.to-final-tab');
  buttons.forEach((button) => {
    fill(button);
  })
}

export { fillSummary }
