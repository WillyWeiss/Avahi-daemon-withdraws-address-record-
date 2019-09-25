

# Avahi-daemon withdraws address record 
This script is a workaround the Bug #1586528 from Avahi-daemon which withdraws IPV4 address record.

This bug was reported here:

https://bugs.launchpad.net/ubuntu/+source/avahi/+bug/1586528

You know when you encounter the bug after your system logs, which will look siilar with:


```sh


Sep 24 16:47:40 MyHostName rngd[395]: stats: Time spent starving for entropy: (min=0; avg=0.000; max=0)us
Sep 24 16:47:46 MyHostName avahi-daemon[380]: Withdrawing address record for 192.168.0.13 on eth0.
Sep 24 16:47:46 MyHostName avahi-daemon[380]: Leaving mDNS multicast group on interface eth0.IPv4 with address 192.168.0.13.
Sep 24 16:47:46 MyHostName avahi-daemon[380]: Interface eth0.IPv4 no longer relevant for mDNS.


```

# Workaround
This script is monitoring the presence of an IPv4 address over the given card and if the IP is missing the script will realocate a valid IP address.
The script is monitoring 'eth0' only, by default, but it can perform an entire system check if necessary. 
Just uncomment 'Card1' or create more 'Cards"


In order to add more cards you need to:

-Copy Card0 object;

-Paste Card0 object before the marked positoin;

-RENAME Card0 with your desire name. DO NOT LEAVE THE SAME NAME.;

-Change `eth0` with your interface name.;

- Add new card on the market spot inside the scipt. 

Your logs will say something like:

```sh
Sep 24 16:47:47 MyHostName dhclient[4487]: DHCPREQUEST for 192.168.0.13 on eth0 to 255.255.255.255 port 67
Sep 24 16:47:47 MyHostName dhclient[4487]: DHCPACK of 192.168.0.13 from 192.168.0.1
Sep 24 16:47:47 MyHostName avahi-daemon[380]: Joining mDNS multicast group on interface eth0.IPv4 with address 192.168.0.13.
Sep 24 16:47:47 MyHostName avahi-daemon[380]: New relevant interface eth0.IPv4 for mDNS.
Sep 24 16:47:47 MyHostName avahi-daemon[380]: Registering new address record for 192.168.0.13 on eth0.IPv4.
Sep 24 16:47:47 MyHostName dhclient[4487]: bound to 192.168.0.13 -- renewal in 41664 seconds.

```

# Install

<code>sudo git clone https://github.com/WillyWeiss/-Avahi-daemon-withdraws-address-record-.git</code>

# Usage

Make it Executable

```sh
sudo chmod +x isc-dhcp-fix.sh 
```
Run 

```sh
./isc-dhcp-fix.sh</code>

```
# Place the script in auto-run by copy it under 'usr/bin folder

```sh
$ sudo cp isc-dhcp-fix.sh /usr/bin/isc-dhcp-fix.sh
$ sudo nano /etc/rc/local
```  
 Add ''exit0''

```sh
/usr/bin/isc-dhcp-fix.sh & 
```
