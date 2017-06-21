/* $This file is distributed under the terms of the license in /doc/license.txt$ */

$(document).ready(function(){
  // This tries to find the tab on every page, which might not exist.
  // Looks back at the local storage solution that came with VIVO.
  /*(function () {
      'use strict';

      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
          var id = $(this).parents('[role="tablist"]').attr('id');
          var key = 'lastTag';
          if (id) {
              key += ':' + id;
          }
          localStorage.setItem(key, $(e.target).attr('href'));
      });

      $('[role="tablist"]').each(function (idx, elem) {
          var id = $(elem).attr('id');
          var key = 'lastTag';
          if (id) {
              key += ':' + id;
          }

          var lastTab = localStorage.getItem(key);
          if (lastTab) {
              $('[href="' + lastTab + '"]').tab('show');
              swapTabs(lastTab + "Tab")
          }
      });
  })();*/

    $.extend(this, individualLocalName);
    adjustFontSize();
    checkLocationHash();

    // prevents the page jumping down when loading a page with a requested tab in the url
    removeHash();

    // controls the property group tabs
    $.each($('ul.nav-tabs li'), function() {

        //var groupName = $(this).attr("id");
        //var $propertyGroupLi = $(this);

        // Manage local storage upon tab click
        $(this).click(function() {
          var localName = individualLocalName;
          // is this individual already stored? If not, how many have been stored?
          // If the answer is 3, remove the first one in before adding the new one
          var current = amplify.store(localName);
          var profiles = amplify.store("profiles");

          if ( current == undefined ) {
              if ( profiles == undefined ) {
                  var lnArray = [];
                  lnArray.push(localName);
                  amplify.store("profiles", lnArray);
              }
              else if ( profiles != undefined && profiles.length >= 3 ) {
                  firstItem = profiles[0];
                  amplify.store(firstItem, null);
                  profiles.splice(0,1);
                  profiles.push(localName);
                  amplify.store("profiles", profiles)
              }
              else if ( profiles != undefined && profiles.length < 3 ) {
                  profiles.push(localName);
                  amplify.store("profiles", profiles)
              }
          }
          var selectedTab = [];
          selectedTab.push($(this).attr('id'));
          amplify.store(localName, selectedTab);
          var checkLength = amplify.store(localName);
          if ( checkLength.length == 0 ) {
              amplify.store(localName, null);
          }
        });
    });

    function padSectionBottoms() {
        $.each($('.tab-pane'), function() {
            var sectionHeight = $(this).height();
            if ( sectionHeight < 1000 ) {
                $(this).css('margin-bottom', 1000-sectionHeight + "px");
            }
        });
    }

    // View all for Bootstrap-enabled themes
    $('#viewAllTab').on('click',function(){
        if (!($(this).hasClass('active')))  {
            processViewAllTab();}
    });

    function removeHash () {
        if ( location.hash ) {
            var scrollV, scrollH, loc = window.location;
            if ("pushState" in history)
                history.replaceState("", document.title, loc.pathname + loc.search);
            else {
                // Prevent scrolling by storing the page's current scroll offset
                scrollV = document.body.scrollTop;
                scrollH = document.body.scrollLeft;

                loc.hash = "";

                // Restore the scroll offset, should be flicker free
                document.body.scrollTop = scrollV;
                document.body.scrollLeft = scrollH;
            }
        }
    }

    function processViewAllTab() {
      $('[data-toggle="tab"]').parent().removeClass('active');
      $('#viewAllTab').parent().addClass('active');
      $('#viewAllTab').addClass('active');
      //$('.tab-content').fadeTo(150,0,function(){
          $('.tab-pane').addClass('fade active in');
      //    $('.tab-content').fadeTo(1000,1);
      //});

    }

    // If a page is requested with a hash this script will try to open a property
    // group tab matching that hash value.
    // The geographic focus map links to a county's page with a #map hash. This will
    // select the research tab and expand the 'geographic focus of' property list.
    function checkLocationHash() {

        var currentTab = $('li.active').attr('id')
        if ( location.hash ) {
            // remove the trailing white space
            tabName = location.hash.replace(/\s+/g, '') + 'Tab';

            /*if ( tabExists.length > 0 ) {
                  tabName = location.hash.replace('#', '')
            }

            else if ( location.hash.indexOf("map") >= 0 ) {
                if ( $('h3#geographicFocusOf').length ) {
                    var tabName = $('h3#geographicFocusOf').parent('article').parent('div').attr("id");
                    tabName = tabName.replace("Group","");
                  }
            } */

            if ( $(tabName).length ) {
                if ( tabName != currentTab ) {
                    swapTabs(tabName)
                }
            }
        }

        else {
          retrieveLocalStorage(currentTab);

        }

    }

    function swapTabs(tabName) {
      if ( tabName == '#viewAllTab'){
        processViewAllTab();
      }

      else {
        $('[data-toggle="tab"]').parent().removeClass('active');
        $('.tab-pane').removeClass('active in');
        $(tabName).addClass('active');
        $(tabName.substring(0,tabName.length - 3)).addClass('active in');
      }

    }

    function geoFocusExpand() {
        // if the ontology is set to collate by subclass, $list.length will be > 0
        // this ensures both possibilities are covered
        var $list = $('ul#geographicFocusOfList').find('ul');
        if ( $list.length > 0 )
        {
            var $more = $list.find('a.more-less');
            $more.click();
        }
        else {
            var $more = $('ul#geographicFocusOfList').find('a.more-less');
            $more.click();
        }
    }

    //  Next two functions --  keep track of which property group tab was selected,
    //  so if we return from a custom form or a related individual, even via the back button,
    //  the same property group will be selected as before.
    function manageLocalStorage() {
        var localName = this.individualLocalName;
        // is this individual already stored? If not, how many have been stored?
        // If the answer is 3, remove the first one in before adding the new one
        var current = amplify.store(localName);
        var profiles = amplify.store("profiles");

        if ( current == undefined ) {
            if ( profiles == undefined ) {
                var lnArray = [];
                lnArray.push(localName);
                amplify.store("profiles", lnArray);
            }
            else if ( profiles != undefined && profiles.length >= 3 ) {
                firstItem = profiles[0];
                amplify.store(firstItem, null);
                profiles.splice(0,1);
                profiles.push(localName);
                amplify.store("profiles", profiles)
            }
            else if ( profiles != undefined && profiles.length < 3 ) {
                profiles.push(localName);
                amplify.store("profiles", profiles)
            }
        }
        var selectedTab = [];
        selectedTab.push($('li.active').attr('id'));
        amplify.store(localName, selectedTab);
        var checkLength = amplify.store(localName);
        if ( checkLength.length == 0 ) {
            amplify.store(localName, null);
        }
    }

    function retrieveLocalStorage(currentTab) {
        var localName = this.individualLocalName;
        var selectedTab = amplify.store(individualLocalName);

        if ( selectedTab != undefined ) {
            var groupName = selectedTab[0];

            // unlikely, but it's possible a tab that was previously selected and stored won't be
            // displayed because the object properties would have been deleted (in non-edit mode).
            // So ensure that the tab in local storage has been rendered on the page.
            if ( $("ul li[id='" + groupName + "']").length ) {
                // if the selected tab is the default first one, don't do anything
                if ( $('li').first().attr("id") != groupName ) {
                    swapTabs('#' + groupName)
                }
            }
        }
        // if nothing is in the local storage, open up the view all tab for small profiles
        // Could use a better selector... if the divs change this breaks
        else if ((propertyGroupSize > 1) && ( 0 < $('.tab-pane > div > div').length < 6 )) {
           swapTabs('#viewAllTab')
        }
    }

    // if there are so many tabs that they wrap to a second line, adjust the font size to
    //prevent wrapping
    function adjustFontSize() {
        var width = 0;
        $('ul.propertyTabsList li').each(function() {
            width += $(this).outerWidth();
        });
        if ( width < 922 ) {
            var diff = 926-width;
            $('ul.propertyTabsList li:last-child').css('width', diff + 'px');
        }
        else {
            var diff = width-926;
            if ( diff < 26 ) {
                $('ul.propertyTabsList li').css('font-size', "0.96em");
            }
            else if ( diff > 26 && diff < 50 ) {
                $('ul.propertyTabsList li').css('font-size', "0.92em");
            }
            else if ( diff > 50 && diff < 80 ) {
                $('ul.propertyTabsList li').css('font-size', "0.9em");
            }
            else if ( diff > 80 && diff < 130 ) {
                $('ul.propertyTabsList li').css('font-size', "0.84em");
            }
            else if ( diff > 130 && diff < 175 ) {
                $('ul.propertyTabsList li').css('font-size', "0.8em");
            }
            else if ( diff > 175 && diff < 260 ) {
                $('ul.propertyTabsList li').css('font-size', "0.73em");
            }
            else {
                $('ul.propertyTabsList li').css('font-size', "0.7em");
            }

            // get the new width
            var newWidth = 0
            $('ul.propertyTabsList li').each(function() {
                newWidth += $(this).outerWidth();
            });
            var newDiff = 926-newWidth;
            $('ul.propertyTabsList li:last-child').css('width', newDiff + 'px');
        }
    }



});
