function load_storm_map() {
  var storm = {lat: 51.3829394, lng: -2.3607561000000032};
  var map = new google.maps.Map(document.getElementById('map'), {
    center: storm,
    mapTypeControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    zoom: 17
  });

  var infowindow = new google.maps.InfoWindow({content:"<b>Storm Consultancy</b><br/>14 New Bond St<br/>Bath, BA1 1BE" });
  var marker = new google.maps.Marker({
    position: storm,
    map: map,
  });
  infowindow.open(map, marker);
  map.setCenter(marker.getPosition());
}
