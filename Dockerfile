FROM openjdk:8-jdk
RUN apt-get update
RUN apt-get install -y unzip build-essential cmake python-dev python-numpy
RUN apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev
RUN apt-get install -y libtbb-dev libeigen3-dev
RUN apt-get install -y ant

WORKDIR /tmp
RUN wget https://github.com/opencv/opencv/archive/4.1.0.zip

RUN unzip 4.1.0.zip && rm 4.1.0.zip
RUN mv opencv-4.1.0 OpenCV

WORKDIR /tmp/OpenCV
RUN mkdir build && cd build
WORKDIR /tmp/OpenCV/build
RUN cmake -DBUILD_SHARED_LIBS=OFF ..
RUN make -j8
RUN mkdir /opt/local
RUN mkdir /opt/local/lib
RUN cp bin/opencv*.jar /opt/local/lib
RUN cp lib/libopencv_java*.so /opt/local/lib

CMD
