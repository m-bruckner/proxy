# Proxy module for puppet

#### Table of Contents

1. [Description](#description)
1. [Setup](#setup)

## Description

The proxy module for puppet should work on most of the common Linux distributions
and will realize the following tasks:

- Installation of the nginx package, if it not exists.
- Creation of the /etc/nginx/nginx.conf, which includes the configuration for a 
  reverse-proxy for the redirection of locations to different backend servers
  and a configuration for a forwarding proxy.
- Creation of a self-signed certificate and key for HTTPS, if it doesn't exist.
- Implementation of an automated restart of the nginx service, if it is not running. 

## Setup

To use the module, you only have to clone the repository to your module path
on your puppet master and include the proxy module in your manifest.
To adjust the nginx configuration settings, you can modify the following two
files:

proxy/manifests/config.pp

proxy/templates/nginx.conf.erb
