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
    title: 'English Bay Beach!',
    draggable: true,
    animation: google.maps.Animation.DROP,
  })
  var contentString = '<div id="content">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">English Bay Beach</h1>'+
    '<div id="bodyContent" class="body-content">'+
    '<p><b>English Bay Beach</b>, also called <b>First Beach</b>, is the most' +
    'populated beach area in Vancouver\' downtown area. The Stanley Park Seawall,' +
    ' a popular running and biking route, runs along the east side of the beach.</p>' +
    '<p>Attribution: English Bay Beach, <a href="https://en.wikipedia.org/wiki/English_Bay_(Vancouver)">'+
    'English Bay (Vancouver) - Wikipedia</a> '+
    '(last visited Dec 3, 2015).</p>'+
    '</div>'+
    '</div>';

  var infoWindow = new google.maps.InfoWindow({
    content: contentString
  })

  myMarker.addListener("click", function(){
    toggleBounce();
    infoWindow.open(map, myMarker);
  });

  function toggleBounce() {
    if (myMarker.getAnimation() !== null) {
      myMarker.setAnimation(null);
    } else {
      myMarker.setAnimation(google.maps.Animation.BOUNCE);
    }
  }
}