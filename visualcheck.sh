#!/bin/bash

HOME=/Users/lub_jungs/Johannes/Rasmussen/Subjects/visiblecheck/
FS_start=/Users/lub_jungs/Johannes/Rasmussen/Subjects/visiblecheck/freesurfer_start

cd ${HOME}

rsync -rvhe 'ssh' 'lub_jungs@10.10.20.96:/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/mri/brainmask.mgz :/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/mri/wm.mgz :/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/mri/aseg.mgz' ${HOME}

rsync -rvhe 'ssh' 'lub_jungs@10.10.20.96:/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/surf/lh.white :/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/surf/lh.pial :/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/surf/rh.white :/media/Daten1/Rasmussen/"${1%%_*}"/${1}/freesurfer_${1}/surf/rh.pial' ${HOME}

${FS_start}
