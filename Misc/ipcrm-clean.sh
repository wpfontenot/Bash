#!/bin/bash
#
# Clear out semaphores with ipcrm
ipcs -s | grep apache | perl -e 'while (<STDIN>) { @a=split(/\s+/); print `ipcrm sem $a[1]`}' 
