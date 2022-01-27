#!/bin/bash
# given the arguments, create a configuration file and execute it

#
# init
#########

MYHOME=`dirname $0`
PEPPER=$MYHOME/pepper
pepper=./pepper.sh
if [ ! -e $PEPPER/$pepper ]; then cd $MYHOME; make; fi

#
# main routine
#################

function run_pepper {
  importer=$1
  shift

  exporter=$1
  shift

  tgt=${!#}
  tgt=`realpath $tgt`

  for src in $@; do \
    if [ -e $src ]; then \
      src=`realpath $src`; \
    fi;\
    if [ $src != $tgt ]; then \
      echo $importer $exporter $src $tgt;\

      tmp=/tmp/`basename $src`;
      while [ -e $tmp ]; do
        tmp=$tmp.`ls $tmp* | wc -l`;
      done;
      if echo $src | egrep -i '.*zip$'; then \
        unzip $src -d $tmp;
      else
        tmp=$src;
      fi

      conf=/tmp/`basename $src`.conf;
      while [ -e $conf ]; do
        conf=$conf.`ls $conf* | wc -l`;
      done;
      echo '<?xml version="1.0" encoding="UTF-8"?>
<?xml-model href="https://korpling.german.hu-berlin.de/saltnpepper/pepper/schema/10/pepper.rnc" type="application/relax-ng-compact-syntax" ?>
<pepper-job version="1.0">
        <importer name="'$importer'" path="'$tmp'"/>
        <exporter name="'$exporter'" path="'$tgt'"/>
</pepper-job>' > $conf
      cat $conf
      (cd $PEPPER;
       echo 'convert '$conf'
             exit' | $pepper)
      rm $conf
      if [ $tmp != $src ]; then
        rm -rf $tmp;
      fi
    fi;\
  done;
}

#
# args
############

help=$1
if [ $# -eq 0 ]; then
  help="-help"
fi;

if [ $help = '-help' ]; then
    echo 'synopsis: '$0 IMPORTER EXPORTER SRC[1..n] TGT 1>&2
    echo '          '$0' -help' 1>&2
    echo '  -help    list all installed importers and exporters (slow)' 1>&2
    echo '  IMPORTER importer (source format)' 1>&2
    echo '  EXPORTER exporter (target format)' 1>&2
    echo '  SRC      source file, directory or zip archive' 1>&2
    echo '  TGT      target directory' 1>&2
    echo 'configure and execute non-interactive Pepper conversion' 1>&2

    echo 1>&2
    echo installed converter modules 1>&2
    cd $PEPPER
    echo 'list
          exit' | bash -e $pepper | egrep 'PORTER' | cut -d "|" -f 3,4,5 | sed s/'^'/'  '/g 1>&2
    exit
fi;

#
# write and execute config
#############################

run_pepper $@
