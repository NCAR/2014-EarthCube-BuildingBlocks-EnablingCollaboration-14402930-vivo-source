/* $This file is distributed under the terms of the license in /doc/license.txt$ */

$(document).ready(function(){

    $.extend(this, urlsBase);
    $.extend(this, i18nStrings);

    var retryCount = 0;

    // this will ensure that the hidden classgroup input is cleared if the back button is used
    // to return to th ehome page from the search results
    $('input[name="classgroup"]').val("");

    buildWordMap();

    if ( $('section#home-geo-focus').length == 0 ) {
        $('section#home-stats').css("display","inline-block").css("margin-top","20px");
    }

    function adjustImageHeight(theImg) {
        $img = theImg;
        var hgt = $img.attr("height");
        if (  hgt > 70 ) {
            var liHtml = $img.parent('li').html();
            liHtml = liHtml.replace("<img","<div id='adjImgHeight'><img");
            liHtml = liHtml.replace("<h1","</div><h1");
            $img.parent('li').html(liHtml);
        }
    }

    // build a word cloud from the research area and expertise list using d3
    function buildWordMap() {
      var fill = d3.scaleLinear()
          .domain([0, 0.4, 1])
          .range(["#000000", "#395d7f", "#62b6d7"]);
    var width = $('#wordMap').width();
    var height = 400

    var layout = d3.layout.cloud()
    .size([width, height])
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
