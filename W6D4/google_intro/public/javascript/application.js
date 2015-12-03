function initMap() {
  var theirLatLng = { lat: -25.363, lng: 131.044 };
  var myLatLng = { lat: 49.287966, lng: -123.143435};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: myLatLng
  });

  var theirMarker = new google.maps.Marker({
    position: theirLatLng,
    map: map,
    title: 'Hello World!'
  });

  var myMarker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: "English Bay Beach!"
  })

}