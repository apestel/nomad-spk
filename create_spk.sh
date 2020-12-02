#!/bin/sh
set +x
NOMAD_VERSION=0.12.9
NOMAD_ZIP=nomad_${NOMAD_VERSION}_linux_amd64.zip
cd 1_create_package/nomad 
wget https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/${NOMAD_ZIP}
unzip ${NOMAD_ZIP}
rm ${NOMAD_ZIP}
cd ..
tar cvfz package.tgz * 
mv package.tgz ../2_create_project/ 
cd ../2_create_project/ 
tar cvfz nomad.spk * 
mv nomad.spk ..
rm -f package.tgz
