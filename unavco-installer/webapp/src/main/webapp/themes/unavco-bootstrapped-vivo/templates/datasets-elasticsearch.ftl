<#include "elasticsearch-settings.ftl">

${headScripts.add('<script type="text/javascript">jQuery(function( $ ){$(".close").click(function( e ){e.preventDefault();
               Cookies.set("alert-box-research", "closed", { path: "/" });});});
               jQuery(function( $ ){if( Cookies.get("alert-box-research") === "closed" ){$(".alert").hide();}});
               </script>',
               '<script id="dataset-template" type="text/x-handlebars-template">
       <tr>
           <td>
               <div class="document">
                       <h4>
                           <a class="" href="${url_base}{{uri}}">{{title}}</a>
                       </h4>
                       <div class="doc_info">

                       {{#if dataTypes}}
                       <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Dataset Type:</div>
                       <div class="col-lg-9 col-sm-9">{{#expand dataTypes}} {{#if uri}}<a href="${url_base}{{encodeURL uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                       {{/if}}

                       {{#if authors}}
                       <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Authors:</div>
                       <div class="col-lg-9 col-sm-9">{{#expand authors}} {{#if uri}}<a href="${url_base}{{encodeURL uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                       {{/if}}

                       {{#if publicationYear}}
                       <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Publication Year:</div><div class="col-lg-9 col-sm-9"> {{year publicationYear}}</div></div>
                       {{/if}}

                       {{#if citations}}
                       <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Related documents::</div> <div class="col-lg-9 col-sm-9"> {{#expand citations}}<a href="${url_base}{{uri}}" target="_blank">{{name}}</a>{{/expand}}</div></div>
                       {{/if}}

                       {{#if stations}}
                       <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Related stations::</div> <div class="col-lg-9 col-sm-9"> {{#expand stations}}<a href="${url_base}{{uri}}" target="_blank">{{name}}</a>{{/expand}}</div></div>
                       {{/if}}

                       {{#if homeCountry}}
                       <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Country:</div> <div class="col-lg-9 col-sm-9"> {{homeCountry.name}}</div></div>
                       {{/if}}

                       {{!-- BADGES --}}
                       {{#if doi}}
                       <div style=\'display: inline-block; margin-top:.5em;\'>
                           <div style=\'display: inline;margin-right: .5em;\'><a href="{{doiURL doi}}" target="_blank"><img src="{{doiBadgeURL doi}}" /></a></div>
                       </div>
                       {{/if}}

                     </div>
               </div>
           </td>
         </tr>
   </script>',

   '<script type="text/javascript">

       Handlebars.registerHelper("doiURL", function(doi) {
           return "https://doi.org/"+doi;
       });

       Handlebars.registerHelper("encodeURL", function(url) {
           return encodeURIComponent(url);
       });

       Handlebars.registerHelper("year", function(date) {
           return new Date(date).getUTCFullYear();
       });

       Handlebars.registerHelper("doiBadgeURL", function(doi) {
           var escapedDOI = encodeURIComponent(doi).replace(/-/g, "--");
           return "https://img.shields.io/badge/DOI-" + escapedDOI + "-blue.svg";
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

       var source = $("#dataset-template").html();
       var template = Handlebars.compile(source);

   </script>',

              '<script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".facet-view-simple").facetview({
                search_url: "${elasticsearch_base}/dataset/_search",
                page_size: 10,
                page_size_dropdown: true,
                sort: [{"_score" : {"order" : "desc"}},{"publicationYear" : {"order" : "desc"}}],
                sharesave_link: false,
                search_button: true,
                //default_freetext_fuzzify: "*",
                default_facet_operator: "AND",
                default_facet_order: "count",
                default_facet_size: 10,
                search_fields_multi: ["*folded","_all"],
				        pushstate: false,
                csv_export: true,
                facets: [
                  {"field": "dataTypes.name.exact", "display": "Dataset Type", "open" : true, "controls": false},
                  {"field": "publicationYear", "display": "Publication Year", "type" : "date_histogram", "open" : false,"sort":"desc", "size" : 50, "controls": false},
                  {"field": "authors.name.exact", "size": 20, "display": "Author", "controls": false}
                ],
                search_sortby: [
                    {"display":"Relevance","field":["_score","publicationYear"]},
                    {"display":"Title","field":"title.exact"},
                    {"display":"Date","field":"publicationYear"}
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


<section id="menupage-intro" role="region">
<h2>${page.title}</h2>
<div style="clear:both"></div>

<div class="alert alert-info fade in">
   <a href="#" class="close" data-dismiss="alert" aria-label="close">&#10006;</a>
<small>${i18n().class_group_description_datasets}</small>
</div>

</section>
<div class="facet-view-simple"></div>
