<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@taglib prefix="vitro" uri="/WEB-INF/tlds/VitroUtils.tld" %>
<%@page import="edu.cornell.mannlib.vitro.webapp.auth.permissions.SimplePermission" %>
<% request.setAttribute("requestedActions", SimplePermission.USE_ADVANCED_DATA_TOOLS_PAGES.ACTION); %>
<vitro:confirmAuthorization />

<div class="staticPageBackground">

<h2>Add or Remove RDF Data</h2>

<form action="uploadRDF" method="post"  enctype="multipart/form-data" >

<c:if test="${!empty param.errMsg}">
    <p><strong class="warning">${errMsg}</strong></p>
</c:if>
    <div class="form-group">
        <label for="rdfUrl">Enter Web-accessible URL of document containing RDF to add or remove:</label>
        <input name="rdfUrl" class="form-control" type="text" style="width:67%;" value="<c:out value='${param.rdfUrl}'/>"/></p>
    </div>

        <label for="rdfStream" class="btn btn-default btn-file">Or upload a file from your computer:
        <input type="file" name="rdfStream"/></label>

    <div class="radio">
        <label><input type="radio" name="mode" value="directAddABox" checked="checked"/>add instance data (supports large data files)</label>
    </div>
    <div class="radio">
        <label><input type="radio" name="mode" value="add"/>add mixed RDF (instances and/or ontology)</label>
    </div>
    <div class="radio">
        <label><input type="radio" name="mode" value="remove"/>remove mixed RDF (instances and/or ontology)</label>
    </div>

    <div class="form-group">
        <select class="form-control" name="language">
            	<option value="RDF/XML">RDF/XML</option>
            	<option value="N3">N3</option>
            	<option	value="N-TRIPLE">N-Triples</option>
                <option value="TTL">Turtle</option>
        </select>
    </div>
    <div class="checkbox">
        <label><input type="checkbox" name="makeClassgroups" value="true"/> create classgroups automatically</label>
    </div>

    <p><input class="btn btn-success" id="submit" type="submit" name="submit" value="submit"/></p>
</form>

</div>
