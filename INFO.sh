# INFO.sh
[ -f /pkgscripts/include/pkg_util.sh ] && . /pkgscripts/include/pkg_util.sh
[ -f /pkgscripts-ng/include/pkg_util.sh ] && . /pkgscripts-ng/include/pkg_util.sh 

package="aspnetcore4dsm"
displayname="ASP.NET Core Runtime 5.0.3"
version="5.0.3"
os_min_ver="$1"
description="The ASP.NET Core Runtime enables you to run existing web/server applications."
arch="x86_64"
maintainer="seba"
maintainer_url="http://github.com/seba76/"
distributor="seba"
report_url="https://github.com/seba76/aspnetcore4dsm/"
support_url="https://github.com/seba76/aspnetcore4dsm/"
thirdparty="true"
reloadui="no"
startable="no"
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
