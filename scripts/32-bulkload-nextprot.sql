--
--  Add the gzipped dumps
--
ld_dir_all ('data', '*.ttl.gz', 'http://nextprot.org/rdf');
--
--  run rdf bulk loader
--
rdf_loader_run ();