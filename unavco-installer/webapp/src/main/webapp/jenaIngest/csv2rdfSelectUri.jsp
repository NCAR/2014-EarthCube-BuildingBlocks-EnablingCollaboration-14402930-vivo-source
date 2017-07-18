<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="vitro" uri="/WEB-INF/tlds/VitroUtils.tld" %>

<%@ page import="org.apache.jena.ontology.Individual" %>
<%@ page import="org.apache.jena.ontology.OntModel" %>
<%@ page import="org.apache.jena.rdf.model.ModelMaker" %>
<%@ page import="org.apache.jena.shared.Lock" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map.Entry" %>

<%@page import="edu.cornell.mannlib.vitro.webapp.auth.permissions.SimplePermission" %>
<% request.setAttribute("requestedActions", SimplePermission.USE_ADVANCED_DATA_TOOLS_PAGES.ACTION); %>
<vitro:confirmAuthorization />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jenaIngest/renameNode.js"></script>
<script type="text/javascript">
function selectProperties(){
	document.getElementById("properties").disabled = false;
	document.getElementById("pattern").disabled = false;
}
function disableProperties(){
	document.getElementById("properties").disabled = true;
	document.getElementById("pattern").disabled = true;
}
</script>

    <h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Convert Blank Nodes to Named Resources</h2>

    <form id="takeuri" action="ingest" method="get">
        <input type="hidden" name="action" value="renameBNodesURISelect"/>

    <h3>Select URI prefix</h3>

	<div class="form-group">
	<label for="namespace">URIs will be constructed using the following base string:</label>
	<input class="form-control" id="namespace" type="text" name="namespaceEtcStr"/>
</div>

    <p>Each resource will be assigned a URI by taking the above string and
     adding either a random integer, or a string based on the value of one of the
     the properties of the resource</p>

		 <div class="radio">
   			<label><input type="radio" value="integer" name="concatenate" checked="checked" onclick="disableProperties()">Use random integer</label>
 		</div>
		<div class="radio">
    		<label><input type="radio" value="pattern" name="concatenate" onclick="selectProperties()">Use pattern based on values of </label>
		</div>


    <% Map<String,LinkedList<String>> propertyMap = (Map) request.getAttribute("propertyMap");
       Set<Entry<String,LinkedList<String>>> set = propertyMap.entrySet();
       Iterator<Entry<String,LinkedList<String>>> itr = set.iterator();
       Entry<String, LinkedList<String>> entry = null;
    %>

		<div class="form-group">
		    <select class="form-control" name="property" id="properties" disabled="disabled">
		    <% while(itr.hasNext()){%>

		    	<%entry = itr.next();
		    	Iterator<String> listItr = entry.getValue().iterator();
		    	%>
		    	<option value ="<%=entry.getKey() %>"><%=entry.getKey()%></option>
		    <%}
		    %>
		    </select>
		</div>
    <div class="form-group">
				<label for="pattern">Enter a pattern using $$$ as the placeholder for the value of the property selected above.
		    <p>For example, entering dept_$$$ might generate URIs with endings such as dept_Art or dept_Classics.</p></label>
		    <input class="form-control" id="pattern" disabled="disabled" type="text" name="pattern"/>
		</div>
    <input type="hidden" name="destinationModelName" value="${destinationModelName}"/>
    <input type="hidden" name="csv2rdf" value="${csv2rdf}"/>

    <c:forEach var="sourceModelValue" items="${sourceModel}">
        <input type="hidden" name="sourceModelName" value="${sourceModelValue}"/>
    </c:forEach>

    <p/>

    <input class="btn btn-success submit" type="submit" value="Convert CSV"/>

    </form>
