FROM ubuntu:16.04
MAINTAINER pawel.wiklowski (pawel.wiklowski@gmail.com)


#Ubuntu setup
RUN apt-get clean
RUN apt-get update -y 
RUN apt-get install -y wget ssh-client unzip
RUN dpkg --add-architecture i386
RUN apt-get install -y expect
RUN apt-get update
RUN apt-get install -y libz1:i386 libncurses5:i386 libbz2-1.0:i386 libstdc++6:i386 git
#Download Android SDK
RUN wget --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip android-sdk.zip -d android-sdk-linux
 
 
 
 
 
#Move Android SDK to a proper location
RUN mv android-sdk-linux /opt/android-sdk
RUN cd /opt/android-sdk

ENV NDK_VERSION="15b"
RUN wget --output-document=android-ndk.zip https://dl.google.com/android/repository/android-ndk-r${NDK_VERSION}-linux-x86_64.zip
RUN unzip -qq android-ndk.zip
ENV ANDROID_NDK_HOME /android-ndk-r${NDK_VERSION}

#Install latest Java JDK&JRE
RUN apt-get install -y default-jre
RUN apt-get install -y default-jdk

RUN git config --global http.sslverify false

#Setup Environmentals
ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN yes | /opt/android-sdk/tools/bin/sdkmanager --licenses
#Cleaning 
RUN apt-get clean
