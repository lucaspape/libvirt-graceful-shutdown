# libvirt-graceful-shutdown
Gracefully shutdown libvirt VM before host shutdown using systemd service  

Using the ruby script to shutdown VM from [here](https://gist.github.com/qerub/5521952)

Installation:  

Install ruby and ruby-libvirt  
On arch: `yay -S ruby ruby-rdoc ruby-libvirt`

Download [virt-shutdown-wait.rb](https://raw.githubusercontent.com/lucaspape/libvirt-graceful-shutdown/main/virt-shutdown-wait.rb) into /usr/bin/virt-shutdown-wait  
Make executable using `chmod +x /usr/bin/virt-shutdown-wait`

Download [libvirt-shutdown@.service](https://raw.githubusercontent.com/lucaspape/libvirt-graceful-shutdown/main/libvirt-shutdown%40.service) into /etc/systemd/system/  

Enable service using `systemctl enable libvirt-shutdown@VMNAME`  
Start service using `systemctl start libvirt-shutdown@VMNAME`  

Replace VMNAME with the name of your libvirt domain
