things to do to this image
get my privkey on there by default, and change password to something unknown
setup nopasswd in sudoers
install go 1.10
  apt install software-properties-common
  add-apt-repository ppa:gophers/archive
  apt-get update
  apt-get install golang-1.10-go
add /usr/lib/go-1.10/bin to path
  add /etc/profile.d/golang.sh that sets path
sudo apt-get install --no-install-recommends open-vm-tools


Use packer to create an image and spin it up on esx.

from: https://nickcharlton.net/posts/using-packer-esxi-6.html

First prepare esx thusly:

[root@esxi26:~] esxcli system settings advanced set -o /Net/GuestIPHack -i 1
[root@esxi26:~] chmod 644 /etc/vmware/firewall/service.xml
[root@esxi26:~] vi /etc/vmware/firewall/service.xml
[root@esxi26:~] chmod +t /etc/vmware/firewall/service.xml
[root@esxi26:~] vi /etc/vmware/firewall/service.xml

at the end of service.xml, add the following:

<service id="1000">
  <id>packer-vnc</id>
  <rule id="0000">
    <direction>inbound</direction>
    <protocol>tcp</protocol>
    <porttype>dst</porttype>
    <port>
      <begin>5900</begin>
      <end>6000</end>
    </port>
  </rule>
  <enabled>true</enabled>
  <required>true</required>
</service>

[root@esxi26:~] chmod 444 /etc/vmware/firewall/service.xml
[root@esxi26:~] esxcli network firewall refresh


