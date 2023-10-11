sudo apt-get update -y
sudo apt-get install libqt5gui5 -y
pip install PyQt5 PyQtWebEngine
pip install orange3

cat > ~/Desktop/orange3.sh << EOF
python -m Orange.canvas
EOF

sudo chmod ugo+x ~/Desktop/orange3.sh

# run it once to make it complain and terminate because of some missing settings.. it fixes itself though..., the user can after this run it from the desktop
~/Desktop/orange3.sh

# confirmation
bold=$(tput bold)
normal=$(tput sgr0)
clear
echo "----------------------- CHCAA says Orange Data Mining gogo -----------------------"
echo "${bold}[INFO] You can now press Open Interface...${normal}"
