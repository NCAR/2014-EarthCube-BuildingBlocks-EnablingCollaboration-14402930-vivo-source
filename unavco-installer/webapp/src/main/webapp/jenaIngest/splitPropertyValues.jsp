<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<%@ page import="org.apache.jena.ontology.Individual" %>
<%@ page import="org.apache.jena.ontology.OntModel" %>
<%@ page import="org.apache.jena.rdf.model.ModelMaker" %>
<%@ page import="org.apache.jena.shared.Lock" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>

<%@taglib prefix="vitro" uri="/WEB-INF/tlds/VitroUtils.tld" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="edu.cornell.mannlib.vitro.webapp.auth.permissions.SimplePermission" %>
<% request.setAttribute("requestedActions", SimplePermission.USE_ADVANCED_DATA_TOOLS_PAGES.ACTION); %>
<vitro:confirmAuthorization />

    <h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Split Property Value Strings into Multiple Property Values</h2>

    <form action="ingest" method="get">
        <input type="hidden" name="action" value="splitPropertyValues"/>
    <h3>Select Source Models</h3>
      <div class="checkbox"><label><input type="checkbox" name="sourceModelName" value="vitro:jenaOntModel"/>webapp model</label></div>
		  <div class="checkbox"><label><input type="checkbox" name="sourceModelName" value="vitro:baseOntModel"/>webapp assertions</label></div>
          <c:forEach var="modelName" items="${modelNames}">
              <div class="checkbox"><label> <input type="checkbox" name="sourceModelName" value="${modelName}"/>${modelName}</label></div>
          </c:forEach>
    </ul>

    <div class="form-group">
        <label for="propertyURI">Property URI for which Values Should Be Split</label>
	      <input class="form-control" type="text" id="propertyURI" name="propertyURI"/>
    </div>

    <div class="form-group">
        <label for="splitRegex">Regex Pattern on which To Split</label>
	       <input class="form-control" type="text" id="splitRegex" name="splitRegex"/>
    </div>

    <div class="form-group">
        <label for="newPropertyURI">Property URI To Be Used with the Newly-Split Values</label>
	      <input class="form-control" type="text" id="newPropertyURI" name="newPropertyURI"/>
    </div>

      <div class="checkbox">
	       <label><input type="checkbox" name="trim" value="true"/> trim bordering whitespace</label>
      </div>

    <h3>Select Destination Model</h3>

    <div class="form-group">
        <select class="form-control" name="destinationModelName">
            <c:forEach var="modelName" items="${modelNames}">
                <option value="${modelName}"/>${modelName}</option>
            </c:forEach>
        </select>
    </div>

    <input class="btn btn-success" id="submit" type="submit" value="Split Values"/>
