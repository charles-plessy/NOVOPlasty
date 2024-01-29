FROM debian:stable

RUN apt -y update &&\
    apt -y install locales-all &&\
    apt -y install man-db perl-doc &&\
    apt -y clean &&\
    rm -rf /var/lib/apt

COPY NOVOPlasty4.3.4.pl /usr/bin
RUN chmod 775 /usr/bin/NOVOPlasty4.3.4.pl &&\
    mkdir /usr/share/doc/NOVOPlasty
COPY ["./Test datasets", "./config.txt", "filter_reads.pl", "README.md", "LICENSE", "Seed_RUBP_cp.fasta", "/usr/share/doc/NOVOPlasty"]

# podman build -f Dockerfile -t novoplasty
# podman save -o NOVOLoci.tar novoplasty
# singularity build --fakeroot NOVOPlasty.sif docker-archive://NOVOPlasty.tar
