class Map {
  constructor(mapId, zoom, minZoom, maxZoom) {
    this.handler = Gmaps.build('Google')
    this.mapId = mapId
    this.zoom = zoom
    this.minZoom = minZoom
    this.maxZoom = maxZoom
  }

  createMap(data){
    let clusterMarkers = this.clusterMarkers
    let createMarkers = this.createMarkers
    let handler = this.handler
    let mapData = JSON.parse($(data).attr('data'))
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
      let markers = handler.addMarkers(clusterMarkers(mapData))
      handler.bounds.extendWith(markers)
      handler.fitMapToBounds()
    })
  }

  clusterMarkers(mapData){
    console.log(mapData)
    let returnArray = []
    let lookUp = {}
    for (let i = 0; i < mapData.length; i++){
      let lat = mapData[i].lat
      let lng = mapData[i].lng
      let coordKey = lat.toString() + lng.toString()
      if (lookUp[coordKey]){
        lookUp[coordKey].push(mapData[i])
      } else {
        lookUp[coordKey] = [mapData[i]]
      }
    }
    for (let key in lookUp){
      if (lookUp[key].length > 1){
        let companies = `<p>Trucks</p>`
        for (let i = 0; i < lookUp[key].length; i++){
          companies += `<a href="">${lookUp[key][i].infowindow}</a>`
        }
        returnArray.push({
          lat: lookUp[key][0].lat,
          lng: lookUp[key][0].lng,
          infowindow: companies
        })
      } else {
        returnArray.push(lookUp[key][0])
      }
    }
    console.log(returnArray)
    return returnArray
  }
}
