const location = () => {
  const locationInput = document.getElementById('enquiry_location');

  if (locationInput) {
    const places = require('places.js');
    const placesAutocomplete = places({
      container: locationInput
    });
  }
};

export { location }
