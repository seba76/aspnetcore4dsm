# INFO.sh
#[ -f /pkgscripts/include/pkg_util.sh ] && . /pkgscripts/include/pkg_util.sh
#[ -f /pkgscripts-ng/include/pkg_util.sh ] && . /pkgscripts-ng/include/pkg_util.sh 

source /pkgscripts-ng/include/pkg_util.sh

package="aspnetcore4dsm"
displayname="ASP.NET Core Runtime 6.0.3"
version="6.0.3"
#os_min_ver="$1"
os_min_ver="7.0-40000"
description="The ASP.NET Core Runtime enables you to run existing web/server applications."
#arch="x86_64"
arch="$(pkg_get_platform_family)"
#arch="$(pkg_get_unified_platform)"
maintainer="seba"
maintainer_url="http://github.com/seba76/"
distributor="seba"
report_url="https://github.com/seba76/aspnetcore4dsm/"
support_url="https://github.com/seba76/aspnetcore4dsm/"
thirdparty="yes"
reloadui="no"
startable="no"
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
