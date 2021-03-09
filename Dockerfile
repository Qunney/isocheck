from debian
COPY ./sp1.sh .
RUN chmod ugo+x sp1.sh && apt-get update && apt-get install -y isomd5sum

