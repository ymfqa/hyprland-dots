choice=$(echo -e "1.关机\n2.重启\n3.睡眠" | wofi -O alphabetical -d )
echo $choice

if [ $choice == "1.关机" ]
then
	shutdown now
elif [ $choice == "2.重启" ]
then
	shutdown -r now
elif [ $choice == "3.睡眠" ]
then
	systemctl suspend && hyprlock
fi
