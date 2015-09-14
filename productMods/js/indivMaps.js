/* $This file is distributed under the terms of the license in /doc/license.txt$ */

$(document).ready(function(){
    var legendIsVisible = false;
    
  buildSmallMap();    

  function buildSmallMap() {
          
      var satellite = L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile\/{z}\/{y}\/{x}.png', {
            boxZoom: false,
            doubleClickZoom: false,
            attribution: 'Tiles &copy; <a href="http://www.esri.com/">Esri</a>'
          }),
          
          streets = L.tileLayer('http://api.mapbox.com/v4/mapbox.streets/{z}/{x}/{y}.png?access_token={accessToken}', {
          	attribution: 'Tiles &copy; <a href="https://www.mapbox.com/map-feedback/">Mapbox</a>, &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap contributors</a>',
            boxZoom: false,
            doubleClickZoom: false,
          	accessToken: 'pk.eyJ1IjoibWJncm9zcyIsImEiOiJjaWVrNWx5bHAwMTBzc3JtMTlsbXp4N25lIn0.dFF6rXQ_LHVC5IkT4MYRhg'
          });
  
          labels = L.tileLayer('http://otile{s}.mqcdn.com/tiles/1.0.0/{type}/{z}/{x}/{y}.{ext}', {
          	type: 'hyb',
          	ext: 'png',
          	attribution: 'Tiles Courtesy of <a href="http://www.mapquest.com/">MapQuest</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
          	subdomains: '1234',
          	opacity: 0.9
          });

          
      var mapSmall = L.map('mapSmall').setView([latitude, longitude], 2);
            mapSmall.touchZoom.disable();
            mapSmall.doubleClickZoom.disable();
            mapSmall.scrollWheelZoom.disable();
            mapSmall.boxZoom.disable();
            mapSmall.keyboard.disable();
            layers: [satellite, labels]
            var marker = L.marker([latitude, longitude]).addTo(mapSmall);
            var baseMaps = {
              "Satellite": satellite,
              "Streets": streets
            };
            var overlayMaps = {
              "Labels": labels
            };
            satellite.addTo(mapSmall);
            //L.control.layers(baseMaps, null,{position: 'topleft'}).addTo(mapSmall);
            mapSmall.zoomControl.setPosition('topright');
            smallMapBuilt = true;
            $('div#timeIndicatorGeo').hide();
            
            
      var layerToggleOptions = {
            'text': '',  // string
            'iconUrl': urlsBase + '/js/leaflet/dist/images/layers.png',  // string
            'onClick': layer_toggle_onClick,  // callback function
            'hideText': true,  // bool
            'maxWidth': 30,  // number
            'doToggle': false,  // bool
            'toggleStatus': false  // bool
      }   

      var layerToggle = new L.Control.Button(layerToggleOptions).addTo(mapSmall);
      
      function layer_toggle_onClick() {
          if (mapSmall.hasLayer(satellite)) {
            mapSmall.removeLayer(satellite);
            mapSmall.addLayer(streets);
            this.className = '';
          } else {
            mapSmall.addLayer(satellite);
            mapSmall.removeLayer(streets);
            this.className = 'active';
          }
      }
        
        
}


  
    
}); 
