#!/bin/bash

# will fail on error
set -e

if [[$CI_XCODEBUILD_ACTION == "test-without-building" && $CI_WORKFLOW_ID == ""]]
then
    # allow the IPs that are part of Apple's network (on which Xcode Cloud is hosted) to access your server
    #    curl https://my.server.example.com/health --fail
fi
 
