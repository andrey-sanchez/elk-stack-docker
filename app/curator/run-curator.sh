#!/bin/bash -x
cd $(dirname $0)
curator --config config.yml actions.yml
