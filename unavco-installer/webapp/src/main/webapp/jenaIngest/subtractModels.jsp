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

    <h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Subtract One Model from Another</h2>

    <form action="ingest" method="get"i>
        <input type="hidden" name="action" value="subtractModels"/>

    <select class="form-control" name="modela">
         <option value="vitro:baseOntModel">webapp assertions</option>
         <c:forEach var="modelName" items="${modelNames}">
             <option value="${modelName}">${modelName}</option>
         </c:forEach>
    </select>
    <p>model to be subtracted from</p>

    <select class="form-control" name="modelb">
         <option value="vitro:baseOntModel">webapp assertions</option>
         <c:forEach var="modelName" items="${modelNames}">
             <option value="${modelName}">${modelName}</option>
         </c:forEach>
	</select>
    <p>model to subtract</p>

    <select class="form-control" name="destinationModelName">
         <option value="vitro:baseOntModel">webapp assertions</option>
         <c:forEach var="modelName" items="${modelNames}">
             <option value="${modelName}">${modelName}</option>
         </c:forEach>
	</select>
    <p>model in which difference should be saved</p>

    <input class="btn btn-success" id="submit" type="submit" value="Subtract models"/>
