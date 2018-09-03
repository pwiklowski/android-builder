FROM ubuntu:16.04
MAINTAINER pawel.wiklowski (pawel.wiklowski@gmail.com)


#Ubuntu setup
RUN apt-get clean
RUN apt-get update -y 
RUN apt-get install -y wget
RUN dpkg --add-architecture i386
RUN apt-get install -y expect
RUN apt-get update
RUN apt-get install -y libz1:i386 libncurses5:i386 libbz2-1.0:i386 libstdc++6:i386 git
#Download Android SDK
RUN wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz 
RUN tar zxvf android-sdk_r24.4.1-linux.tgz
 
#Move Android SDK to a proper location
RUN mv android-sdk-linux /opt/android-sdk
RUN cd /opt/android-sdk

#Install latest Java JDK&JRE
RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk

RUN git config --global http.sslverify false

#Setup Environmentals
ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk -a -u --filter tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter platform-tools
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-22.0.1
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-23.0.3
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-25.0.0
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-25.0.2
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-26.0.0
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter build-tools-26.0.2
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  build-tools-21.1.2
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-19
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-22
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-23
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-25
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  android-26
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  extra-android-support
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  extra-android-m2repository
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --no-ui --filter  extra-google-m2repository
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /opt/android-sdk/tools/android update sdk --all --force --no-ui --filter  extra-google-google_play_services

#Cleaning 
RUN apt-get clean
