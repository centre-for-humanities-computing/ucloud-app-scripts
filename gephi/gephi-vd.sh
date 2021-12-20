DL_URL="https://oss.sonatype.org/service/local/artifact/maven/content?r=snapshots&g=org.gephi&a=gephi&v=0.9.3-SNAPSHOT&c=linux&p=tar.gz"
GEPHI_TAR="gephi.tar.gz"
GEPHI_RUN="/tmp/gephi/gephi-0.9.3-SNAPSHOT/bin/gephi"
cd /tmp
mkdir gephi
cd gephi
wget "$DL_URL" -O "$GEPHI_TAR"
tar -xvf "$GEPHI_TAR"
ln -s "$GEPHI_RUN" ~/Desktop/gephi
