#!/bin/bash

MINIO_ENDPOINT=`oc get route|grep -v console|grep -v NAME|awk '{print $2 }'`
NAMESPACE='flyingthings-standalone'
MINIO_BUCKET='flyingthings'

tkn pipeline start flyingthings-image-pipeline \
-w name=shared-workspace,\
volumeClaimTemplateFile=custom-pvc.yaml \
-p git-url=https://github.com/redhat-na-ssa/flyingthings.git \
-p git-revision=develop \
-p IMAGE=image-registry.openshift-image-registry.svc:5000/flyingthings-standalone/yolox:latest \
-p DOCKERFILE_PATH=source/yolo \
--use-param-defaults --showlog