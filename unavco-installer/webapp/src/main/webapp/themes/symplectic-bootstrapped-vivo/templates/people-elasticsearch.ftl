<#include "elasticsearch-settings.ftl">

${headScripts.add('<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.1/handlebars.min.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/es.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/facetview2/bootstrap3.facetview.theme.js"></script>',
                '<script type="text/javascript" src="${urls.base}/js/facetview2/jquery.facetview2.js"></script>',
                '<script type="text/javascript" src="${urls.base}/js/js.cookie.js"></script>',
                '<script type="text/javascript">jQuery(function( $ ){$(".close").click(function( e ){e.preventDefault();
                 Cookies.set("alert-box-people", "closed", { path: "/" });});});
                 jQuery(function( $ ){if( Cookies.get("alert-box-people") === "closed" ){$(".alert").hide();}});
                 </script>',
                '<script id="person-template" type="text/x-handlebars-template">
        <tr>
            <td>
                <div class="document">
                        <h4>
                            <a class="" href="${url_base}{{uri}}">{{name}}</a>
                        </h4>
                        <div class="doc_info">
                        {{#if thumbnail}}<div class="row"><div class="thumbnail col-lg-4 col-md-3 col-sm-2 col-xs-12"><img src="{{thumbnail}}"></div><div class="col-lg-8 col-md-9 col-sm-10 col-xs-12">{{/if}}



                        {{#if (showMostSpecificType mostSpecificType)}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Role:</div><div class="col-lg-9 col-sm-9">{{mostSpecificType}}</div></div>{{/if}}
                        {{#if email}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Email:</div><div class="col-lg-9 col-sm-9"><a href="&#109;&#097;&#105;&#108;&#116;&#111;&#58;{{email}}">{{email}}</a></div></div>{{/if}}

                        {{#if organizations}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Organizations:</div>
                        <div class="col-lg-9 col-sm-9">{{#list organizations}}{{#if orgrole}}{{orgrole}} - {{/if}}<a href="{{organization.uri}}" target="_blank">{{organization.name}}</a>{{/list}}</div></div>
                        {{/if}}

                        {{#if researchArea}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Research Areas:</div> <div class="col-lg-9 col-sm-9">{{#expand researchArea}}<a href="${url_base}{{uri}}" target="_blank">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if expertiseArea}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Expertise Areas:</div> <div class="col-lg-9 col-sm-9"> {{#expand expertiseArea}}<a href="${url_base}{{uri}}" target="_blank">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if homeCountry}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Country:</div> <div class="col-lg-9 col-sm-9"> {{homeCountry.name}}</div></div>
                        {{/if}}

                      {{#if thumbnail}}</div></div>{{/if}}


                        {{!-- BADGES --}}
                        {{#if orcid}}
                        <div style=\'display: inline-block; margin-top:.5em;\'>
                            <div style=\'display: inline;margin-right: .5em;\'><a href="{{orcidURL orcid}}" target="_blank"><img src="{{orcidBadgeURL orcid}}" /></a></div>
                        </div>
                        {{/if}}

                      </div>
                </div>
            </td>
          </tr>
    </script>',

    '<script type="text/javascript">

        Handlebars.registerHelper("orcidURL", function(orcid) {
            return "http://orcid.org/"+orcid;
        });


        Handlebars.registerHelper("orcidBadgeURL", function(orcid) {
            var escapedORCID = encodeURIComponent(orcid).replace(/-/g, "--");
            return "https://img.shields.io/badge/ORCID-" + escapedORCID + "-green.svg";
        });


        Handlebars.registerHelper("showMostSpecificType", function(mostSpecificType) {
            return (mostSpecificType && mostSpecificType != "Person");
        });

        Handlebars.registerHelper("expand", function(items, options) {
            var out = "";
            var j = items.length - 1;
            for(var i = 0; i < items.length; i++) {
                out += options.fn(items[i]);
                if(i < j) {
                    out += "; ";
                }
            }
            return out;
        });

        Handlebars.registerHelper("list", function(items, options) {
            var out = "<ul class=\'list-unstyled\'>";
            for(var i=0, l=items.length; i<l; i++) {
                out = out + "<li>" + options.fn(items[i]) + "</li>";
            }
            return out + "</ul>";
        });

        var source = $("#person-template").html();
        var template = Handlebars.compile(source);

    </script>',
    '<script type="text/javascript">

        jQuery(document).ready(function($) {
            $(".facet-view-simple").facetview({
                search_url: "${elasticsearch_base}/person/_search",
                page_size: 10,
                sort: [
                    {"_score" : {"order" : "desc"}},
                    {"name.sort" : {"order" : "asc"}}
                ],
                sharesave_link: false,
                search_button: true,
				        page_size_dropdown: true,
                //default_freetext_fuzzify: "*",
                default_facet_operator: "AND",
                default_facet_order: "count",
                default_facet_size: 5,
                search_fields_multi: ["*folded","_all"],
                controls: false,
				        pushstate: false,
                csv_export: true,
                facets: [
                    {"field": "mostSpecificType.exact", "display": "UNAVCO role", "open": true, "controls": false},
                    // {"field": "organizations.organization.name.exact", "display": "Organization"},
                    {"field": "researchArea.name.exact", "display": "Research area", "open": true, "controls": false},
					          {"field": "expertiseArea.name.exact", "display": "Expertise area", "open": true, "controls": false},
                ],
                search_sortby: [
                    {"display":"Relevance","field":["_score","name.sort"]},
                    {"display":"Name","field":"name.sort"}
                ],
                // TODO FIGURE OUT WHAT THE DIFFERENCE IS
                facetview_orderby: [
                    {"display":"Name","field":"name.exact"}
                ],
                render_result_record: function(options, record)
                {
                    return template(record).trim();
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
                  //  padding: 0px !important;
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
                      // width: 150px;
                      border-radius: 3px;
                      box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);
                      border: 1px;
                  }

                  .row {
                      // background-color: #fff !important;
                      margin: 0 !important;
                  }

                  h4 a:link, h4 a:visited{
                    text-decoration: none !important;
                    color: #355374 !important;
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
<small>${i18n().class_group_description_people}</small>
</div>

</section>

<div class="facet-view-simple"></div>
