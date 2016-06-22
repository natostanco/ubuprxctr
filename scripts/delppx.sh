while true;
do
cp pxies.txt xs.txt
tail -n 10000 xs.txt > wx.txt
sleep 30;
done
