<#include "elasticsearch-settings.ftl">

${headScripts.add('<script type="text/javascript">jQuery(function( $ ){$(".close").click(function( e ){e.preventDefault();
                 Cookies.set("alert-box-people", "closed", { path: "/" });});});
                 jQuery(function( $ ){if( Cookies.get("alert-box-people") === "closed" ){$(".alert").hide();}});
                 </script>',
                '<script id="person-template" type="text/x-handlebars-template">
        <tr>
            <td>
                <div class="document">
                        <div class="doc_info_list row"><h4>
                        {{#if type}}
                                    <div class="col-lg-12 col-sm-12">
                                          <span class="label label-primary-transparent">{{capitalize type}}</span>
                                    </div>
                        {{/if}}
                              <div class="col-lg-12 col-sm-12"><a class="" href="${url_base}{{uri}}">{{label}}</a></div>
                        </div>
                        <div class="doc_info">
                        {{#if thumbnail}}<div class="row"><div class="thumbnail col-lg-4 col-md-3 col-sm-2 col-xs-12"><img src="{{thumbnail}}"></div><div class="col-lg-8 col-md-9 col-sm-10 col-xs-12">{{/if}}

                        {{#if (showMostSpecificType mostSpecificType)}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Type:</div><div class="col-lg-9 col-sm-9">{{mostSpecificType}}</div></div>{{/if}}

                        <!-- Research-specific fields -->
                        {{#if publicationYear}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Publication year:</div><div class="col-lg-9 col-sm-9">{{year publicationYear}}</div></div>{{/if}}
                        {{#if authors}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Authors:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand authors}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if publishedIn}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Published in:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand publishedIn}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if subjectArea}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Subject Areas:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand subjectArea}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if presentedAt}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Presented at:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand presentedAt}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        <!-- Grant-specific fields -->
                        {{#if principalInvestigator}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">PI:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand principalInvestigator}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if coPrincipalInvestigators}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">CoPIs:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand coPrincipalInvestigators}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if administratingOrg}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Organization:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand administratingOrg}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if assignedBy}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Awarding Organization:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand assignedBy}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if startDate}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Start date:</div><div class="col-lg-9 col-sm-9">{{year startDate}}</div></div>{{/if}}

                        <!-- Dataset-specific fields -->
                        {{#if dataTypes}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Dataset Type:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand dataTypes}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if citations}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Related Documents:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand citations}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if stations}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Related Stations:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand stations}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        <!-- Station-specific fields -->
                        {{#if retirementDate}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Retired:</div><div class="col-lg-9 col-sm-9">{{year retirementDate}}</div></div>{{/if}}

                        {{#if principalInvestigators}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">PIs:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand principalInvestigators}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if state}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">State:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand state}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if country}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Country:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand country}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if continent}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Continent:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand continent}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        {{#if relatedDatasets}}
                            <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Related Datasets:</div>
                            <div class="col-lg-9 col-sm-9">{{#expand relatedDatasets}} {{#if uri}}<a href="${url_base}{{uri}}">{{name}}</a>{{else}}{{name}}{{/if}}{{/expand}}</div></div>
                        {{/if}}

                        <!-- Person-specific fields -->
                        {{#if email}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Email:</div><div class="col-lg-9 col-sm-9"><a href="&#109;&#097;&#105;&#108;&#116;&#111;&#58;{{email}}">{{email}}</a></div></div>{{/if}}

                        {{#if organizations}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Organizations:</div>
                        <div class="col-lg-9 col-sm-9">{{#list organizations}}{{#if orgrole}}{{orgrole}} - {{/if}}<a href="${url_base}{{organization.uri}}">{{organization.name}}</a>{{/list}}</div></div>
                        {{/if}}

                        {{#if researchArea}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Research Areas:</div> <div class="col-lg-9 col-sm-9">{{#expand researchArea}}<a href="${url_base}{{uri}}">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if expertiseArea}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Expertise Areas:</div> <div class="col-lg-9 col-sm-9"> {{#expand expertiseArea}}<a href="${url_base}{{uri}}">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if homeCountry}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Country:</div> <div class="col-lg-9 col-sm-9"> {{homeCountry.name}}</div></div>
                        {{/if}}

                        <!-- Organization-specific fields -->
                        {{#if location}}<div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Location:</div><div class="col-lg-9 col-sm-9">{{location.lat}}, {{location.lon}}</div></div>{{/if}}

                        {{#if subOrgs}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Sub-Organizations:</div> <div class="col-lg-9 col-sm-9"> {{#expand subOrgs}}<a href="${url_base}{{uri}}">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if superOrgs}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">Super-Organizations:</div> <div class="col-lg-9 col-sm-9"> {{#expand subOrgs}}<a href="${url_base}{{uri}}">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if people}}
                        <div class="doc_info_list row"><div class="col-lg-3 col-sm-3 text-muted">People:</div> <div class="col-lg-9 col-sm-9"> {{#expand people}}<a href="${url_base}{{uri}}">{{name}}</a>{{/expand}}</div></div>
                        {{/if}}

                        {{#if thumbnail}}</div></div>{{/if}}


                        {{!-- BADGES --}}
                        {{#if orcid}}
                        <div style=\'display: inline-block; margin-top:.5em;\'>
                            <div style=\'display: inline;margin-right: .5em;\'><a href="{{orcidURL orcid}}" target="_blank"><img src="{{orcidBadgeURL orcid}}" /></a></div>
                        </div>
                        {{/if}}

                        {{#if doi}}
                        <div style=\'display: inline-block; margin-top:.5em;\'>
                            <div style=\'display: inline;margin-right: .5em;\'><a href="{{doiURL doi}}" target="_blank"><img src="{{doiBadgeURL doi}}" /></a></div>
                        </div>
                        {{/if}}

                        {{#if sponsorAwardId}}
                        <div style=\'display: inline-block; margin-top:.5em;\'>
                            <div style=\'display: inline;margin-right: .5em;\'><img src="{{awardBadgeURL sponsorAwardId}}" /></a></div>
                        </div>
                        {{/if}}

                        {{#ifCond membershipType "Member"}}
                        <div style="display: inline-block; margin-top:.5em;">
                            <div style="display: inline;margin-right: .5em;"><img src="{{badgeURL "UNAVCO" membershipType "red"}}" /></a></div>
                            </div>
                        {{/ifCond}}

                        {{#ifCond membershipType "Associate Member"}}
                        <div style="display: inline-block; margin-top:.5em;">
                            <div style="display: inline;margin-right: .5em;"><img src="{{badgeURL "UNAVCO" membershipType "66ccff"}}" /></a></div>
                            </div>
                        {{/ifCond}}



                        {{#if gridId}}
                        <div style="display: inline-block; margin-top:.5em;">
                            <div style="display: inline;margin-right: .5em;"><img src="{{badgeURL "GRID ID" gridId "blue"}}" /></a></div>
                        </div>
                        {{/if}}

                        {{#if isni}}
                        <div style="display: inline-block; margin-top:.5em;">
                            <div style="display: inline;margin-right: .5em;"><img src="{{badgeURL "ISNI" isni "lightgrey"}}" /></a></div>
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


        Handlebars.registerHelper("badgeURL", function(prefix, id, color) {
            var escapedID = encodeURIComponent(id).replace(/-/g, "--");
            return "https://img.shields.io/badge/" + prefix + "-" + escapedID + "-" + color + ".svg";
        });

        Handlebars.registerHelper("orcidBadgeURL", function(orcid) {
            var escapedORCID = encodeURIComponent(orcid).replace(/-/g, "--");
            return "https://img.shields.io/badge/ORCID-" + escapedORCID + "-green.svg";
        });

        Handlebars.registerHelper("awardBadgeURL", function(award) {
            var escapedAward = encodeURIComponent(award).replace(/-/g, "--");
            return "https://img.shields.io/badge/ID-" + escapedAward + "-blue.svg";
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

        Handlebars.registerHelper("capitalize", function(str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        });

        Handlebars.registerHelper("year", function(date) {
            return new Date(date).getUTCFullYear();
        });

        Handlebars.registerHelper("doiURL", function(doi) {
            return "https://doi.org/"+doi;
        });

        Handlebars.registerHelper("doiBadgeURL", function(doi) {
            var escapedDOI = encodeURIComponent(doi).replace(/-/g, "--");
            return "https://img.shields.io/badge/DOI-" + escapedDOI + "-blue.svg";
        });

        Handlebars.registerHelper("ifCond", function(v1, v2, options) {
            if(v1 === v2) {
              return options.fn(this);
            }
            return options.inverse(this);
        });

        var source = $("#person-template").html();
        var template = Handlebars.compile(source);

    </script>',
    '<script type="text/javascript">
        var query_in = decodeURIComponent((location.search.split("query_in=")[1] || "").split("&")[0].replace("+", "%20"));
    </script>',
    '<script type="text/javascript">

        jQuery(document).ready(function($) {
            $(".facet-view-simple").facetview({
                search_url: "${elasticsearch_base}/_search",
                page_size: 10,
                sort: [
                    {"_score" : {"order" : "desc"}},
                    {"name.sort" : {"order" : "asc"}}
                ],
                sharesave_link: false,
                search_button: true,
				        page_size_dropdown: true,
                default_freetext_fuzzify: "*",
                default_facet_operator: "AND",
                q: query_in,
                default_facet_order: "count",
                default_facet_size: 6,
                // search_fields_multi: ["*folded","_all"],
                controls: false,
				        pushstate: true,
                csv_export: true,
                facets: [
                    {"field": "_type", "display": "Limit to type", "open": true, "controls": false, "size" : 50},
                    // {"field": "organizations.organization.name.exact", "display": "Organization"},
                    // {"field": "researchArea.name.exact", "display": "Research area", "open": true, "controls": false},
					          // {"field": "expertiseArea.name.exact", "display": "Expertise area", "open": true, "controls": false},
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

<section id="menupage-intro" role="region">
<h2>${page.title}</h2>
<div style="clear:both"></div>

</section>

<div class="facet-view-simple"></div>
