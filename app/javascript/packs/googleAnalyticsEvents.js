const enquiryEvent = () => {
  const button = document.getElementById('enquiry-create');

  if (button) {
    button.addEventListener('click', (event) => {
      gtag('event', 'enquiryCreate', {
        'event_category': 'enquiry',
        'event_label': 'create'
      });
    });
  }
}

export { enquiryEvent }
