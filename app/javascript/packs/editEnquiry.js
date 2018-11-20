const showForm = () => {
  const pencil = document.getElementById('edit-pencil');
  const form = document.getElementById('edit-enquiry');
  const enquiryInfo = document.getElementById('enquiry-info');
  const cancel = document.getElementById('cancel-edit');
  const toggleHidden = () => {
    enquiryInfo.classList.toggle('hidden');
    form.classList.toggle('hidden');
  };

  pencil.addEventListener('click', (event) => {
    toggleHidden();
  });

  cancel.addEventListener('click', (event) => {
    toggleHidden();
  });
};

export { showForm }
