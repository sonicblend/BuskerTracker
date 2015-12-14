/* disable eslint no-unused-vars check, it doesn't know that load_storm_map() is referred to by google maps api callback */
/*eslint-disable no-unused-vars*/
function load_storm_map() {
  var storm = {lat: 51.3829394, lng: -2.3607561000000032};
  var map = new this.google.maps.Map(document.getElementById('map'), {
    center: storm,
    mapTypeControl: false,
    mapTypeId: this.google.maps.MapTypeId.ROADMAP,
    zoom: 17
  });

  var infowindow = new this.google.maps.InfoWindow({content:"<b>Storm Consultancy</b><br/>14 New Bond St<br/>Bath, BA1 1BE" });
  var marker = new this.google.maps.Marker({
    position: storm,
    map: map
  });
  infowindow.open(map, marker);
  map.setCenter(marker.getPosition());
}
/*eslint-enable no-unused-vars*/
