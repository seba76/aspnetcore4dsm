# aspnetcore4dsm

This project was created for repacking of ASP.NET Core Runtime tar.gz archive for Linux x64, which you can download from Microsoft [dot.net](https://dot.net) website, as Synology spk package for easier installation.

# Installation
First you need to find out what arch your Synology NAS belongs to, you can consult following page [What kind of CPU does my NAS have](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have). Not all arch are supported by this package.

Once you know what arch you need download appropriate package for you Synology box and install it manually in package center. If all goes well you will have ASP.NET Core installed. 
Latest spk file can be found in the [release](https://github.com/seba76/aspnetcore4dsm/releases) page.

## Requirements
- This package will work only on x64 machines.

## Known issues
- **"dotnet: /lib/libstdc++.so.6: no version information available (required by dotnet)"** message might be seen when you start dotnet app.

## Contributing

If you find this project useful you can mark it by leaving a Github *Star* and if you would like to support this Project consider making a donation.<br>
[![Donate](https://img.shields.io/badge/donate-PayPal-yellow.svg)](https://paypal.me/seba76/)
