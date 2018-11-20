const fillSummary = () => {
  const services = document.querySelector('.services');
  const subject = document.querySelector('.subject');
  const description = document.querySelector('.description');
  const submitTab = document.getElementById('confirm-v');

  const subjectField = document.getElementById('enquiry_title');
  const descriptionField = document.getElementById('enquiry_description');

  if (submitTab.classList.contains('active')) {
    subject.innerHTML = subjectField.value;
    description.innerHTML = descriptionField.value;
  }
}

export { fillSummary }
