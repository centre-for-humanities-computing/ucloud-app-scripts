DL_URL="https://github.com/gephi/gephi/releases/download/v0.10.1/gephi-0.10.1-linux-x64.tar.gz"
GEPHI_TAR="gephi.tar.gz"
GEPHI_RUN="/tmp/gephi/gephi-0.10.1/bin/gephi"
cd /tmp
mkdir gephi
cd gephi
wget "$DL_URL" -O "$GEPHI_TAR"
tar -xvf "$GEPHI_TAR"
ln -s "$GEPHI_RUN" ~/Desktop/gephi
# confirmation
bold=$(tput bold)
normal=$(tput sgr0)
clear
echo "----------------------- CHCAA says Gephi gogo -----------------------"
echo "${bold}[INFO] You can now press Open Interface...${normal}"
