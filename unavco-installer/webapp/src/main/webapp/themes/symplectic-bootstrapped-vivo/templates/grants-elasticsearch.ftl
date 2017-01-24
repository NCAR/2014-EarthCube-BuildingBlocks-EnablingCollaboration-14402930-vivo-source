<#include "elasticsearch-settings.ftl">

${headScripts.add('<script type="text/javascript" src="${urls.base}/js/facetview2/es.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/bootstrap3.facetview.theme.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/jquery.facetview2.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/js.cookie.js"></script>',
              '<script type="text/javascript">jQuery(function( $ ){$(".close").click(function( e ){e.preventDefault();
               Cookies.set("alert-box-research", "closed", { path: "/" });});});
               jQuery(function( $ ){if( Cookies.get("alert-box-research") === "closed" ){$(".alert").hide();}});
               </script>',
              '<script type="text/javascript">
        jQuery(document).ready(function($) {
            $(\'.facet-view-simple\').facetview({
                search_url: "${elasticsearch_base}/grant/_search",
                page_size: 10,
                page_size_dropdown: true,
                sort: [{"_score" : {"order" : "desc"}},{"title.exact" : {"order" : "asc"}}],
                sharesave_link: false,
                search_button: true,
                //default_freetext_fuzzify: "*",
                default_facet_operator: "AND",
                default_facet_order: "count",
                default_facet_size: 5,
                search_fields_multi: ["*folded","_all"],
				        pushstate: false,
				        csv_export: true,
                facets: [
                  {"field": "administratingOrg.name.exact", "display": "Grant Administrator", "open" : true, "controls": false},
                  {"field": "assignedBy.name.exact", "display": "Awarding Organization", "open" : true, "controls": false},
                  {"field": "principalInvestigator.name.exact", "display": "Principal Investigator", "open" : true, "controls": false},
                  {"field": "coPrincipalInvestigators.name.exact", "display": "Co-Principal Investigator", "open" : true, "controls": false},
                  {"field": "startDate", "display": "Start Year", "type" : "date_histogram", "open" : false,"sort":"desc", "size" : 50, "controls": false}
                ],
                search_sortby: [
                    {\'display\':\'Relevance\',\'field\':["_score","title.exact"]},
                    {\'display\':\'Title\',\'field\':\'title.exact\'},
                    {\'display\':\'Date\',\'field\':\'startDate\'}
                ],
                render_result_record: function(options, record)
                {

                    var doiUrl = "https://dx.doi.org/"+record["doi"];
					var vivoUrlRoot = "${url_base}";

                    var html = "<tr><td><div class=\'document\'>";

					// title and link to vivo page
                    html += "<h4><a href=\\""+ vivoUrlRoot + record["uri"] + "\\" >" + record["title"] + "</a></h4><div class=\'doc_info\'>";

                    // Record info
                    html += "<dl class=\'doc_info_list\'>";

                    // display principalInvestigator
                    if (record["principalInvestigator"]) {
                        if (record["principalInvestigator"].length != 0) {
                            html += "<dt>PI:</dt><dd>";
                            for (var i = 0; i < record["principalInvestigator"].length; i++) {
								if(record["principalInvestigator"][i]["uri"]){
                                html += "<a href=\\"" + vivoUrlRoot + record["principalInvestigator"][i]["uri"] + "\\" >" + record["principalInvestigator"][i]["name"] + "</a>"; }
								else {
									html += record["principalInvestigator"][i]["name"]
								}
                                if (i < record["principalInvestigator"].length - 1) {
                                    html += "; ";
                                }
                            }
                            html += "</dd>";
                        }
                    }


                    // display coPrincipalInvestigators
                    if (record["coPrincipalInvestigators"]) {
                        if (record["coPrincipalInvestigators"].length != 0) {
                            html += "<dt>Co-PIs:</dt><dd>";
                            for (var i = 0; i < record["coPrincipalInvestigators"].length; i++) {
								if(record["coPrincipalInvestigators"][i]["uri"]){
                                html += "<a href=\\"" + vivoUrlRoot + record["coPrincipalInvestigators"][i]["uri"] + "\\" >" + record["coPrincipalInvestigators"][i]["name"] + "</a>"; }
								else {
									html += record["coPrincipalInvestigators"][i]["name"]
								}
                                if (i < record["coPrincipalInvestigators"].length - 1) {
                                    html += "; ";
                                }
                            }
                            html += "</dd>";
                        }
                    }

                    // display admin org
                    if (record["administratingOrg"]) {
                        html += "<dt>Organization:</dt><dd>";
                        if (record["administratingOrg"].length == 0) {
                            html += \'N/A\'
                        } else {
                            for (var i = 0; i < record["administratingOrg"].length; i++) {
                                html += "<a href=\'" + vivoUrlRoot + record["administratingOrg"][i]["uri"] + "\' >" + record["administratingOrg"][i]["name"] + "</a>";
                                if (i < record["administratingOrg"].length - 1) {
                                    html += "; ";
                                }
                            }
                        }
                        html += "</dd>";
                    }

                    // display awarding org
                    if (record["assignedBy"]) {
                        html += "<dt>Awarding Organization:</dt><dd>";
                        if (record["assignedBy"].length == 0) {
                            html += \'N/A\'
                        } else {
                            for (var i = 0; i < record["assignedBy"].length; i++) {
                                html += "<a href=\'" + vivoUrlRoot + record["assignedBy"][i]["uri"] + "\' >" + record["assignedBy"][i]["name"] + "</a>";
                                if (i < record["assignedBy"].length - 1) {
                                    html += "; ";
                                }
                            }
                        }
                        html += "</dd>";
                    }


                    // display publicationYear
                    if (record["startDate"]) {
						          pubYear = new Date(record["startDate"]).getUTCFullYear();
                        html += "<dt>Start Date:</dt><dd>" + pubYear + "</dd>";
                    }


                // display citations
               if (record["citations"]) {
                   html += "<dt>Related documents:</dt><dd>";
                   if (record["citations"].length == 0) {
                       html += \'N/A\'
                   } else {
                       for (var i = 0; i < record["citations"].length; i++) {
                           html += "<a href=\'" + vivoUrlRoot + record["citations"][i]["uri"] + "\' >" + record["citations"][i]["name"] + "</a>";
                           if (i < record["citations"].length - 1) {
                               html += "; ";
                           }
                       }
                   }
                   html += "</dd>";
               }


                    html += "</dl>"

               // Badges

               if (record["sponsorAwardId"]) {
                   html += "<div style=\'display: inline-block; margin-top:.5em;\'>";
                   html += "<div style=\'display: inline;margin-right: .5em;\'><img src=\'https://img.shields.io/badge/ID-" + record["sponsorAwardId"].replace(/-/g, "--") + "-blue.svg\'></div>"
               }




               html += "</div></div></div></td></tr>";
               return html;
                },
                selected_filters_in_facet: true,
                show_filter_field : true,
                show_filter_logic: true,

            });
        });

    </script>')}

    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/js/facetview2/css/facetview.css" />',
                      '<link rel="stylesheet" href="${urls.base}/js/facetview2/css/browsers.css" />',
                      '<link rel="stylesheet" href="${urls.base}/js/facetview2/css/style.css" />',
                      ' <style type="text/css">

                      .facet-view-simple{
                          width:100%;
                          height:100%;
                          margin:0 auto 0 auto;
                          font-size: 14px;
                      }

                      .facet-view-simple a {
                          text-decoration: none
                      }

                      .facetview_freetext.span4 {
                         width: 290px;
                         height: 10px;
                      }

                      legend {
                          display: none;
                      }

                      #wrapper-content {
                        // padding: 0px !important;
                        width: 970px !important;

                      }

                      input {
                          -webkit-box-shadow: none;
                          box-shadow: none;
                      }

                      .person-info {
                          display: inline-block;
                          vertical-align: top;
                          // clear: left;
                          margin-left: 0 !important;
                      }

                      .thumbnail {
                          display: inline-block;
                          width: 150px;
                          box-shadow: none;
                          border: none;
                      }

                      .row {
                          // background-color: #fff !important;
                          margin: 0 !important;
                      }

                      h4 a:link, h4 a:visited{
                        text-decoration: none !important;
                      }

                      .facet-panel {
                        border: 2px solid;
                        border-color: #f3f3f0;
                      }

                      ul#main-nav {
                      width: 970px !important;
                      height: 48px !important;
                      }

                      #unavco-branding {
                        height: 57px !important;
                      }


                  </style>')}

<section id="menupage-intro" role="region">
<h2>${page.title}</h2>
<div style="clear:both"></div>

<div class="alert alert-info fade in">
   <a href="#" class="close" data-dismiss="alert" aria-label="close">&#10006;</a>
<small>${i18n().class_group_description_grants}</small>
</div>

</section>
<div class="facet-view-simple"></div>
