//Run JavaScript specific to a route

class Company {
  constructor() {
  }

  controller() {
  }

  index() {
    //Index Map
    let map = new Map('map', '#map_index_data')
    map.createMap('#map_index_data', 12, 12, 16)
  }

  show() {
    //Event Listener
    addTruckBtn()

    //Show Map
    let map = new Map('map_show', '#map_index_data')
    map.createMap('#map_show_data', 12, 12, 16)

    //Re-add map to page
    $('#truck-create-form').on('ajax:success', function() {
      //map.createMap('#map_show_data', 12, 12, 16)
    })
  }

  sharedMethod() {
  }
}

Punchbox.on('Companies', Company);

// For the unused methods above, clean them out or keep them on a non-master branch until ready
