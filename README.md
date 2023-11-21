[![Github All Releases](https://img.shields.io/github/downloads/seba76/aspnetcore4dsm/total.svg)](https://github.com/seba76/aspnetcore4dsm)
[![Paypal](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://paypal.me/seba76/)
___

# aspnetcore4dsm

This project was created for repacking of ASP.NET Core Runtime tar.gz archive for Linux x64, which you can download from Microsoft [dot.net](https://dot.net) website, as Synology spk package for easier installation.

# Installation
First you need to find out what arch your Synology NAS belongs to, you can consult following page [What kind of CPU does my NAS have](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have). Not all arch are supported by this package.

Once you know what arch you need download appropriate package for you Synology box and install it manually in package center. If all goes well you will have ASP.NET Core installed. 
Latest spk file can be found in the [release](https://github.com/seba76/aspnetcore4dsm/releases) page.

## Requirements
- This package will work only on x64 machines.

## Known issues
Since DSM 7 doesn't allow to install packages that require root permission if they are not signed by Synology and for propper operation of this package it is neccesary, I've created script that needs to be executed when installing is finished. 
```
sudo /var/packages/aspnetcore4dsm/scripts/run_as_root
```
This is neccesary for editing /etc/profile and /root/.profile files since NET on linux has to have **DOTNET_ROOT** enviroment variable set, in addition to that one few more variable are set, also it will add path to /var/packages/aspnetcore4dsm/target folder to the **PATH** enviroment variable.

## Contributing

If you find this project useful you can mark it by leaving a Github *Star* or if you have any issues create one.
