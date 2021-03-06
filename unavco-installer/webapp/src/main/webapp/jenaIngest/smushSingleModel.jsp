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

    <h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Smush Resources</h2>

    <form action="ingest" method="get"i>
        <input type="hidden" name="action" value="smushSingleModel"/>
    <div class="form-group">
        <label for="propertyURI">URI of Property with which To Smush</label>
	      <input class="form-control" type="text" style="width:40%;" id="propertyURI" name="propertyURI"/>
    </div>

    <fieldset>
    <legend>Select Source Models</legend>
        <div class="form-group">
          <div class="checkbox">
              <label><input type="checkbox" name="sourceModelName" value="vitro:baseOntModel"/>webapp assertions</label>
          </div>
    	    <c:forEach var="modelName" items="${modelNames}">
            <div class="checkbox">
                <label><input type="checkbox" name="sourceModelName" value="${modelName}"/>${modelName}</label>
            </div>
    	    </c:forEach>
    </fieldset>

    <div class="form-group">
        <label for="destinationModelName">Select Destination Model</label>

    <select class="form-control" id="destinationModelName" name="destinationModelName">
        <option value="vitro:baseOntModel">webapp assertions</option>
        <c:forEach var="modelName" items="${modelNames}">
            <option value="${modelName}"/>${modelName}</option>
        </c:forEach>
    </select>
    </div>

    <input class="btn btn-success" id="submit" type="submit" value="Smush Resources"/>
