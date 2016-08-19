This is a guide to setting up gitlab on a VM with a static IP.

First, decide what type of connectivity you need.

## 1. NAT

   Only the host machine needs to connect to the Gitlab VM.
   Static IP is fixed to `10.0.2.15`
## 2. NAT + Host Only

   Host machine contains other VMs that need to access the Gitlab VM, however other computers on the network should not be able to access it.

   Static IP needs to be within the range of the Host Only Adapter.
   E.g. If network adapter IP address is `192.168.56.1`, static IP address must be within `192.168.56.<2-255>`
## 3. Bridged

   Other computers on the same LAN Network need to be able to access the Gitlab VM.

   Static IP address should be within the range `192.168.1.<2-255>`

# Setup Instructions

1. Setup VM

  * HDD: Minimum 8 GB
  * RAM: Minimum 1.5 GB
  * Pick NAT / NAT + Host Only / Bridged as per requirements.
2. Install [Ubuntu Server](http://www.ubuntu.com/download/server) (14.04 or 16.04)
3. Install Gitlab
   
   Follow instructions at [Download Gitlab](https://about.gitlab.com/downloads/#ubuntu1604)

   Run `sudo gitlab-ctl reconfigure`
4. Configure Gitlab to use your specified Static IP
   
   Navigate to your Gitlab configuration file

   ```
     sudo vim /etc/gitlab/gitlab.rb
   ```

   Update the following line with your preferred Static IP:

   ```
     external_url 'http://<YOUR STATIC IP>'
   ```

   Run reconfiguration

   ```
     sudo gitlab-ctl reconfigure
   ```
5. Setup your network settings to use your Static IP

    Navigate to your network interfaces file

    ```
      sudo vim /etc/network/interfaces
    ```
    #### If using NAT Adapter

    No changes needed
    #### If using Host Only Adapter

    Network address should be `192.168.56.0` for default settings.
    Change the file so it looks like below:

    ``` 
      auto lo
      iface lo inet loopback

      auto eth0
      iface eth0 inet dhcp

      auto eth1
      iface eth1 inet static
      address <YOUR STATIC IP ADDRESS>
      network <YOUR NETWORK ADDRESS>
    ```

    Run 
    ```
      sudo ifconfig eth1 up
      sudo /etc/init.d/networking restart
    ```

    You may need to restart the VM for the network settings to take effect.

    #### If using Bridging Adapter

    Get your <GATEWAY> from and `route -n`

    Change the file so it looks like below:

    ``` 
      auto lo
      iface lo inet loopback

      auto eth0
      iface eth0 inet static
      address <STATIC IP ADDRESS>
      gateway <GATEWAY>
      netmask 255.255.255.0
    ```



Credits: http://christophermaier.name/blog/2010/09/01/host-only-networking-with-virtualbox