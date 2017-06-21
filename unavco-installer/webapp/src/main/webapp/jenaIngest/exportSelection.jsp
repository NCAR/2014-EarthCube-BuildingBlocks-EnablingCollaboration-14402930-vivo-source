<%-- $This file is distributed under the terms of the license in /doc/license.txt$ --%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="edu.cornell.mannlib.vitro.webapp.controller.VitroRequest"%>
<%@ page import="edu.cornell.mannlib.vitro.webapp.beans.Ontology"%>
<%@ page import="edu.cornell.mannlib.vitro.webapp.dao.OntologyDao"%>

<div class="staticPageBackground">

<h2>Export to RDF</h2>

<form action="" method="get">

  <div class="radio">
    <label><input type="radio" name="subgraph" checked="checked" value="full"/> Entire RDF model for the application (TBox and ABox, including application metadata)</label>
  </div>
  <div class="radio">
    <label><input type="radio" name="subgraph" value="tbox"/> Entire ontology (TBox) for the application</label>
  </div>
  <div class="radio">
    <label><input type="radio" name="subgraph" value="abox"/> All Instance data (ABox) for the application</label>
  </div>
    <%VitroRequest vreq = new VitroRequest(request);
    OntologyDao daoObj = vreq.getUnfilteredWebappDaoFactory().getOntologyDao();
    List ontologiesObj = daoObj.getAllOntologies();
    if(ontologiesObj !=null && ontologiesObj.size()>0){
    	Iterator ontItr = ontologiesObj.iterator();
    	while(ontItr.hasNext()){
    		Ontology ont = (Ontology) ontItr.next();%>
        <div class="radio">
          <label><input type="radio" name="subgraph" value=<%=ont.getURI()%>/> <%=ont.getName()%> (TBox)</label></div>
    	<%}}%>

  <hr/>
  <div class="radio">
    <label><input type="radio" name="assertedOrInferred" checked="checked" value="asserted"/> Export only asserted statements </label>
  </div>
  <div class="radio">
    <label><input type="radio" name="assertedOrInferred" value="inferred"/> Export only inferred statements </label>
  </div>
  <div class="radio">
    <label><input type="radio" name="assertedOrInferred" value="full"/> Export asserted and inferred statements together </label>
  </div>

<div class="form-group">
  <label for="format">Select format</label>
  <select class="form-control" id="format" name="format">
      <option value="RDF/XML">RDF/XML</option>
      <option value="RDF/XML-ABBREV">RDF/XML abbrev.</option>
      <option value="N3">N3</option>
      <option value="N-TRIPLE">N-Triples</option>
      <option value="TURTLE">Turtle</option>
  </select>
</div>

<input class="btn btn-success submit" type="submit" name="submit" value="Export"/>

</form>

</div>
