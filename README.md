# The IaC approach will be added to from time to time to reach a complete Infrastructure as Code some day.
Run those scripts to pprepare a new server to be able to package a DEB and RPM package with FPM and install a Sonatype Nexus OSS.

## Disable IPv6
Even in 2023 we need to disable IPv6 to be able to reach some web addresses. rubygems.org is one of those.

## Install ruby gems
This is needed to install the tool FPM

## Install FPM
This is needed to generate packages in an easy way for debian based and rpm based systems

## Prepare Nexus packages
Download the current Nexus Archive from Sonatype, verify and extract it. Then make DEB and RPM packages from it.

## Install Nexus 
... on Ubuntu or Fedora or something else
