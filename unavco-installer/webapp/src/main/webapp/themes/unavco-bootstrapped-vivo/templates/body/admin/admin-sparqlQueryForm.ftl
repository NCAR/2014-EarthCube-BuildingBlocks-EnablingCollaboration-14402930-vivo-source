<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template that presents the SPARQL query form. -->
<#-- The normal method of adding stylesheets to the header isn't working here for some reason -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/yasqe/2.6.1/yasqe.min.css" />

<div id="content" class="sparqlform">
    <h2>SPARQL Query</h2>
    <form action='${submitUrl}' method="get">
      <div class="form-group">
        <label for="query-area"><h3>Query:</h3></label>
        <textarea name='query' rows='30' class="form-control" id="query-area">${sampleQuery}</textarea>
      </div>

        	 <h3>Format for SELECT and ASK query results:</h3>
        	 <label class="radio-inline"><input type='radio' name='resultFormat' value='text/plain' checked>RS_TEXT</label>
        	 <label class="radio-inline"><input type='radio' name='resultFormat' value='text/csv'>CSV</label>
        	 <label class="radio-inline"><input type='radio' name='resultFormat' value='text/tab-separated-values'>TSV</label>
        	 <label class="radio-inline"><input type='radio' name='resultFormat' value='application/sparql-results+xml'>RS_XML</label>
        	 <label class="radio-inline"><input type='radio' name='resultFormat' value='application/sparql-results+json'>RS_JSON</label>

        	 <h3>Format for CONSTRUCT and DESCRIBE query results:</h3>
        	 <label class="radio-inline"><input type='radio' name='rdfResultFormat' value='text/plain'>N-Triples</label>
        	 <label class="radio-inline"><input type='radio' name='rdfResultFormat' value='application/rdf+xml' checked>RDF/XML</label>
        	 <label class="radio-inline"><input type='radio' name='rdfResultFormat' value='text/n3'>N3</label>
        	 <label class="radio-inline"><input type='radio' name='rdfResultFormat' value='text/turtle'>Turtle</label>
        	 <label class="radio-inline"><input type='radio' name='rdfResultFormat' value='application/json'>JSON-LD</label>
<br><br>
        <input class="btn btn-success submit" type="submit" value="Run Query" />
    </form>
</div><!-- content -->

<#-- ${stylesheets.add('<link rel="stylesheet" href="//cdn.jsdelivr.net/yasqe/2.6.1/yasqe.min.css" />')} -->
${scripts.add('<script type="text/javascript" src="//cdn.jsdelivr.net/yasqe/2.6.1/yasqe.bundled.min.js"></script>',
'<script type="text/javascript" src="${urls.base}/js/sparql/init-yasqe.js"></script>')}
