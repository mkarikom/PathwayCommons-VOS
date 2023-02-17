#!/bin/bash 

cd /opt/virtuoso-opensource/vad

# download the rdf_mappers vad
wget --no-clobber --execute="robots = off" http://download3.openlinksw.com/uda/vad-vos-packages/7.2/rdf_mappers_dav.vad

# download the facet browser vad
wget --no-clobber --execute="robots = off" http://download3.openlinksw.com/uda/vad-vos-packages/7.2/fct_dav.vad

# download the demo database
wget --no-clobber --execute="robots = off" http://download3.openlinksw.com/uda/vad-vos-packages/7.2/demo_dav.vad