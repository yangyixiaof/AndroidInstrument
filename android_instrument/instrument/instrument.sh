#!/bin/bash

rm -rf operation_pool/*
mkdir -p operation_pool

/home/ren/MyProject/Instrument/agent_instrumentor/test_agent/resource/dex2jar/d2j-dex2jar.sh sample.apk --force

java -jar /home/ren/MyProject/jacoco/org.jacoco.cli/target/org.jacoco.cli-0.8.1-SNAPSHOT-nodeps.jar instrument sample-dex2jar.jar --dest operation_pool/

cd operation_pool/

mkdir sampledex

bash $AOSP_PATH/prebuilts/sdk/tools/dx --dex --output=sampledex --multi-dex /home/ren/MyProject/jacoco/org.jacoco.agent.rt/target/org.jacoco.agent.rt-0.8.1-SNAPSHOT-all.jar sample-dex2jar.jar

cp sample.apk operation_pool/
cd ..

#jarsigner -verbose -keystore yyx_apk.keystore -signedjar operation_pool/sample_signed.apk operation_pool/sample.apk yyx_apk.keystore
