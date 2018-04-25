New base images in ESX can be spun up remotely and repeatably using Packer.

Packer downloads an install iso, uses a local preseed file for unattended installation, connects to the running system, and runs a series of provisioners which prepare the system for further auto-administration.

ESX hosts must be prepared to allow the remote interaction necessary for this to work:

```
# enable GuestIpHack to allow packer to determine the vm IP address before vmtools are installed
esxcli system settings advanced set -o /Net/GuestIPHack -i 1
# open inbound VNC connections on the firewall
esxcli network firewall ruleset set -e true -r gdbserver
```
