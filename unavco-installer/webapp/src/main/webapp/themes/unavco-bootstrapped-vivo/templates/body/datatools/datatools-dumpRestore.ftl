<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<style media="screen" type="text/css">
p.explain {
  font-style: italic;
  margin-left: 5em;
}
table.choices td {
  padding-left: 2em;
  padding-right: 2em;
}
</style>

<h2>Dump or Restore the knowledge base</h2>

<p class="explain">
    <b>Content models</b> hold the data that VIVO contains and operates on.
    This includes the ABox and the TBox, instances and ontologies, assertions and inferences.
</p>
<p class="explain">
    <b>Configuration models</b> hold the data that controls VIVO,
    including display options, privacy restrictions, and user accounts.
</p>

<hr>

<h3>Dump</h3>

<p class="explain">
    Dumping the content models make take several minutes, and may produce large files.
    For example, dumping a fully populated VIVO instance may take 20 minutes and produce a file of 3 gigabytes.
</p>

<form class="form-inline" action="${selectUrl}" method="get">
  <div class="form-group">
      <label for="which">Select models</label>
      <select class="form-control" id="which" name="which">
          <option value="CONFIGURATION">Configuration models</option>
          <option value="CONTENT">Content models</option>
      </select>
      <input class="btn btn-warning" type="submit" value="Dump" />
  </div>
</form>

<hr>

<h3>Restore</h3>

<p class="explain">
    The restore process is additive: it will not delete existing triples.
</p>
<p class="explain">
    Choosing to purge large models can result in an OutOfMemory error.
    It is better to start with a small or empty knowledge base.
</p>
<p class="explain">
    After restoring, it is not necessary to rebuild the search index, or re-inference the data.
</p>

<#if tripleCount?? >
    <section class="restore-feedback">
        <p>Loaded ${tripleCount} triples</p>
    </section>
</#if>

<form action="${restoreUrl}" enctype="multipart/form-data" method="post">
    <div class="form-group">
        <label for="which">Select models</label>
        <select class="form-control" id="which" name="which">
            <option value="CONFIGURATION">Configuration models</option>
            <option value="CONTENT">Content models</option>
        </select>
    </div>

    <div class="form-group">
        <label for="sourceFile">Select a file to restore from (N-Quads format)</label>
        <input type="file" id="sourceFile" name="sourceFile" size="60"/>
    </div>

    <div class="checkbox">
        <label for="purge"><input type="checkbox" value="purge" id="purge" name="purge" />Purge the models before restoring.</label>
    </div>

    <input class="btn btn-success" type="submit" value="Restore" />

</form>
