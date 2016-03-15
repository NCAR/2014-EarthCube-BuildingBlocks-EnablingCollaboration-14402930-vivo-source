/* $This file is distributed under the terms of the license in /doc/license.txt$ */

$(document).ready(function(){
    
    $.extend(this, urlsBase);
    $.extend(this, facultyMemberCount);
    $.extend(this, i18nStrings);

    var retryCount = 0;
    
    // this will ensure that the hidden classgroup input is cleared if the back button is used
    // to return to th ehome page from the search results
    $('input[name="classgroup"]').val("");    

    buildMembers();
    buildWordMap();

    if ( $('section#home-geo-focus').length == 0 ) {
        $('section#home-stats').css("display","inline-block").css("margin-top","20px");
    } 
        
 function buildMembers() {
        var memNbr = members.length;
        var memhtml = "<ul>";
        var memindex = Math.floor((Math.random()*memNbr)+1)-1;

        if ( memNbr == 0 ) {
            memhtml = "<ul style='list-style:none'><p><li style='padding-top:0.3em'>"
                   + i18nStrings.noDepartmentsFound + "</li></p></ul>";
        }
	else if ( memNbr > 6 ) {
                //if there are more than 6 consortium members, we want to choose a random subset and display
                //and also to make sure the same department is not repeated twice
                var memindicesUsed = {};//utilizing a hash since easier
                var memindicesCount = 0;
                while(memindicesCount < 6) {
                memindex = Math.floor((Math.random()*memNbr)+1)-1;
                //if the memindex has already been used, this will be true
                var memindexFound = (memindex in memindicesUsed);
                //Check to see if this memindex hasn't already been employed
                if(!memindexFound) {
                        //if this memindex hasn't already been employed then utilize it
                         memhtml += "<li class='individual' role='listitem'><h1><a href='" + urlsBase + "/individual?uri="
                     + members[memindex].uri + "'>"
                     + members[memindex].name + "</a></h1>"
                     + "<span class='title'>Representative: <a href='"+ urlsBase + "/individual?uri=" 
                     + members[memindex].repURI + "'>"
                     + members[memindex].repName+"</a></span>"
                     + "<span class='title'><b>"+members[memindex].type+"</b></span></li>";
                         //add this memindex to the set of already used memindices
                         memindicesUsed[memindex] = true;
                         //keep count
                         memindicesCount++;
                }
            }
	}
	else {
            for ( var i=0;i<memNbr;i++) {
                memhtml += "<li class='individual' role='listitem'><h1><a href='" + urlsBase + "/individual?uri="
                        + members[i].uri + "'>"
                        + members[i].name + "</a></h1></li>";
            }
	}
	if ( memNbr > 0 ) {
            memhtml += "</ul><ul style='list-style:none'>"
                    + "<li style='font-size:0.9em;text-align:right;padding: 6px 16px 0 0'><a href='"
                    + urlsBase
                    + "/display/org253530#membership' alt='"
                    + i18nStrings.viewAllDepartments + "'>"
                    + i18nStrings.viewAllString + "</a></li></ul>";
        }
	$('div#members').html(memhtml);
    }

  // build a word cloud from the research area and expertise list using d3
  function buildWordMap() {
    var fill = d3.scale.linear()
        .domain([0, 0.4, 1])
        .range(["#000000", "#395d7f", "#62b6d7"]);
  var membersHeight = $('#members').height()-30;    
        
  var layout = d3.layout.cloud()
  .size([558, membersHeight-22])
  .words(word_list)
  .padding(.5)
  .rotate(0)
//  .rotate(function() { return ~~(Math.random() * 1.2) * 90; })
  .font("Impact")
  .fontSize(function(d) { return 10*Math.sqrt(d.size); })
  .on("end", draw);

  layout.start();

  function draw(words) {
  d3.select("#wordMap").append("svg")
  .attr("width", layout.size()[0])
  .attr("height", layout.size()[1])
  .append("g")
  .attr("transform", "translate(" + layout.size()[0] / 2 + "," + layout.size()[1] / 2 + ")")
  .selectAll("text")
  .data(words)
  .enter().append("text")
  .style("font-size", function(d) { return d.size + "px"; })
  .style("font-family", "Impact")
  .style("fill", function(d, i) { return fill(Math.random()); })
  .attr("text-anchor", "middle")
  .attr("transform", function(d) {
    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
  })
  .text(function(d) { return d.text; })
  .on("click", function (d){
          window.location = urlsBase+"/individual?uri="+d.uri;
      });
  

  var vahtml = "<ul style='list-style:none'>"
          + "<li style='font-size:0.9em;text-align:right;padding: 6px 16px 0 0'><a href='"
          + urlsBase
          + "/expertise' alt='"
          + "view expertise and research index'>"
          + i18nStrings.viewAllString + "</a></li></ul>";

  
  $("div#wordMap").append(vahtml);

  }
    
  }

}); 
