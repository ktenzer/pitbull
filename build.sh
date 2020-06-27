#!/bin/bash
VERSION="1.0.0"

echo "Building Operator..."
sudo operator-sdk build quay.io/ktenzer/pitbull-operator:$VERSION
if [ $? != 0 ]; then exit 1; fi

echo "Pushing operator to repository..."
sudo docker push quay.io/ktenzer/pitbull-operator:$VERSION
if [ $? != 0 ]; then exit 1; fi

