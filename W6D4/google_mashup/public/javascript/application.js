var wonders = [
  {
    name: "Chichen Itza",
    country: "Mexico",
    lat: 20.684294,
    lng: -88.567784,
    description: "A large pre-Columbian city built by the Maya people of the Terminal Classic period. (c. AD 800-900)",
  },
  {
    name: "Christ the Redeemer",
    country: "Brazil",
    lat: -22.951590,
    lng: -43.210455,
    description: "A statue of Jesus Christ in Rio de Janeiro, Brazil. It is 30m tall, with an 8m pedestal and overlooks the city of Rio."
  },
  {
    name: "Great Wall of China",
    country: "China",
    lat: 40.432128,
    lng: 116.570343,
    description: "The wall lines the historical northern borders of China, and was built to defend China against invasions. The entire wall measures to be 21, 196km in total length."
  },
  {
    name: "Machu Pichu",
    country: "Peru",
    lat: -13.162943, 
    lng: -72.544941,
    description: "A 15th-century Inca site located 2,430m above sea level. It is the most familiar icon of Inca civilization."
  },
  {
    name: "Petra",
    country: "Jordan",
    lat: 30.329298,
    lng: 35.444676,
    description: "Also known as the Rose City, Petra is a historical and archaeological city that is famous for its rock-cut architecture and water conduit system."
  },
  {
    name: "Taj Mahal",
    country: "India",
    lat: 27.173168,
    lng: 78.042068,
    description: "The Taj Mahal is a white marble mausoleum commissioned in 1632 by the Mughal emperor Shah Jahan. It is widely regarded as 'the jewel of Muslim art in India'."
  },
  {
    name: "Colosseum",
    country: "Italy",
    lat: 41.890450,
    lng: 12.492252,
    description: "The Colosseum, also known as the Flavian Amphitheatre, is an amphitheatre built of concrete and sand. It is the largest amphitheatre ever built and considered one of the greatest works of architecture and engineering."
  }
  ];

var map;
var pano;
var markers = [];
var firstWonder = { lat: 27.173168, lng: 78.042068 };

function initMap() {
  // Set up the map
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 2,
    center: firstWonder,
  });

  // Set up Streetview
  var sv = new google.maps.StreetViewService();

  sv.getPanorama({location: firstWonder, radius: 50}, processSVData);

  // Set up Pano
  var panoOptions = {
    navigationControl: true,
    position: firstWonder
  }

  pano = new google.maps.StreetViewPanorama(document.getElementById('pano'), panoOptions);

  // Go through each wonder and add markers/info windows
  wonders.forEach(function(wonder){
    var marker = new google.maps.Marker({
      position: { lat: wonder.lat, lng: wonder.lng },
      map: map
    });
    markers.push(marker);

    var infoContent = "<div class='content'>" +
      '<h4>' + wonder.name + ' | ' + wonder.country + '</h4>' +
      '</div>';

    var infoWindow = new google.maps.InfoWindow({
       content: infoContent
    });

    marker.addListener("click", function(){
      map.panTo(marker.position);
      infoWindow.open(map, marker);
      sv.getPanorama({location: marker.position, radius: 50}, processSVData)
    });
  })

  addWonderList();
}

function processSVData(data, status){
  if (status === google.maps.StreetViewStatus.OK){
    pano.setPano(data.location.pano);
    pano.setPov({
      heading: 270,
      pitch: 0
    });
    pano.setVisible(true);
  }
}

function addWonderList(){
  var $list = $("<ul></ul>");
  wonders.forEach(function(wonder){
    $list.append("<li>" + wonder.description + "</li>");
  });
  $("#menu").append($list);
}

