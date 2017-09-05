/* $This file is distributed under the terms of the license in /doc/license.txt$ */

$(document).ready(function(){
  var legendIsVisible = false;
    
  buildSmallMap();    

  function buildSmallMap() {
          
      var satellite = L.tileLayer('https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile\/{z}\/{y}\/{x}.png', {
            boxZoom: false,
            doubleClickZoom: false,
            attribution: 'Tiles &copy; <a href="http://www.esri.com/">Esri</a>'
          }),
          
          streets = L.tileLayer('https://api.mapbox.com/v4/mapbox.streets/{z}/{x}/{y}.png?access_token={accessToken}', {
          	attribution: 'Tiles &copy; <a href="https://www.mapbox.com/map-feedback/">Mapbox</a>, &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap contributors</a>',
            boxZoom: false,
            doubleClickZoom: false,
          	accessToken: 'pk.eyJ1IjoibWJncm9zcyIsImEiOiJjaWVrNWx5bHAwMTBzc3JtMTlsbXp4N25lIn0.dFF6rXQ_LHVC5IkT4MYRhg'
          });
            
      var mapSmall = L.map('mapSmall').setView([latitude, longitude], 2);
            mapSmall.touchZoom.disable();
            mapSmall.doubleClickZoom.disable();
            mapSmall.scrollWheelZoom.disable();
            mapSmall.boxZoom.disable();
            mapSmall.keyboard.disable();
            var marker = L.marker([latitude, longitude]).addTo(mapSmall);
            satellite.addTo(mapSmall);
            mapSmall.zoomControl.setPosition('topright');            
            
      var layerToggleOptions = {
            'text': '',  // string
            'iconUrl': urlsBase + '/js/leaflet/dist/images/layers.png',  // string
            'onClick': layer_toggle_onClick,  // callback function
            'hideText': true,  // bool
            'maxWidth': 30,  // number
            'doToggle': false,  // bool
            'toggleStatus': false  // bool
      }   

      var layerToggle = new L.Control.Button(layerToggleOptions).addTo(mapSmall); // see indivMaps_button.js
      
      smallMapBuilt = true;
      $('div#timeIndicatorGeo').hide();
      
      
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
