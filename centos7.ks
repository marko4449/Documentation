#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
#installation url
url --url=http://10.10.4.10/cblr/links/centos7-x86_64
# Use graphical install
graphical
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=sda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

# Network information
network  --bootproto=dhcp --device=eth0 --onboot=on --ipv6=auto --activate
network  --hostname=lan.automation.internal

# Root password
rootpw --iscrypted $6$csEw1WxR07qCtnRm$gkyjywRVKc8RhvlZQEy5gfeiY6nButsmk1bzEiMtyJeIBq9DjVGd5WTFhdJ3aOAwoNbEMhAI6h7x1Ki3Vpm6U0
# System services
services --disabled="chronyd"
# System timezone
timezone Europe/Tallinn --isUtc --nontp
user --groups=wheel --name=marko --password=$6$0kBXp6NVc6CSJ1a7$rAgy8bUNc8WSRUmRxE1uJ40jj9d7qyPRp0rJM9LoflhNUN29AE4j5CP6sHtumEicdT9YEzBwH5u1aE9oqUCha1 --iscrypted --gecos="marko"
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel

%packages
@^minimal
@core
kexec-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end
