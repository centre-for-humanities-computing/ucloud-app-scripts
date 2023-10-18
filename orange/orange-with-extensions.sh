sudo apt-get update -y
sudo apt-get install libqt5gui5 -y
pip install PyQt5 PyQtWebEngine
pip install orange3
pip install orange3-associate orange3-bioinformatics orange3-educational orange3-explain orange3-fairness orange3-geo orange3-imageanalytics orange3-network orange3-prototypes orange3-SingleCell Orange-Spectroscopy Orange3-Survival-Analysis orange3-text Orange3-Textable orange3-timeseries Orange3-WorldHappiness

cat > ~/Desktop/orange3.sh << EOF
python -m Orange.canvas
EOF

sudo chmod ugo+x ~/Desktop/orange3.sh

# run it once to make it complain and terminate because of some missing settings.. it fixes itself though..., the user can after this run it from the desktop
# ~/Desktop/orange3.sh

# confirmation
bold=$(tput bold)
normal=$(tput sgr0)
clear
echo "----------------------- CHCAA says Orange Data Mining gogo -----------------------"
echo "${bold}[INFO] You can now press Open Interface...${normal}"
