New base images in ESX can be spun up remotely and repeatably using Packer.

Packer downloads an install iso, uses a local preseed file for unattended installation, connects to the running system, and runs a series of provisioners which prepare the system for further auto-administration.

ESX hosts must be prepared to allow the remote interaction necessary for this to work:

  esxcli system settings advanced set -o /Net/GuestIPHack -i 1
  chmod 644 /etc/vmware/firewall/service.xml
  vi /etc/vmware/firewall/service.xml
  chmod +t /etc/vmware/firewall/service.xml

Edit the service.xml file (after making it writable), and add the following stanza at the end of the file (inside the closing tag please!)

```xml
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
```
