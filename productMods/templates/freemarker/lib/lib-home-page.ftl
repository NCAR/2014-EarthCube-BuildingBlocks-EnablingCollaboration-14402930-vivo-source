<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Macros used to build the statistical information on the home page -->

<#-- Get the classgroups so they can be used to qualify searches -->
<#macro allClassGroupNames classGroups>
    <#list classGroups as group>
        <#-- Only display populated class groups -->
        <#if (group.individualCount > 0)>
            <li role="listitem"><a href="" title="${group.uri}">${group.displayName?capitalize}</a></li>
        </#if>
    </#list>
</#macro>

<#-- Renders the html for the faculty member section on the home page. -->
<#-- Works in conjunction with the homePageUtils.js file, which contains the ajax call. -->
<#macro facultyMbrHtml>
    <section id="home-faculty-mbrs" class="home-sections"  >
        <h4>${i18n().faculty_capitalized}</h4>
        <div id="tempSpacing">
            <span>${i18n().loading_faculty}&nbsp;&nbsp;&nbsp;
                <img  src="${urls.images}/indicatorWhite.gif">
            </span>
        </div>
        <div id="research-faculty-mbrs">
            <!-- populated via an ajax call -->
            <ul id="facultyThumbs">
            </ul>
        </div>
    </section>
</#macro>

<#-- We need the faculty count in order to randomly select 4 faculty using a search query -->
<#macro facultyMemberCount classGroups>
    <#assign foundClassGroup = false />
    <#list classGroups as group>
        <#if (group.individualCount > 0) && group.uri?contains("people") >
            <#list group.classes as class>
                <#if (class.uri?contains("FacultyMember")) >
                    <#assign foundClassGroup = true />
                    <#if (class.individualCount > 0) >
                        <script>var facultyMemberCount = ${class.individualCount?string?replace(",","")?replace(".","")};</script>
                    <#else>
                        <script>var facultyMemberCount = 0;</script>
                    </#if>
                </#if>
            </#list>
        </#if>
     </#list>
     <#if !foundClassGroup>
        <script>var facultyMemberCount = 0;</script>
    </#if>
</#macro>

<#-- builds the "stats" section of the home page, i.e., class group counts -->
<#macro allClassGroups classGroups>
    <#-- Loop through classGroups first so we can account for situations when all class groups are empty -->
    <#assign selected = 'class="selected" ' />
    <#assign classGroupList>
        <section id="home-stats" class="home-sections" >
            <h4>${i18n().statistics}</h4>
            <ul id="stats">
                <#assign groupCount = 1>
                <#list classGroups as group>
                    <#if (groupCount > 6) >
                        <#break/>
                    </#if>
                    <#-- Only display populated class groups -->
                    <#if (group.individualCount > 0)>
                        <#-- Catch the first populated class group. Will be used later as the default selected class group -->
                        <#if !firstPopulatedClassGroup??>
                            <#assign firstPopulatedClassGroup = group />
                        </#if>
                          <#if !group.uri?contains("equipment") && !group.uri?contains("course") && !group.uri?contains("activities")>
                            <li>
                                <a href="${urls.base}/${group.displayName}">
                                    <p  class="stats-count">
                                        <#if (group.individualCount > 10000) >
                                            <#assign overTen = group.individualCount/1000>
                                            ${overTen?round}<span>k</span>
                                        <#elseif (group.individualCount > 1000)>
                                            <#assign underTen = group.individualCount/1000>
                                            ${underTen?string("0.#")}<span>k</span>
                                        <#else>
                                            ${group.individualCount}<span>&nbsp;</span>
                                        </#if>
                                    </p>
                                    <p class="stats-type">${group.displayName?capitalize}</p>
                                </a>
                            </li>
                            <#assign groupCount = groupCount + 1>
                        </#if>
                    </#if>
                </#list>
            </ul>
        </section>
    </#assign>

    <#-- Display the class group browse only if we have at least one populated class group -->
    <#if firstPopulatedClassGroup??>
            ${classGroupList}
    <#else>
        <h3 id="noContentMsg">${i18n().no_content_create_groups_classes}</h3>
        
        <#if user.loggedIn>
            <#if user.hasSiteAdminAccess>
                <p>${i18n().you_can} <a href="${urls.siteAdmin}" title="${i18n().add_content_manage_site}">${i18n().add_content_manage_site}</a> ${i18n().from_site_admin_page}</p>
            </#if>
        <#else>
            <p>${i18n().please} <a href="${urls.login}" title="${i18n().login_to_manage_site}">${i18n().log_in}</a> ${i18n().to_manage_content}</p>
        </#if>
    </#if>
            
</#macro>

<#macro wordMap>
<section id="home-word-cloud" class="home-sections">
  <h4>Community Expertise and Research Areas</h4>
  <script>
  

  var word_list = [
  <#if wordCloudDG?has_content>
      <#list wordCloudDG as resultRow>
          <#assign uri = resultRow["theURI"] />
          <#assign label = resultRow["name"] />
          <#assign size = resultRow["size"] />
          {"text":"${label}","size":${size},"uri":"${uri?url}"}<#if (resultRow_has_next)>,</#if>
      </#list>
  </#if>
  ];

  var urlsBase = "${urls.base}";
  </script>



  <div id="wordMap" style="margin-top:15px">

  </div>

</section>
</#macro>

<#-- Renders the html for the academic departments section on the home page. -->
<#-- Works in conjunction with the homePageUtils.js file -->
<#macro academicDeptsHtml>
    <section id="home-academic-depts" class="home-sections">
        <h4>Members</h4>
        <div id="academic-depts">
        </div>
    </section>        
</#macro>



<#-- Renders the html for the consortium members section on the home page. -->
<#-- Works in conjunction with the homePageUtils.js file -->
<#macro membersHtml>
    <section id="home-members" class="home-sections">
        <h4>Consortium Members</h4>
        <div id="members">
        </div>
    </section>
</#macro>

<#-- builds the "consortium members" box on the home page -->
<#macro listMembers>
<script>
var members = [
<#if membersDG?has_content>
    <#list membersDG as resultRow>
        <#assign uri = resultRow["theURI"] />
        <#assign label = resultRow["name"] />
        <#assign type = resultRow["memberType"] />
        <#assign repURI = resultRow["rep"] />
        <#if type?contains("Associate")>
            <#assign type = "Associate Member" />
            <#else><#assign type = "Member" />
        </#if>    
        <#assign repName = resultRow["repName"] />
        {"uri": "${uri?url}", "name": "${label}", "repURI": "${repURI}", "repName": "${repName}", "type": "${type}"}<#if (resultRow_has_next)>,</#if>
    </#list>
</#if>
];
var urlsBase = "${urls.base}";
</script>
</#macro>

<#-- builds the "associate members" box on the home page -->
<#macro listAssociateMembers>
<script>
var associateMembers = [
<#if assocMembersDG?has_content>
    <#list assocMembersDG as resultRow>
        <#assign uri = resultRow["theURI"] />
        <#assign label = resultRow["name"] />
        {"uri": "${uri?url}", "name": "${label}"}<#if (resultRow_has_next)>,</#if>
    </#list>
</#if>
];
var urlsBase = "${urls.base}";
</script>
</#macro>


<#-- renders the "geographic focus" section on the home page. works in      -->
<#-- conjunction with the homePageMaps.js and latLongJson.js files, as well -->
<#-- as the leaflet javascript library.                                     -->
<#macro geographicFocusHtml>
    <section id="home-geo-focus" class="home-sections">
        <h4>${i18n().geographic_focus}</h4>
        <#-- map controls allow toggling between multiple map types: e.g., global, country, state/province. -->
        <#-- VIVO default is for only a global display, though the javascript exists to support the other   -->
        <#-- types. See map documentation for additional information on how to implement additional types.  -->
        <#--
            <div id="mapControls">
                <a id="globalLink" class="selected" href="javascript:">${i18n().global_research}</a>&nbsp;|&nbsp;
                <a id="countryLink" href="javascript:">${i18n().country_wide_research}</a>&nbsp;|&nbsp;
                <a id="localLink" href="javascript:">${i18n().local_research}</a>  
            </div>  
        -->
        <div id="researcherTotal"></div>
        <div id="timeIndicatorGeo">
            <span>${i18n().loading_map_information}&nbsp;&nbsp;&nbsp;
                <img  src="${urls.images}/indicatorWhite.gif">
            </span>
        </div>
        <div id="mapGlobal" class="mapArea"></div>
       <#--  
            <div id="mapCountry" class="mapArea"></div>
            <div id="mapLocal" class="mapArea"></div> 
       -->
    </section>
</#macro>
