<#include "elasticsearch-settings.ftl">

${headScripts.add('<script type="text/javascript">jQuery(function( $ ){$(".close").click(function( e ){e.preventDefault();
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
                        {{#if thumbnail}}<div><div class="thumbnail" style="width:25%"><img src="{{thumbnail}}"></div><div style="float:right; width:70%">{{/if}}


                        <dl class="doc_info_list">

                        {{#if retirementDate}}
                        <dt>Retired:</dt><dd> {{year retirementDate}}</dd>
                        {{/if}}

                        {{#if principalInvestigators}}
                        <dt>PIs:</dt><dd> {{#expand principalInvestigators}} {{#if uri}}<a href="${url_base}{{encodeURL uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</dd>
                        {{/if}}

                        {{#if state}}
                        <dt>State:</dt><dd> {{#expand state}} {{#if uri}}<a href="${url_base}{{encodeURL uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</dd>
                        {{/if}}

                        {{#if country}}
                        <dt>Country:</dt><dd> {{#expand country}} {{#if uri}}<a href="${url_base}{{encodeURL uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</dd>
                        {{/if}}

                        {{#if continent}}
                        <dt>Continent:</dt><dd> {{#expand continent}} {{#if uri}}<a href="${url_base}{{encodeURL uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</dd>
                        {{/if}}

                        {{#if relatedDatasets}}
                        <dt>Related datasets:</dt><dd> {{#expand relatedDatasets}}<a href="${url_base}{{uri}}">{{name}}</a>{{/expand}}</dd>
                        {{/if}}

                      </dl>
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

        Handlebars.registerHelper("encodeURL", function(url) {
            return encodeURIComponent(url);
        });

        Handlebars.registerHelper("year", function(date) {
            return new Date(date).getUTCFullYear();
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
                search_url: "${elasticsearch_base}/station/_search",
                page_size: 10,
                sort: [
                    {"_score" : {"order" : "desc"}},
                    {"name.sort" : {"order" : "asc"}}
                ],
                sharesave_link: false,
                search_button: true,
				        page_size_dropdown: true,
                default_facet_operator: "AND",
                default_facet_order: "count",
                default_facet_size: 5,
                search_fields_multi: ["*folded","_all"],
                controls: false,
				        pushstate: false,
                csv_export: true,
                facets: [
                    {"field": "principalInvestigators.name.exact", "display": "Principal Investigator", "open" : true, "controls": false},
                    {"field": "state.name.exact", "display": "State", "open" : true, "controls": false},
                    {"field": "country.name.exact", "display": "Country", "open" : true, "controls": false},
                    {"field": "continent.name.exact", "display": "Continent", "open" : true, "controls": false},
                    {"field": "retirementDate", "display": "Retirement Year", "type" : "date_histogram", "open" : false,"sort":"desc", "size" : 50, "controls": false }
                ],
                search_sortby: [
                    {"display":"Relevance","field":["_score","name.sort"]},
                    {"display":"Name","field":"name.sort"}
                ],
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

<section id="menupage-intro" role="region">
<h2>${page.title}</h2>
<div style="clear:both"></div>

<div class="alert alert-info fade in">
   <a href="#" class="close" data-dismiss="alert" aria-label="close">&#10006;</a>
<small>${i18n().class_group_description_locations}</small>
</div>

</section>
<div class="facet-view-simple"></div>
