class Company { // The name of this class doesn't matter, nor does the filepath
  constructor() {
    // Code related to this class' setup.  Not required for Punchbox to run
  }
  controller() {
    // Code within here will run on every action of the controller
  }
  index() {
    let mapData = JSON.parse($('#map_index_data').attr('data'))
    let handler = Gmaps.build('Google');
    handler.buildMap({ provider: {
      center: {lat: 38.9072, lng: -77.0369},
      zoom: 12,
      minZoom: 12
    }, internal: {id: 'map'}}, function(){
      let markers = handler.addMarkers(mapData)
    })
  }

  show() {
    let mapData = JSON.parse($('#map_show_data').attr('data'))
    let handler = Gmaps.build('Google');
    handler.buildMap({ provider: {
      center: {lat: 38.9072, lng: -77.0369},
      zoom: 12,
      minZoom: 12,
      maxZoom: 16
    }, internal: {id: 'map_show'}}, function(){
      let markers = handler.addMarkers(mapData)
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    })
  }

  account() {
    // You aren't constrained to using REST actions either
    // This works with any action defined in your Rails controller
  }
  sharedMethod() {
    // You can have any other methods in here and reference them from other methods in this class!
    // Just make sure your method names don't conflict with action names
  }
}



Punchbox.on('Companies', Company);
