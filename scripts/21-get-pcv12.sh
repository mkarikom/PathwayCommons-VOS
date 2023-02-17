#!/bin/bash 

cd data

# download the PC v12 dump
wget --no-clobber --execute="robots = off" https://www.pathwaycommons.org/archives/PC2/v12/PathwayCommons12.All.BIOPAX.owl.gz
