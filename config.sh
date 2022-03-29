#!/bin/bash

#defaults
DownloadURL=https://download.visualstudio.microsoft.com/download/pr/3af854b6-80fb-425a-972f-c7f0d693bf1b/cd458a4feae5a98646ee12a14ab34151/aspnetcore-runtime-6.0.3-linux-x64.tar.gz
Version=6.0.3
DotNetFile=aspnetcore-runtime-${Version}-linux-x64.tar.gz

WGET=$(which wget)
UNZIP=$(which unzip)

if [ "$WGET" == "" ]; then
  WGET=./wget
fi

if [ "$UNZIP" == "" ]; then
  UNZIP="./unzip"
fi

function prompt_for_source()
{
	PS3='Please select version: '
	options=("ASP.NET Core Runtime 3.1" "ASP.NET Core Runtime 5.0" "ASP.NET Core Runtime 6.0" "Quit")
	select opt in "${options[@]}"
	do
		case $opt in
			"ASP.NET Core Runtime 3.1")
				DownloadURL=https://download.visualstudio.microsoft.com/download/pr/c5d69db1-7735-4473-973c-220b56c32e3d/8b907777706429063b0ed646a5445cdf/aspnetcore-runtime-3.1.12-linux-x64.tar.gz
				Version=3.1.12
				break
				;;
			"ASP.NET Core Runtime 5.0")
				DownloadURL=https://download.visualstudio.microsoft.com/download/pr/86b1cadb-8736-40c5-aaf8-654da39394fc/df326f9481f4da03c7e31263d42a3b1d/aspnetcore-runtime-5.0.3-linux-x64.tar.gz
				Version=5.0.3
				break
				;;
			"ASP.NET Core Runtime 6.0")
				DownloadURL=https://download.visualstudio.microsoft.com/download/pr/3af854b6-80fb-425a-972f-c7f0d693bf1b/cd458a4feae5a98646ee12a14ab34151/aspnetcore-runtime-6.0.3-linux-x64.tar.gz
				Version=6.0.3
				break
				;;
			"Quit")
				exit 1
				break
				;;
			*) echo "invalid option $REPLY";;
		esac
	done
	
	DotNetFile=aspnetcore-runtime-${Version}-linux-x64.tar.gz
} 

function download_dotnet()
{
  if [ ! -f ./${DotNetFile} ]; then
	echo "Downloading runtime dist from dot.net"
	$WGET ${DownloadURL} -O ${DotNetFile}
	chmod 755 ${DotNetFile}
  fi
}

function update_info()
{
  echo "Update version in INFO.sh"
  sed -i -e "s|^version=.*|version=\"${Version}\"|g" INFO.sh
  sed -i -e "s|^displayname=.*|displayname=\"ASP.NET Core Runtime ${Version}\"|g" INFO.sh
}

function extract()
{
  echo "Extracting ${DotNetFile}"
  [ ! -d package ] && mkdir package
  tar xf ${DotNetFile} -C package/
}

# get_key_value is in bin dir i.e. "get_key_value xfile key"
# set_key_value xfile key value
function set_key_value() {
	xfile="$1"
	param="$2"
	value="$3"
	grep -q "${param}" ${xfile} && \
		/bin/sed -i "s/^${param}.*/${param}=\"${value}\"/" ${xfile} || \
		echo "${param}=\"${value}\"" >> ${xfile}
}

case $1 in
  prep)
	prompt_for_source
    download_dotnet
    update_info
    extract
	echo "Ready to exec:"
	echo "         'sudo ../../pkgscripts-ng/PkgCreate.py --print-log -p x64 -v 6.2 -c -S aspnetcore4dsm'"
  ;;
  clean)
	rm -rf package
  ;;
  purge)
	rm -rf package
    rm aspnetcore-runtime-*-linux-x64.tar.gz
  ;;
  *)
    echo "Usage: ./config.sh prep|clean|purge";
  ;;
esac
