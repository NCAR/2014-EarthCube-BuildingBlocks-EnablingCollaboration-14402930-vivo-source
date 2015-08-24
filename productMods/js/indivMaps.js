/* $This file is distributed under the terms of the license in /doc/license.txt$ */

$(document).ready(function(){
    var legendIsVisible = false;
    
/*    $.extend(this, urlsBase);
    $.extend(this, i18nStrings); 

$Not sure if these lines are necessary$    
*/


    buildSmallMap();    
function buildSmallMap() {
          
      var mapSmall = L.map('mapSmall').setView([latitude, longitude], 2);
            mapSmall.touchZoom.disable();
            mapSmall.doubleClickZoom.disable();
            mapSmall.scrollWheelZoom.disable();
            mapSmall.boxZoom.disable();
            mapSmall.keyboard.disable();
            mapSmall.zoomControl.setPosition('topright');
            L.tileLayer('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile\/{z}\/{y}\/{x}.png', {
              maxZoom: 12,
              minZoom: 1,
              boxZoom: false,
              doubleClickZoom: false,
              attribution: 'Tiles &copy; <a href="http://www.esri.com/">Esri</a>'
            }).addTo(mapSmall);
            var marker = L.marker([latitude, longitude]).addTo(mapSmall);
            smallMapBuilt = true;
            $('div#timeIndicatorGeo').hide();
        }
    


  
    
}); 
