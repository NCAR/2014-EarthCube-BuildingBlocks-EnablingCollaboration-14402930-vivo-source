<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<%@ page import="org.apache.jena.rdf.model.ModelMaker" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib prefix="vitro" uri="/WEB-INF/tlds/VitroUtils.tld" %>
<%@page import="edu.cornell.mannlib.vitro.webapp.auth.permissions.SimplePermission" %>
<% request.setAttribute("requestedActions", SimplePermission.USE_ADVANCED_DATA_TOOLS_PAGES.ACTION); %>
<vitro:confirmAuthorization />

    <h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Load XML and convert to RDF</h2>

    <form action="jenaXmlFileUpload" method="post" enctype="multipart/form-data">

    <div class="form-group">
        <label for="xmlfile">XML file</label>
        <input type="file" id="xmlfile" name="xmlfile"/>
    </div>


    <div class="form-group">
      <label for="targetModel">Destination model</label>
      	<select class="form-control" name="targetModel">
            <option value="vitro:baseOntModel">webapp assertions</option>
            <c:forEach var="modelName" items="${modelNames}">
                <option value="${modelName}">${modelName}</option>
            </c:forEach>
        </select>
    </div>

        <input class="btn btn-success" id="submit" type="submit" name="submit" value="upload XML and convert to RDF"/>
    </form>
