echo "Collecting system information..."
macosMACAddress=$(networksetup -getmacaddress Wi-Fi)

clear
echo $macosMACAddress
echo "Are you connecting to the 'xfinitywifi' or another network?"
echo "-- Enter an option and press return --"
echo "1: xfinitywifi"
echo "2: Other"

read networkchoice

clear
echo "What is the MAC address of your Tesla?"
echo "- Go to the Car icon, Software, Tap Additional Vehicle Information to retrieve -"
echo "-- Enter an option and press return --"

read teslaMACAddress

clear
echo "Turning Wi-Fi off.."
networksetup -setairportpower en0 off
sleep 5
echo "Waiting 5 seconds before connecting to Wi-Fi"
networksetup -setairportpower en0 on
ifconfig en0 ether $teslaMACAddress
networksetup -setairportnetwork en0 xfinitywifi
clear
echo "Login to xfinitywifi by using your Xfinity username and password, then confirm your access to the internet."
echo "1: Continue"
echo "2: Cancel and rollback"

clear
echo "Reverting MAC address change..."

echo "Turning Wi-Fi off.."
networksetup -setairportpower en0 off
sleep 5
ifconfig en0 ether $macosMACAddress
networksetup -setairportpower en0 on
