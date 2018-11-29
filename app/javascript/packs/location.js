const location = () => {
  const locationInput = document.getElementById('enquiry_location');
  const searchFilter = document.querySelector('#location-field-group #search');

  if (locationInput) {
    const places = require('places.js');
    const placesAutocomplete = places({
      container: locationInput
    });
  } else if (searchFilter) {
    const places = require('places.js');
    const placesAutocomplete = places({
      container: searchFilter,
      style: false
    });
  }
};

export { location }
