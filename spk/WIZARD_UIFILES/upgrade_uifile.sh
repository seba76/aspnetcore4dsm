#!/bin/sh

/bin/cat > /tmp/wizard.php <<'EOF'
<?php
$dir = '/var/packages/aspnetcore4dsm/target/shared/Microsoft.NETCore.App/';
$files = scandir($dir);
\array_splice($files, 0, 2);

$addComma=false;
$subItems = "";
foreach ($files as $key => $value) {
	if ($addComma == true) $subItems = $subItems .',';
	$safeValue = str_replace(".", "_", $value);
	$subItems = $subItems .'
			{ 
				"key": "wiz_aspnetkeep_'.$safeValue.'", 
				"desc": "ASP NETCore '.$value.'", 
				"defaultValue": true 
			}';
	$addComma = true;
}

$wiz = '
[{
	"step_title": "ASP.NET Core Upgrade",
	"items": [{
		"type": "multiselect",
		"desc": "Select previous versions of DotNET you wish to keep!",
		"subitems": 
		[
		'.$subItems.'
		]
	}]
}]
';

echo  <<<EOF
$wiz
EOF;
?>
EOF

/usr/bin/php -n /tmp/wizard.php > "$SYNOPKG_TEMP_LOGFILE"
rm /tmp/wizard.php
exit 0
