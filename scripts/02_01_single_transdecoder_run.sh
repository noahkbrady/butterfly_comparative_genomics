#!/bin/bash

# In this file:           #In 02_translate_cds.sh
#   $1                        the chunked file listing CDS files

while read -r line;
do
	export cdsFileName=$line
	cp ./01_RawCDSFiles/$cdsFileName 02_translated_cds_files
	cd 02_translated_cds_files
	# Now we can run Transdecoder on the cleaned file:
    echo "First, attempting TransDecoder run on $cdsFileName"
    /programs/TransDecoder-v5.5.0/TransDecoder.LongOrfs -t $cdsFileName
    /programs/TransDecoder-v5.5.0/TransDecoder.Predict -t $cdsFileName --single_best_only
    cd ../
done < $1