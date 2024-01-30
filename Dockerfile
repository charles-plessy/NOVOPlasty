FROM debian:stable

RUN apt -y update &&\
    apt -y install locales-all &&\
    apt -y install man-db perl-doc &&\
    apt -y clean &&\
    rm -rf /var/lib/apt &&\
    mkdir /usr/share/doc/NOVOPlasty

COPY ["NOVOPlasty4.3.4.pl", "./Test datasets", "./config.txt", "filter_reads.pl", "README.md", "LICENSE", "Seed_RUBP_cp.fasta", "/usr/share/doc/NOVOPlasty"]
RUN sed 's/\r//' /usr/share/doc/NOVOPlasty/NOVOPlasty4.3.4.pl > /usr/bin/NOVOPlasty4.3.4.pl &&\
    chmod 775 /usr/bin/NOVOPlasty4.3.4.pl &&\
    ln -s /usr/bin/NOVOPlasty4.3.4.pl /usr/bin/NOVOPlasty

# Build and run with podman.
# podman build -f Dockerfile -t novoplasty
# podman run -v ./config.txt:/mnt/config.txt:Z -it novoplasty:latest NOVOPlasty -c /mnt/config.txt

# Export for singulrity, build and run.
# podman save -o NOVOPlasty.tar novoplasty
# singularity build --fakeroot NOVOPlasty.sif docker-archive://NOVOPlasty.tar
# ./NOVOPlasty.sif NOVOPlasty -c config.txt  
