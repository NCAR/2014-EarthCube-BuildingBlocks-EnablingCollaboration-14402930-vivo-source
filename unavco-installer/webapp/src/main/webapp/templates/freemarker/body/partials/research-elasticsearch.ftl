${headScripts.add('<script type="text/javascript" src="${urls.base}/js/facetview2/vendor/jquery/1.7.1/jquery-1.7.1.min.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/vendor/bootstrap/js/bootstrap.min.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/vendor/jquery-ui-1.8.18.custom/jquery-ui-1.8.18.custom.min.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/es.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/bootstrap2.facetview.theme.js"></script>',
                '<script type="text/javascript" src="${urls.base}/js/facetview2/jquery.facetview2.js"></script>',
                ' <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(\'.facet-view-simple\').facetview({
                search_url: \'http://localhost:9200/unavco/publication/_search\',
                page_size: 20,
                sort: [{"publicationYear" : {"order" : "desc"}}],
                sharesave_link: true,
                search_button: false,
                default_freetext_fuzzify: "*",
                default_facet_operator: "AND",
                default_facet_order: "count",
                default_facet_size: 15,
				pushstate: false,
                facets: [
                    {\'field\': \'mostSpecificType\', \'display\': \'Type\'},
                    // {\'field\': \'community.name.exact\', \'display\': \'DCO Community\'},
                    // {\'field\': \'team.name.exact\', \'display\': \'DCO Team\'},
                    {\'field\': \'subjectArea.name.exact\', \'display\': \'Subject Area\'},
                    {\'field\': \'authors.name.exact\', \'size\': 20, \'display\': \'Author\'},
                    {\'field\': \'publicationYear\', \'display\': \'Publication Year\', "type" : "date_histogram", "open" : 				 						false,\'sort\':\'desc\', "size" : 50},
                    {\'field\': \'publishedIn.name.exact\', \'display\': \'Published in\'},
                    {\'field\': \'presentedAt.name.exact\', \'display\': \'Presented at Event\'},
                    // {\'field\': \'authors.organization.name.exact\', \'display\': \'Author Organization\'},
                    {\'field\': \'authors.researchArea.exact\', \'display\': \'Author Research Area\'},
                   // {\'field\': \'isDcoPublication\', \'display\': \'Only show contributions to the DCO\'}
                ],
                search_sortby: [
                    {\'display\':\'Title\',\'field\':\'title.exact\'},
                    {\'display\':\'Date\',\'field\':\'publicationYear\'}
                ],
                render_result_record: function(options, record)
                {

                    var doiUrl = "https://dx.doi.org/"+record["doi"];
					var vivoUrlRoot = \'http://localhost:8080/vivo/individual?uri=\'

                    var html = "<tr><td>";
				
					// title and link to vivo page
                    html += "<strong><a href=\\""+ vivoUrlRoot + record["uri"] + "\\" >" + record["title"] + 							"</a></strong>";

                    // display publicationYear
                    if (record["publicationYear"]) {
						pubYear = new Date(record["publicationYear"]).getUTCFullYear();
                        html += "&emsp;<small>(" + pubYear + ")</small>";
                    }

                    if (record["mostSpecificType"]) {
                        html += "<br />Type: " + record["mostSpecificType"];
                    }

                  /*  if (record["community"]) {
                        html += "<br /><span>Community: <a href=\\"" + record["community"]["uri"] + "\\" target=\\"_blank\\">" + record["community"]["name"] + "</a></span>";
                    }

                    if (record["team"]) {
                        html += "<br /><span>Team: <a href=\\"" + record["team"]["uri"] + "\\" target=\\"_blank\\">" + record["team"]["name"] + "</a></span>";
                    } */

                    // display authors
                    if (record["authors"]) {
                        if (record["authors"].length != 0) {
                            html += "<br /><span><small>Authors: ";
                            for (var i = 0; i < record["authors"].length; i++) {
								if(record["authors"][i]["uri"]){ 
                                html += "<a href=\\"" + vivoUrlRoot + record["authors"][i]["uri"] + "\\" >" + 										record["authors"][i]["name"] + "</a>"; }
								else {
									html += record["authors"][i]["name"]
								}
                                if (i < record["authors"].length - 1) {
                                    html += "; ";
                                }
                            }
                            html += "</small></span>";
                        }
                    }
					
                    // display publication venue
                    if (record["publishedIn"]) {
                        if (record["publishedIn"].length != 0) {
                            html += "<br /><span><small>Published In: ";
                            for (var i = 0; i < record["publishedIn"].length; i++) {
								if(record["publishedIn"][i]["uri"]){ 
                                html += "<a href=\\"" + vivoUrlRoot + record["publishedIn"][i]["uri"] + "\\" >" + 										record["publishedIn"][i]["name"] + "</a>"; }
								else {
									html += record["publishedIn"][i]["name"]
								}
                                if (i < record["publishedIn"].length - 1) {
                                    html += "; ";
                                }
                            }
                            html += "</small></span>";
                        }
                    }

                    // display conference
                    if (record["presentedAt"]) {
                        if (record["presentedAt"].length != 0) {
                            html += "<br /><span><small>Presented at: ";
                            for (var i = 0; i < record["presentedAt"].length; i++) {
								if(record["presentedAt"][i]["uri"]){ 
                                html += "<a href=\\"" + vivoUrlRoot + record["presentedAt"][i]["uri"] + "\\" >" + 										record["presentedAt"][i]["name"] + "</a>"; }
								else {
									html += record["presentedAt"][i]["name"]
								}
                                if (i < record["presentedAt"].length - 1) {
                                    html += "; ";
                                }
                            }
                            html += "</small></span>";
                        }
                    }					

                    if (record["subjectArea"]) {
                        html += "<br /><span>Subject Areas: ";

                        for(var i = 0; i < record["subjectArea"].length; i++) {
                            html += "<a href=\\"" + vivoUrlRoot + record["subjectArea"][i]["uri"] + "\\" target=\\"_blank\\">" + record["subjectArea"][i]["name"] + "</a>";
                            if (i < record["subjectArea"].length - 1) {
                                html += "; ";
                            }
                        }

                        html += "</span>"
                    }



                    // Badges

                    html += "<br />";

                    if (record["doi"]) {
                        var escapedDOI = encodeURIComponent(record["doi"]);
                        html += "<a href=\\"" + doiUrl + "\\" target=\\"_blank\\"><img style=\'vertical-align: middle\' src=\'//dcotest.tw.rpi.edu/badges/badge?title=DOI&text="+escapedDOI+"&color=66CCFF\'/></a>&emsp;";
                    }

                  

                    html += "</td></tr>";
                    return html;
                },
                selected_filters_in_facet: true,
                show_filter_field : true,
                show_filter_logic: true,

            });
        });

    </script>')}

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/js/facetview2/vendor/bootstrap/css/bootstrap.min.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/facetview2/vendor/jquery-ui-1.8.18.custom/jquery-ui-1.8.18.custom.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/facetview2/css/facetview.css" />',
                  '<link rel="stylesheet" href="${urls.base}/js/facetview2/css/browsers.css" />',
                  ' <style type="text/css">

        @import url("http://vivodev.int.unavco.org/themes/wilma_unavco/css/wilma.css") body;

        .facet-view-simple{
            width:95%;
            height:100%;
            margin:20px auto 0 auto;
        }
        
        .facet-view-simple a {
            text-decoration: none     
        }

        .facetview_freetext.span4 {
           width: 290px;
           height: 18px;
        }

        legend {
           display: none;
        }

        #wrapper-content {
          padding-top: 0px;
        }

        input {
            -webkit-box-shadow: none;
            box-shadow: none;
        }
        
        .alert {
           margin-top: 20px; 
        }

    </style>')}


<div class="facet-view-simple"></div>
