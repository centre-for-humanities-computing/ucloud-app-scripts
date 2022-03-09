sudo apt update

# ucloud does not seem to have a audio ouput so opening video fails, so we do not install vlc
# sudo apt install vlc -y 

mkdir qualcoder
cd qualcoder
wget "https://github.com/ccbogel/QualCoder/archive/refs/heads/master.zip"
unzip "master.zip"
cd QualCoder-master
pip install lxml ply six pdfminer chardet pyqt5 pillow pdfminer.six openpyxl ebooklib pydub SpeechRecognition
python3 -m pip install .

# create desktop file
cat <<EOT >> ~/Desktop/qualcoder.desktop
[Desktop Entry]
Version=1.0
Name=Qualcoder        
Exec=qualcoder
Type=Application
EOT

# make it executable to get rid of warning when clicking it
sudo chmod +x ~/Desktop/qualcoder.desktop
