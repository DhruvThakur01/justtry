FROM ubuntu
WORKDIR /myapp
COPY pping /myapp
RUN apt-get update
RUN apt-get install -y libelf-dev
RUN apt-get install -y tcpdump
CMD ["./pping", "-i", "eth0", "-I", "tc", "-F", "json"]

