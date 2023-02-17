--
--  Add the gzipped dumps
--
ld_dir_all ('data', '*.owl.gz', 'http://pathwaycommons.org/pc12');
--
--  run rdf bulk loader
--
rdf_loader_run ();