#!/bin/bash

#test edit
#set variables
patid=$1
STUDY_DIR=/media/Daten1/Rasmussen


echo "--- recon-all longitudinal start subject ${patid} at $(date) --- "
cd ${STUDY_DIR}/${patid}
pwd

#create timepoint list
list_tps=$(ls | grep -E "_[0-9]+")

for tps in ${list_tps}
do
	ln -s ${STUDY_DIR}/${patid}/${tps}/freesurfer_${tps} freesurfer_${tps}
	echo -n "-tp freesurfer_${tps} " >> tplist_${patid}.txt

done

#create recon-all base

echo "start recon-all base for ${patid}"
recon-all -base ${patid}_base $(cat tplist_${patid}.txt) -all -sd ./
echo "finished recon-all base for ${patid}"

#create longitunials according to base

for tps in ${list_tps}
do
	echo "start recon-all -long for ${tps}"  
	recon-all -long freesurfer_${tps} ${patid}_base -all -sd ./
	echo "finished recon-all -long for ${tps}"
done

echo "--- recon-all longitudinal finished subject ${patid} at $(date) --- "

