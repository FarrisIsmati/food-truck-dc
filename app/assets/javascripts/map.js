'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Map = function () {
  function Map(mapId, zoom, minZoom, maxZoom) {
    _classCallCheck(this, Map);

    this.handler = Gmaps.build('Google');
    this.mapId = mapId;
    this.zoom = zoom;
    this.minZoom = minZoom;
    this.maxZoom = maxZoom;
  }

  _createClass(Map, [{
    key: 'createMap',
    value: function createMap(data) {
      var clusterMarkers = this.clusterMarkers;
      var createMarkers = this.createMarkers;
      var handler = this.handler;
      var mapData = JSON.parse($(data).attr('data'));

      //Build Map
      handler.buildMap({ provider: {
          center: { lat: 38.9072, lng: -77.0369 },
          zoom: 12,
          minZoom: 12,
          maxZoom: 16,
          zoomControlOptions: {
            position: google.maps.ControlPosition.LEFT_BOTTOM
          },
          fullscreenControl: false,
          streetViewControl: false
        }, internal: { id: this.mapId } }, function () {

        //Create Markers
        var markers = handler.addMarkers(clusterMarkers(mapData));
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
      });
    }

    //Cluters Markers in Info Window if they have the same Lat/Lng coordinates

  }, {
    key: 'clusterMarkers',
    value: function clusterMarkers(mapData) {
      var returnArray = [];
      var lookUp = {};

      //Create array of trucks and cluster together the ones with the same lat lng coordinates
      for (var i = 0; i < mapData.length; i++) {
        var lat = mapData[i].lat;
        var lng = mapData[i].lng;
        var coordKey = lat.toString() + lng.toString();
        if (lookUp[coordKey]) {
          lookUp[coordKey].push(mapData[i]);
        } else {
          lookUp[coordKey] = [mapData[i]];
        }
      }

      //Set up info window
      for (var key in lookUp) {
        if (lookUp[key].length > 1) {
          var companies = '<h1 class="infowindow-title">Trucks</h1>';
          for (var _i = 0; _i < lookUp[key].length; _i++) {
            var company = lookUp[key][_i].company;
            companies += '<a class="infowindow" href="/companies/' + company + '">' + lookUp[key][_i].infowindow + '</a>';
          }
          returnArray.push({
            lat: lookUp[key][0].lat,
            lng: lookUp[key][0].lng,
            infowindow: '<div class="flex-center-column">' + companies + '</div>'
          });
        } else {
          var _company = lookUp[key][0].company;
          returnArray.push({
            lat: lookUp[key][0].lat,
            lng: lookUp[key][0].lng,
            infowindow: '<a class="infowindow" href="/companies/' + _company + '">' + lookUp[key][0].infowindow + '</a>'
          });
        }
      }

      return returnArray;
    }
  }]);

  return Map;
}();
