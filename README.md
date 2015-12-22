#UNAVCO VIVO project template
This is a git repository template for working with and customizing [VIVO](http://vivoweb.org/).  It uses the [three tiered build approach](https://wiki.duraspace.org/display/VIVO/Building+VIVO+in+3+tiers) documented by the VIVO project.  The project source files (VIVO and Vitro) are tracked using [Git Submodules](http://git-scm.com/book/en/Git-Tools-Submodules).

For a more detailed explanation of setting up the VIVO environment, consult the
[VIVO version 1.8.1 installation
instructions](https://wiki.duraspace.org/display/VIVO/Installing+VIVO+release+1.8.1).

Building VIVO from this template will add UNAVCO-specific customizations. 
Customizations include:
- Addition of Magnific lightbox for linked thumbnails (required updating jQuery to 1.7+)
- Removal of Sparkline (publication) graphs from a person's page
- Removal of references to VIVO's old browse page
- Adjustments to statistics displayed on home page
- Addition of a word cloud showing expertise and research areas
- Addition of common nicknames to Solr's synonym file
- Support for UNAVCO's expanded ontology
	- Display a map on a GPS station's page
	- Display expertise on a Person's page
	- Swap list of departments on home page for member institutions

##Building the application
The VIVO project has moved to using Apache Maven. To build the project, follow these instructions (modified from Ted Lawless' template, see link below):
   
	git clone https://github.com/NCAR/2014-EarthCube-BuildingBlocks-EnablingCollaboration-14402930-vivo-source.git vivo-source
    cd vivo-source
    git submodule init
	
	#Pull in VIVO and Vitro
	
	git submodule update
	
	#Check out a Maven-enabled version of VIVO and Vitro
	
	cd Vitro
	git checkout develop
	cd ../VIVO
	git checkout develop
	
	#Copy default-settings.xml
	
	cp installer/default-settings.xml installer/custom-settings.xml
	
	#Using your editor of choice, change tomcat-dir to the correct path and immediately after add the following (minus #, of course):
	#<vivo-installer-dir>../unavco-installer</vivo-installer-dir>
	
	nano installer/custom-settings.xml
	
	#Build and deploy
	
	mvn install -s installer/custom-settings.xml

Before you start Tomcat, be sure to edit runtime.properties and applicationSetup.n3 (if necessary) in the vivo-dir directory you specified in custom-settings.xml.


##UNAVCO-specific notes
UNAVCO uses an expanded ontology to capture geodesy-related concepts. The local ontology is included as earthcollab.n3, but this will change when a permanent namespace for the ontology is established. One extension is the 'Station' concept. Here is RDF for the station concept:

    @prefix ec:    <http://vivo.unavco.org/vivo/ontology/vlocal#> .
    @prefix rdfs:  <http://www.w3.org/2000/01/rdf-schema#> .
    @prefix obo:   <http://purl.obolibrary.org/obo/> .
    @prefix owl:   <http://www.w3.org/2002/07/owl#> .
    @prefix wgs84: <http://www.w3.org/2003/01/geo/wgs84_pos#> .
    @prefix vitro: <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> .
    
    ec:Station  a                     owl:Class ;
        rdfs:label                    "Station"@en-US ;
        rdfs:subClassOf               obo:BFO_0000029 , wgs84:SpatialThing ;
        vitro:hiddenFromDisplayBelowRoleLevelAnnot
                <http://vitro.mannlib.cornell.edu/ns/vitro/role#public> ;
        vitro:hiddenFromPublishBelowRoleLevelAnnot
                <http://vitro.mannlib.cornell.edu/ns/vitro/role#public> ;
        vitro:inClassGroup            <http://vivoweb.org/ontology#vitroClassGrouplocations> ;
        vitro:prohibitedFromUpdateBelowRoleLevelAnnot
                <http://vitro.mannlib.cornell.edu/ns/vitro/role#public> .


and a little more RDF to tell VIVO to use a custom template that adds a map to the station's page:

    @prefix ec:    <http://vivo.unavco.org/vivo/ontology/vlocal#> .
    @prefix vitro:   <http://vitro.mannlib.cornell.edu/ns/vitro/0.7#> .
    @prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .
     
    ec:Station
      vitro:customDisplayViewAnnot
              "individual--ec-station.ftl"^^xsd:string .

Instructions on where to put that RDF are at https://wiki.duraspace.org/display/VIVO/Class-specific+templates+for+profile+pages. The map will only show up if a station has wgs84:lat and wgs84:long attributes. 

Because some of the UNAVCO-specific modifications are baked into the template, blindly cloning this repository and loading in your data probably won't yield ideal results. Feel free to leave a comment on the issue tracker (https://github.com/NCAR/2014-EarthCube-BuildingBlocks-EnablingCollaboration-14402930-vivo-source/issues).

##For more information on how to set up the three-tiered build
The original three-tiered build template is available here: https://github.com/lawlesst/vivo-project-template
