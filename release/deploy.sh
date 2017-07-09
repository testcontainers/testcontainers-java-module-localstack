#!/usr/bin/env bash

openssl aes-256-cbc -K $encrypted_0670d12ce6c3_key -iv $encrypted_0670d12ce6c3_iv -in release/codesigning.asc.enc -out release/codesigning.asc -d
gpg --fast-import release/codesigning.asc

mvn versions:set -DnewVersion=$TRAVIS_TAG
mvn deploy -P sign,build-extras -DskipTests --settings release/settings.xml
