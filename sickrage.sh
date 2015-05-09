#A simple shell script to start my version of sickrage
sudo docker run -d --restart=always -h black-pearl.local -v /home/pi/configs/sickrage:/config -v /media/media_share:/data -p 8081:8081 dieterrosch/rpi-docker-sickrage
