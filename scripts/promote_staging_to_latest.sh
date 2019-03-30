#!/bin/bash
set -e



# build_id is the build that will be promoted and must be set before each use!
export build_id=fill_in_the_build_number
echo check that build number,  $build_id  is an integer
if [[ ! "$build_id" =~ ^[0-9]+$ ]]; then 
  exit 1
fi 

echo promoting artifacts/{build_id} to artifacts/latest 

echo cd into lergo-ri to install node and npm
cd lergo-ri
source ~/.nvm/nvm.sh
nvm install

echo cd away from package.json to prevent long unecessary npm install
cd ..
npm install

echo install aws-cli
npm install aws-cli

echo replaced --dryrun with --dryrun

echo copying artifacts/latest to builds/production/latest
aws s3 cp s3://lergo-backups/artifacts/build-lergo-${build_id}/jobs/build-lergo/${build_id}/build.id s3://lergo-backups/artifacts/latest/build.id --dryrun
aws s3 cp s3://lergo-backups/artifacts/build-lergo-${build_id}/jobs/build-lergo/${build_id}/install.sh s3://lergo-backups/artifacts/latest/install.sh --dryrun
aws s3 cp s3://lergo-backups/artifacts/build-lergo-${build_id}/jobs/build-lergo/${build_id}/lergo-ri-0.0.0.tgz s3://lergo-backups/artifacts/latest/lergo-ri-0.0.0.tgz --dryrun
aws s3 cp s3://lergo-backups/artifacts/build-lergo-${build_id}/jobs/build-lergo/${build_id}/lergo-ui-0.0.0.tgz s3://lergo-backups/artifacts/latest/lergo-ui-0.0.0.tgz --dryrun


echo promote completed succesfully
