function init_storm_map() {
  var mapCanvas = document.getElementById('map');
  var mapOptions = {
    center: new google.maps.LatLng(51.3829394,-2.3607561000000032),
    mapTypeControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    zoom: 17
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);

  marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(51.3829394, -2.3607561000000032)
  });
  infowindow = new google.maps.InfoWindow({content:"<b>Storm Consultancy</b><br/>14 New Bond St<br/>BA1 1BE Bath" });
  google.maps.event.addListener(marker, "click",function(){infowindow.open(map,marker);});
  infowindow.open(map, marker);
}
