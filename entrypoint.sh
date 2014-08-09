#!/usr/bin/env bash

# The start script for the docker container.

omd start
service apache2 restart
/bin/bash
