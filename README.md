# usb_sync
- about
  - Uploads the content of USB drive with a remote CIFS directory using RSync. 
  - Useful for quickly uploading data saved in your USB drive.
- notes
  - autofs is used for mounting USB drive
  - cifs-utils is used for mounting CIFS directory
  - softether-vpn is used for mounting CIFS directory in a different network
  - systemd is used for making the above into services and enabling auto start at startup
### prerequisites
```
sudo apt install git, autofs
git clone https://github.com/rayanti/usb_sync.git
sudo cp {auto.master,auto.misc} /etc
sudo cp 1-usb.rules /etc/udev/rules.d
```
### if automount fails...
```
sudo chmod -x /etc/auto* #autofs doesn't like its files to be executable
```

### static ip route
- for static ip use nmtui
- for static route copy file like below
```
sudo cp 40-route /lib/dhcpcd/dhcpcd-hooks/
```

### softether vpncmd install
- go to https://www.softether-download.com/en.aspx?product=softether and download required package (which is in .tar.gz format)
```
tar xzvf vpnserver-5070-rtm-linux-x86.tar.gz 
cd vpnclient
make
#(1,1,1)
sudo ./vpnclient start
./vpncmd
#(2," ")
PasswordSet
RemoteDisable
NicCreate
#VPN
AccountCreate
#{account name}
AccountPasswordSet
#standard
AccountConnect
AccountStartupSet
quit
```

### cifs share
```
sudo apt install cifs-utils
sudo chown root: /home/pi/usb_sync/cifs_credentials
sudo chmod 600 /home/pi/usb_sync/cifs_credentials
```

### vpncmd auto start on startup
```
sudo cp vpnserver.service /etc/systemd/system/
sudo cp vpn_dhclient.service /etc/systemd/system/
```

### enable systemd service
```
systemctl daemon-reload
systemctl start vpnserver
systemctl enable vpnserver
systemctl start vpn_dhclient
systemctl enable vpn_dhclient
systemctl start cifs_mount
systemctl enable cifs_mount
```

# must do after changing environment
- change ip address in nmtui
- change ip address in 40-route
- change uuid in 1-usb.rules
