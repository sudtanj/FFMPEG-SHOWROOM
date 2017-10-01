exist=$(which ffmpeg)
if [ $? -ne 0 ]; then
sudo add-apt-repository ppa:mc3man/trusty-media -y
sudo apt-get update
sudo apt-get --yes --force-yes install ffmpeg
fi
youtube=$(livestreamer https://www.youtube.com/channel/UCkGKUwCY-dJFf-uBpPKXTHQ/live-c 720p --stream-url)
streamlink="rtmp://202.166.185.32:1935/liveorigin?099d0d478a2e2f7b8ca550d2609a06a214b54c471a352e5f5bb6fd5e108054d7&57524f5a44426a64484b6168655049754ca4393020dea4f27af8e47b4b04f091216dcc9f0fc6a39c0dd8583b2daf4ee71399a7dec7c4485b55b30f7ab9bd90293a56a57d2555f9b282e1ba93a7dfdb1fe0d4924d7c32fc3d80d43afc522fe7592cfaa62090aec810b1fc38386c7d09648074b0d829d2c16b93e0140dbc80eb4a/099d0d478a2e2f7b8ca550d2609a06a214b54c471a352e5f5bb6fd5e108054d7"
ffmpeg -i $youtube -ar 44100 -vcodec libx264 -r 25 -b:v 500k  -f flv $streamlink
