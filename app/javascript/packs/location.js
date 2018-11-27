const location = () => {
  const locationInput = document.getElementById('enquiry_location');
  const searchFilter = document.getElementById('search');

  if (locationInput) {
    const places = require('places.js');
    const placesAutocomplete = places({
      container: locationInput
    });
  } else if (searchFilter) {
    const places = require('places.js');
    const placesAutocomplete = places({
      container: searchFilter
    });
  }
};

export { location }
