sudo apt install calibre
pip install taguette

# create desktop file
cat <<EOT >> ~/Desktop/taguette.desktop
[Desktop Entry]
Name=Taguette
Type=Link
URL=http://localhost:7465/
Icon=user-bookmarks
EOT

sudo chmod u+x ~/Desktop/taguette.desktop

# run the app. We need to run in background (&) for ucloud desktop app to start
taguette &
