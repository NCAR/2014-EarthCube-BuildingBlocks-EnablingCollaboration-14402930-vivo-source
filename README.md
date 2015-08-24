#UNAVCO VIVO project template
This is a git repository template for working with and customizing [VIVO](http://vivoweb.org/).  It uses the [three tiered build approach](https://wiki.duraspace.org/display/VIVO/Building+VIVO+in+3+tiers) documented by the VIVO project.  The project source files (VIVO and Vitro) are tracked using [Git Submodules](http://git-scm.com/book/en/Git-Tools-Submodules).

For a more detailed explanation of setting up the VIVO environment, consult the
[VIVO version 1.8 installation
instructions](https://wiki.duraspace.org/display/VIVO/Installing+VIVO+release+1.8).

Building VIVO from this template will add UNAVCO-specific customizations. The build script template is a (slightly) modified version of the template provided by Ted Lawless (https://github.com/lawlesst/vivo-project-template).

##UNAVCO-specific notes
UNAVCO uses an expanded ontology to capture geodesy-related concepts. As of now, the ontology is not included, pending a namespace. One extension is the 'Station' concept. Here is RDF for the station concept:

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

##Checking out the project and building VIVO in three tiers

###VIVO 1.8
~~~

    git clone https://github.com/lawlesst/vivo-project-template.git vivo
    cd vivo
    git submodule init

#Pull in VIVO and Vitro.  This will take a few minutes.

    git submodule update

#Check out specific versions of VIVO and Vitro

    cd VIVO
    git checkout maint-rel-1.8
    cd ../Vitro
    git checkout maint-rel-1.8

#Change back to vivo main directory

    cd ..

#Copy default build.properties, runtime.properties, and applicationSetup.n3

    cp example.build.properties build.properties
    cp example.runtime.properties runtime.properties
    cp config/example.applicationSetup.n3 config/applicationSetup.n3

#Adjust build, runtime, and applicationSetup properties
#Create the vivo data directory specified in build.properties if it doesn't exist. Eg:

    mkdir -p /usr/local/vivo/data/config
    cp runtime.properties /usr/local/vivo/data
    cp config/applicationSetup.n3 /usr/local/vivo/data/config

#Build and deploy VIVO

    ant all

~~~

###VIVO development
~~~
$ git clone https://github.com/lawlesst/vivo-project-template.git vivo
$ cd vivo
$ git submodule init
#Pull in VIVO and Vitro.  This will take a few minutes.
$ git submodule update
#Check out specific versions of VIVO and Vitro
$cd VIVO
$git checkout develop
$cd ../Vitro
$git checkout develop
#Change back to vivo main directory
$cd ..
#Copy default deploy.properties and edit
$cp default.build.properties build.properties
$cp default.runtime.properties runtime.properties
#Adjust build and runtime properties
#Create the data directory specified in build.properties if it doesn't exist.
#E.g. $mkdir -p /usr/local/vivo/data
$cp runtime.properties /usr/local/vivo/data
#Build and deploy VIVO
$ ant all
~~~

###VIVO 1.7
~~~
$ git clone https://github.com/lawlesst/vivo-project-template.git vivo
$ cd vivo
$ git submodule init
#Pull in VIVO and Vitro.  This will take a few minutes.
$ git submodule update
#Check out specific versions of VIVO and Vitro
$cd VIVO
$git checkout maint-rel-1.7
$cd ../Vitro
$git checkout maint-rel-1.7
#Change back to vivo main directory
$cd ..
#Copy default deploy.properties and edit
$cp default.build.properties build.properties
$cp default.runtime.properties runtime.properties
#Adjust build and runtime properties
#Create the data directory specified in build.properties if it doesn't exist.
#E.g. $mkdir -p /usr/local/vivo/data
$cp runtime.properties /usr/local/vivo/data
#Build and deploy VIVO
$ ant all
~~~

##Benefits to this approach
 * local changes are separated from core code making upgrades easier.
 * using Git you can checkout any tagged release, build it with your local changes, and test it out.
 * using the steps above, you can quickly deploy VIVO to another machine.
 * you can use Git features, like [cherry-pick](http://www.vogella.com/articles/Git/article.html#cherrypick), to select bug fixes or enhancements that are not yet in a VIVO release and incorporate them into your implementation.
 * even if you plan on making few modifications, this can be a convenient and efficient way to manage your custom theme.

##Questions or comments
[Open an issue](https://github.com/lawlesst/vivo-project-template/issues) via the issue tracker.
