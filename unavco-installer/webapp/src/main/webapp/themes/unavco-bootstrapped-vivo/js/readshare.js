// Code for putting Readcube and Figshare Badges where appropriate

$('div[data-doi]').each(function( index ) {
   doi = $( this ).attr("data-doi");
   $( this ).parent().prev().append('<span>'+doi+'&nbsp;</span>')
   if (doi.includes('figshare')){
          $( this ).parent().prev().append('<span><img src="' + theme_url + '/images/figshare-favicon-16x16.png" width="20"/></span>')
       }

    $.getJSON( "https://api.crossref.org/v1/works/http://dx.doi.org/"+doi,
           function(data)
                {
                  publisher = data.message.publisher;
                  if (publisher.includes('PLoS') || publisher.includes('PeerJ') || publisher.includes('Nature') || publisher.includes('Wiley') || publisher.includes('Springer') ){
                    // This requires theme_url to be defined in a freemarker template e.g. individual--foaf-property-group-tabs.ftl
                    $('div[data-doi="'+data.message.DOI+'"]').parent().prev().append('<span><img src="' + theme_url + '/images/readcube.48d21efc.svg"/></span>')
                  }

                }
         );
});
