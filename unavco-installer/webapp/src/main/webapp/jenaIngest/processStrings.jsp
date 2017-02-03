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

    <h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Process Property Value Strings</h2>

    <form action="ingest" method="get"i>
        <input type="hidden" name="action" value="processStrings"/>

    <div class="form-group">
        <label for="className">String processor class</label>
          <input class="form-control" id="className" type="text" name="className"/>
    </div>

    <div class="form-group">
        <label for="methodName">String processor method</label>
        <input class="form-control" id="methodName" type="text" name="methodName"/>
    </div>

    <div class="form-group">
        <label for="propertyName">Property URI</label>
        <input class="form-control" id="propertyName" type="text" name="propertyName"/>
    </div>

    <div class="form-group">
        <label for="newPropertyName">New Property URI</label>
        <input class="form-control" id="newPropertyName" type="text" name="newPropertyName"/>
    </div>

    <div class="form-group">
        <label for="destinationModelName">model to use</label>
        <select class="form-control" id="destinationModelName" name="destinationModelName">
        <c:forEach var="modelName" items="${modelName}">
            <option value="${modelName}"/>${modelName}</option>
        </c:forEach>
        </select>
        <div class="checkbox">
          <label><input type="checkbox" name="processModel" value="TRUE"/> apply changes directly to this model</label>
    </div>

    <div class="form-group">
        <label for="additionsModel">model in which to save added statements</label>
        <select class="form-control" name="additionsModel">
    		<option value="">none</option>
    		<forEach var="modelName" items="${modelNames}">
                <option value="${modelName}">${modelName}</option>
            </forEach>
    	  </select>
    </div>

    <div class="form-group">
        <label for="retractionsModel">model in which to save retracted statements</label>
          <select name="retractionsModel">
      		<option value="">none</option>
      		<c:forEach var="modelName" items="${modelNames}">
                  <option value="${modelName}">${modelName}</option>
              </c:forEach>
      	</select>
    </div>

    <input class="btn btn-success submit" type="submit" value="Process property values"/>
