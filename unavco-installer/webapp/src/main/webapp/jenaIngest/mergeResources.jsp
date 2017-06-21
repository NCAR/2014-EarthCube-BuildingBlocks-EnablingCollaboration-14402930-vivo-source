<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<%@ page import="org.apache.jena.rdf.model.ModelMaker"%>
<%@ page import="org.apache.jena.rdf.model.Model"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="vitro" uri="/WEB-INF/tlds/VitroUtils.tld" %>
<%@page import="edu.cornell.mannlib.vitro.webapp.auth.permissions.SimplePermission" %>
<% request.setAttribute("requestedActions", SimplePermission.USE_ADVANCED_DATA_TOOLS_PAGES.ACTION); %>
<vitro:confirmAuthorization />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jenaIngest/ingestUtils.js"></script>

<h2><a class="ingestMenu" href="ingest">Ingest Menu</a> > Merge Resources</h2>

<p>This tool allows two resources with different URIs to be collapsed into a
   single URI. Any statements using the "duplicate resource URI" will be
   rewritten using the "primary resource URI."  If there are multiple
   statements for a property that can have only a single value, the extra
   statements will be retracted from the model and offered for download.</p>
<p>This tool operates on the main web application model only, not on any
   of the additional Jena models.</p>

<form class="form-horizontal" id="takeuri" action="ingest" method="get">
    <input type="hidden" name="action" value="mergeResources"/>
    <div class="form-group">
        <label class="control-label col-sm-3" for="email">Primary resource URI</label>
        <div class="col-sm-9">
            <input class="form-control" id="uri1" type="text" size="52" name="uri1"/>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-3" for="email">Duplicate resource URI</label>
        <div class="col-sm-9">
            <input class="form-control" id="uri2" type="text" size="52" name="uri2"/>
        </div>
    </div>

    <div class="form-group"><div class="col-sm-3"></div>
    <div class="checkbox col-sm-9">
        <label><input type="checkbox" name="usePrimaryLabelOnly" value="Use Primary Label Only">Retain rdfs:labels only from Primary Resource</label>
    </div>
    </div>
    <input class="btn btn-success submit" type="submit" name="submit" value="Merge resources" /></p>
</form>
