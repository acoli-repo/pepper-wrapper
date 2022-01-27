# Pepper wrapper

A non-interactive command-line interface for [the Pepper converter suite](https://corpus-tools.org/pepper).
Requires Unix-style environment, tested with Ubuntu 20.04L

## Setup

Requirements: Java >=1.8, make, bash, Unix-style OS, write access to `/tmp`

Run

  $> make

Retrieves a stable 2021 Pepper installation and sample data

## Converting data

synopsis:

     ./convert.sh IMPORTER EXPORTER SRC[1..n] TGT
              ./convert.sh -help
      -help    list all installed importers and exporters (slow)
      IMPORTER importer (source format)
      EXPORTER exporter (target format)
      SRC      source file, directory or zip archive
      TGT      target directory
    configure and execute non-interactive Pepper conversion

with the following converters:

|	Format/Tool	|	Importer	|	Exporter	|, |	---	|	---	|	---	|
|	Aldt	|	AldtImporter	|		|
|	[ANNIS](https://corpus-tools.org/annis/)	|		|	ANNISExporter	|
|	CoNLL	|	CoNLLCorefImporter	|	CoNLLCorefExporter	|
|	CoNLL	|	CoNLLImporter	|	CoNLLExporter	|
|	[Cora](https://github.com/comphist/cora)	|	CoraXMLImporter	|		|
|	GraphViz	|		|	DOTExporter	|
|	[EXMARaLDA](https://exmaralda.org/)	|	EXMARaLDAImporter	|	EXMARaLDAExporter	|
|	[ELAN](https://www.mpi.nl/corpus/html/elan/)	|	ElanImporter	|		|
|	[GATE](https://gate.ac.uk/)	|	GateImporter	|		|
|	GeTa	|	GeTaImporter	|		|
|	XML	|	GenericXMLImporter	|		|
|	[GrAF](https://www.anc.org/software/anc-tool/)	|	GrAFImporter	|		|
|	GraphAnno	|		|	GraphAnnoExporter	|
|	[MMAX2](http://mmax2.net/)	|	MMAX2Importer	|	MMAX2Exporter	|
|	[PAULA](https://github.com/korpling/paula-xml)	|	PAULAImporter	|	PAULAExporter	|
|	[Penn Treebank](https://catalog.ldc.upenn.edu/docs/LDC95T7/cl93.html)	|	PTBImporter	|	PTBExporter	|
|	RSD	|	RSDImporter	|		|
|	[RSTTool](http://www.wagsoft.com/RSTTool/)	|	RSTImporter	|		|
|	HTML (metadata)	|		|	SaltInfoExporter	|
|	[SaltXML](https://github.com/korpling/salt)	|	SaltXMLImporter	|	SaltXMLExporter	|
|	CSV	|	SpreadsheetImporter	|		|
|	[TCF](https://weblicht.sfs.uni-tuebingen.de/weblichtwiki/index.php/The_TCF_Format)	|	TCFImporter	|	TCFExporter	|
|	[TEI](https://tei-c.org/) (incomplete)	|	TEIImporter	|		|
|	txt	|	TextImporter	|	TextExporter	|
|	[TIGER-XML](https://www.ims.uni-stuttgart.de/documents/ressourcen/werkzeuge/tigersearch/doc/html/TigerXML.html)	|	Tiger2Importer	|		|
|	[Toolbox](https://software.sil.org/toolbox/)	|	ToolboxImporter	|		|
|	[TreeTagger](https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/)	|	TreetaggerImporter	|	TreetaggerExporter	|
|	UAM	|	UAMImporter	|		|
|	TSV	|	WebannoTSVImporter	|		|
|	ad hoc	|	WolofImporter	|		|

Note that we extend the original Pepper with support for zip archives
