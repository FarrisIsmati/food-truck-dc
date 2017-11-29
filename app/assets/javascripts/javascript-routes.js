class Company {
  constructor() {
  }

  controller() {
  }

  index() {
    let map = new Map('map', '#map_index_data')
    map.createMap('#map_index_data', 12, 12, 16)
  }

  show() {
    addTruckBtn()
    let map = new Map('map_show', '#map_index_data')
    map.createMap('#map_show_data', 12, 12, 16)

    $('#truck-create-form').on('ajax:success', function() {
      map.createMap('#map_show_data', 12, 12, 16)
    })
  }

  sharedMethod() {
  }
}

Punchbox.on('Companies', Company);
