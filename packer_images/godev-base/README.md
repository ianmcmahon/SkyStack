`packer build -var-file variables.json godev-base.json`

Spins up ubuntu 16.04 with no LVM, no swap, single 40GB root partition.

My username is hardcoded throughout, and it needs to change in several places for everything to work.  Good luck with that.

ESX host info and credentials go in variables.json
Host must be prepared a bit to open networking (see README in dir above)

Copies up a sudoers file with my user NOPASS'd
Carefully puts it in place without hosing sudo and locking me out of root (ask me how I stumbled around that one)
Generates an ssh key, and installs an authorized_keys file with my pubkey in it
Install vmware tools
Adds appropriate modern repository for golang builds newer than 1.6 
Installs go 1.10
Adds /etc/profile.d/golang.sh which sets up a default GOROOT=$HOME/go and sets paths appropriately
Installs vim and vim-go-ide (for installing user)



