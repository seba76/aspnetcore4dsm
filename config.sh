#!/bin/sh 

DownloadURL=https://download.visualstudio.microsoft.com/download/pr/86b1cadb-8736-40c5-aaf8-654da39394fc/df326f9481f4da03c7e31263d42a3b1d/aspnetcore-runtime-5.0.3-linux-x64.tar.gz

Version=5.0.3
DotNetFile=aspnetcore-runtime-${Version}-linux-x64.tar.gz

WGET=$(which wget)
UNZIP=$(which unzip)

if [ "$WGET" == "" ]; then
  WGET=./wget
fi

if [ "$UNZIP" == "" ]; then
  UNZIP="./unzip"
fi

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
    rm $DotNetFile
  ;;
  *)
    echo "Usage: ./config.sh prep|clean|purge";
  ;;
esac
