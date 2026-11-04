# Here is a script that you can upload to GitHub to set up a MagicMirror in one step:
# You can save this script as a file (e.g. `setup.sh`), make it executable with `chmod +x setup.sh`, and then upload it to your GitHub repository.
# To use the script, simply run `./setup.sh` on your MagicMirror installation.
# This is untested.  Please proceed with caution
# Created by Bryant Poston R4N Productions, LLC

#!/bin/bash

# Update and install Node.js
curl -sL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Clone MagicMirror repository and install modules
git clone https://github.com/MichMich/MagicMirror
cd MagicMirror
npm run install-mm

# Copy default config file
cp config/config.js.sample config/config.js

# Install custom modules
git clone https://github.com/werthdavid/MMM-Bring.git
npm install

git clone https://github.com/werthdavid/MMM-BurnIn.git
npm install

git clone https://github.com/shbatm/MMM-Carousel.git
npm install

git clone https://github.com/Jopyth/MMM-Remote-Control.git
npm install

git clone https://github.com/kevinatown/MMM-Screencast.git
npm install

git clone https://github.com/koxm/MMM-SpaceLaunchNow.git
npm install

git clone https://github.com/TeraTech/MMM-WiFiPassword.git
npm install

git clone https://github.com/nitpum/MMM-EmbedYoutube.git
npm install

git clone https://github.com/randomBrainstormer/MMM-GoogleCalendar.git
npm install

git clone https://github.com/choffmann/MMM-YT-SubCount.git
npm install

git clone https://github.com/ianperrin/MMM-YouTubeChannelStats.git
npm install

# Set up cron jobs
crontab -e
#58  6   *   *   *   vcgencmd display_power 1
#59  6   *   *   *   vcgencmd display_power 0
59  6   *   *   *   /sbin/shutdown -r now
0  23   *   *   *   vcgencmd display_power 0
# To Fix Display coming back on after reboot:
sudo nano /boot/config.txt
#comment out
#dtoverlay=vc4-kms-v3d

# Start MagicMirror
npm run start
```

