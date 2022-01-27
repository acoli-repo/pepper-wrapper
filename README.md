
# Pepper wrapper

A non-interactive command-line interface for [the Pepper converter suite](https://corpus-tools.org/pepper).
Requires Unix-style environment, tested with Ubuntu 20.04L

## Setup

Requirements: Java >=1.8, make, bash, Unix-style OS, write access to `/tmp`

Run

    $> make

Retrieves a stable 2021 Pepper installation and sample data

## Converting data

Example call:

	$> bash -e ./convert.sh PAULAImporter TextExporter pcc2_PAULA.zip samples

This will convert PAULA to plain text

synopsis:

     convert.sh IMPORTER EXPORTER SRC[1..n] TGT
	      IMPORTER importer (source format)
	      EXPORTER exporter (target format)
	      SRC      source file, directory or zip archive
	      TGT      target directory

with the following converters:

|	Format/Tool	|	`IMPORTER`	|	`EXPORTER`	|
|	---	|	---	|	---	|
|	Aldt	|	`AldtImporter`	|		|
|	[ANNIS](https://corpus-tools.org/annis/)	|		|	`ANNISExporter`	|
|	CoNLL (CoNLL-2012?)	|	`CoNLLCorefImporter`	|	`CoNLLCorefExporter`	|
|	CoNLL (CoNLL-X?, CoNLL-U?)	|	`CoNLLImporter`	|	`CoNLLExporter`	|
|	[Cora](https://github.com/comphist/cora)	|	`CoraXMLImporter`	|		|
|	GraphViz	|		|	`DOTExporter`	|
|	[EXMARaLDA](https://exmaralda.org/)	|	`EXMARaLDAImporter`	|	`EXMARaLDAExporter`	|
|	[ELAN](https://www.mpi.nl/corpus/html/elan/)	|	`ElanImporter`	|		|
|	[GATE](https://gate.ac.uk/)	|	`GateImporter`	|		|
|	GeTa	|	`GeTaImporter`	|		|
|	XML	|	`GenericXMLImporter`	|		|
|	[GrAF](https://www.anc.org/software/anc-tool/)	|	`GrAFImporter`	|		|
|	GraphAnno	|		|	`GraphAnnoExporter`	|
|	[MMAX2](http://mmax2.net/)	|	`MMAX2Importer`	|	`MMAX2Exporter`	|
|	[PAULA](https://github.com/korpling/paula-xml)	|	`PAULAImporter`	|	`PAULAExporter`	|
|	[Penn Treebank](https://catalog.ldc.upenn.edu/docs/LDC95T7/cl93.html)	|	`PTBImporter`	|	`PTBExporter`	|
|	RSD	|	`RSDImporter`	|		|
|	[RSTTool](http://www.wagsoft.com/RSTTool/)	|	`RSTImporter`	|		|
|	HTML (metadata)	|		|	`SaltInfoExporter`	|
|	[SaltXML](https://github.com/korpling/salt)	|	`SaltXMLImporter`	|	`SaltXMLExporter`	|
|	CSV	|	`SpreadsheetImporter`	|		|
|	[TCF](https://weblicht.sfs.uni-tuebingen.de/weblichtwiki/index.php/The_TCF_Format)	|	`TCFImporter`	|	`TCFExporter`	|
|	[TEI](https://tei-c.org/) (incomplete)	|	`TEIImporter`	|		|
|	txt	|	`TextImporter`	|	`TextExporter`	|
|	[TIGER-XML](https://www.ims.uni-stuttgart.de/documents/ressourcen/werkzeuge/tigersearch/doc/html/TigerXML.html)	|	`Tiger2Importer`	|		|
|	[Toolbox](https://software.sil.org/toolbox/)	|	`ToolboxImporter`	|		|
|	[TreeTagger](https://www.cis.uni-muenchen.de/~schmid/tools/TreeTagger/)	|	`TreetaggerImporter`	|	`TreetaggerExporter`	|
|	UAM	|	`UAMImporter`	|		|
|	TSV	|	`WebannoTSVImporter`	|		|
|	ad hoc	|	`WolofImporter`	|		|

Note that we extend the original Pepper with support for zip archives

## Docker version

For portability beyond Ubuntu 20.04, a `Dockerfile` is provided. However, note that this uses `bind`, so that external and internal paths needs to be distinguished.

Building

    $> docker build -f Dockerfile -t acoli/pepper-wrapper .

Converting `./pcc2_PAULA.zip` to `./tcf/`:

    $> docker run \
       --mount type=bind,source=`realpath .`,target=/source \
       --mount type=bind,source=`realpath ./tcf`,target=/target \
       acoli/pepper-wrapper \
       pepper-wrapper/convert.sh PaulaImporter TCFExporter source/pcc2_PAULA.zip target/

This is equivalent to

    $> bash -e ./convert.sh PaulaImporter TCFExporter ./pcc2_PAULA.zip ./tcf
