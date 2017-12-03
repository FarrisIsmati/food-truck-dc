class Map {
  constructor(mapId, zoom, minZoom, maxZoom) {
    this.handler = Gmaps.build('Google')
    this.mapId = mapId
    this.zoom = zoom
    this.minZoom = minZoom
    this.maxZoom = maxZoom
  }

  createMap(data){
    let createMarkers = this.createMarkers
    let handler = this.handler
    let mapData = JSON.parse($(data).attr('data'))

    //Build Map
    handler.buildMap({ provider: {
      center: {lat: 38.9072, lng: -77.0369},
      zoom: 12,
      minZoom: 12,
      maxZoom: 16,
      zoomControlOptions: {
              position: google.maps.ControlPosition.LEFT_BOTTOM
      },
      fullscreenControl: false,
      streetViewControl: false
    }, internal: {id: this.mapId}}, function(){

      //Create Markers
      let markers = handler.addMarkers(mapData)
      handler.bounds.extendWith(markers)
      handler.fitMapToBounds()
    })
  }
}
