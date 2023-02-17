# PathwayCommons v12 on Virtuoso 7

This repository launches a VOS server and populates it with the PathwayCommons (v12) dump as well as the current NextProt release.  

## Installation (Linux):
1. Edit `docker-compose.yml` with your system parameters.  Users should pay special attention to the following:
    * Memory usage settings defined in `environment:VIRT_Parameters_*`.  Consult the [VOS Performance Tuning](https://vos.openlinksw.com/owiki/wiki/VOS/VirtRDFPerformanceTuning) documentation for more information. 
    * Ensure that `container_name:` is unique, to avoid conflicts.
    * Ensure that `ports:` are unused and that downstream clients are pointed correctly.
2. Open a terminal inside this directory and run `docker-compose up -d`:
    * Ensure that `<user>` has permission to run docker containers or has `sudo` access.

### RDF Compliance:
* [SPARQL 1.1](https://www.w3.org/TR/sparql11-query/) inference is supported for all prefixes via the [Mapping Pipeline](https://docs.openlinksw.com/virtuoso/virtuosospongerworkpr/) on the rdf_mappers.vad extension.

### Description of pre-loading scripts (`scripts/`):
Scripts are loaded in alphabetical order, they are informally grouped by numeric prefixes.  
1. `01-get-vad.sh`: fetches http-accessible VAD packages
    * Additional VAD packages are described in VOS [VAD Packages](https://vos.openlinksw.com/owiki/wiki/VOS/VOSDownload#VAD%20Packages)
2. `02-vad-install.sql`: call `vad_install` on the downloaded packages
    * Note that [Virtuoso Conductor](http://demo.openlinksw.com/conductor/) is automatically installed and not explicitly listed here.
3. `11-bulkload-biopax.sql`: download and BioPax schema from [biopax.org](http://www.biopax.org/release) and load the RDF/XML file (`biopax-level3.owl`) into *target graph* `http://www.biopax.org/release/biopax-level3.owl`
4. `21-get-pcv12.sh`: download the PC v12 RDF dump (`PathwayCommons12.All.BIOPAX.owl.gz`) from [PathwayCommons.org](https://www.pathwaycommons.org/)
5. `22-bulkload-pcv12.sql`: call the RDF Bulk Loader on the previously-downloaded RDF dump
    * [Bulk loading](https://vos.openlinksw.com/owiki/wiki/VOS/VirtBulkRDFLoader) is heavily dependent on the memory performance parameters defined above.

### Optional pre-loading scripts (remove the *.norun suffix to enable):
1. `31-get-nextprot.sh.norun`: download the RDF dump of the [current NextProt release](https://download.nextprot.org/pub/current_release/rdf/ttl/) from [nextprot.org](https://download.nextprot.org)
2. `32-bulkload-nextprot.sql.norun`: call the RDF Bulk loader on the RDF dump
