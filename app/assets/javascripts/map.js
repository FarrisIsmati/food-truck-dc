// class Map {
//   constructor(mapId, zoom, minZoom, maxZoom) {
//     this.handler = Gmaps.build('Google')
//     this.mapId = mapId
//     this.zoom = zoom
//     this.minZoom = minZoom
//     this.maxZoom = maxZoom
//   }
//
//   createMap(data){
//     let clusterMarkers = this.clusterMarkers
//     let createMarkers = this.createMarkers
//     let handler = this.handler
//     let mapData = JSON.parse($(data).attr('data'))
//
//     //Build Map
//     handler.buildMap({ provider: {
//       center: {lat: 38.9072, lng: -77.0369},
//       zoom: 12,
//       minZoom: 12,
//       maxZoom: 16,
//       zoomControlOptions: {
//               position: google.maps.ControlPosition.LEFT_BOTTOM
//       },
//       fullscreenControl: false,
//       streetViewControl: false
//     }, internal: {id: this.mapId}}, function(){
//
//       //Create Markers
//       let markers = handler.addMarkers(clusterMarkers(mapData))
//       handler.bounds.extendWith(markers)
//       handler.fitMapToBounds()
//     })
//   }
//
//   //Cluters Markers in Info Window if they have the same Lat/Lng coordinates
//   clusterMarkers(mapData){
//     let returnArray = []
//     let lookUp = {}
//
//     //Create array of trucks and cluster together the ones with the same lat lng coordinates
//     for (let i = 0; i < mapData.length; i++){
//       let lat = mapData[i].lat
//       let lng = mapData[i].lng
//       let coordKey = lat.toString() + lng.toString()
//       if (lookUp[coordKey]){
//         lookUp[coordKey].push(mapData[i])
//       } else {
//         lookUp[coordKey] = [mapData[i]]
//       }
//     }
//
//     //Set up info window
//     for (let key in lookUp){
//       if (lookUp[key].length > 1){
//         let companies = `<h1 class="infowindow-title">Trucks</h1>`
//         for (let i = 0; i < lookUp[key].length; i++){
//           let company = lookUp[key][i].company
//           companies += `<a class="infowindow" href="/companies/${company}">${lookUp[key][i].infowindow}</a>`
//         }
//         returnArray.push({
//           lat: lookUp[key][0].lat,
//           lng: lookUp[key][0].lng,
//           infowindow: '<div class="flex-center-column">' + companies + '</div>'
//         })
//       } else {
//         let company = lookUp[key][0].company
//         returnArray.push({
//           lat: lookUp[key][0].lat,
//           lng: lookUp[key][0].lng,
//           infowindow: `<a class="infowindow" href="/companies/${company}">${lookUp[key][0].infowindow}</a>`
//         })
//       }
//     }
//
//     return returnArray
//   }
// }
