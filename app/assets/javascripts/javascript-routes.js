'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

//Run JavaScript specific to a route

var Company = function () {
  function Company() {
    _classCallCheck(this, Company);
  }

  _createClass(Company, [{
    key: 'controller',
    value: function controller() {}
  }, {
    key: 'index',
    value: function index() {
      //Index Map
      var map = new Map('map', '#map_index_data');
      map.createMap('#map_index_data', 12, 12, 16);
    }
  }, {
    key: 'show',
    value: function show() {
      //Event Listener
      addTruckBtn();

      //Show Map
      var map = new Map('map_show', '#map_index_data');
      map.createMap('#map_show_data', 12, 12, 16);

      //Re-add map to page
      $('#truck-create-form').on('ajax:success', function () {
        map.createMap('#map_show_data', 12, 12, 16);
      });
    }
  }, {
    key: 'sharedMethod',
    value: function sharedMethod() {}
  }]);

  return Company;
}();

Punchbox.on('Companies', Company);
