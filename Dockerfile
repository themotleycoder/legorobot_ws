# This is an auto generated Dockerfile for ros:ros-base
# generated from docker_images/create_ros_image.Dockerfile.em
FROM ros:melodic-ros-core-bionic

COPY ./src/ ./legorobot_ws/src/

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-melodic-ros-base=1.4.1-0* python-pip\
    && rm -rf /var/lib/apt/lists/* \
    && pip install pynput

# RUN cd ./legorobot_ws && source devel/setup.bash