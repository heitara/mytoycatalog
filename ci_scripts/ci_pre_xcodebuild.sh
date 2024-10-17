#!/bin/bash

# will fail on error
set -e

if [[$CI_XCODEBUILD_ACTION == "test-without-building" && $CI_WORKFLOW_ID == "E4D0A5A5-2247-40AB-A624-5C2BF25F64C0"]]
then
    # allow the IPs that are part of Apple's network (on which Xcode Cloud is hosted) to access your server
    #    curl https://my.server.example.com/health --fail
fi
 
