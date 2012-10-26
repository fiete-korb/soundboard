<?php


$_SERVER["DOCUMENT_ROOT"] = getcwd().'/..';

ini_set('display_errors', true);
error_reporting(E_ALL & ~E_DEPRECATED);
require_once ('../lib/connections/db.php');

global $mdb2;

$soundsPath = '/root/sounds/';
$res = '';

if(isset($_POST['get_volume']) && $_POST['get_volume']){
	$res = getCurrentVolume();
}
else{
	changeCurrentVolume($_POST['volume']);
	$res = 'ok';
}

header( 'Content-type: text/json; charset=iso-8859-1' );
die(json_encode(array(utf8_encode($res))));

function getCurrentVolume()
{
	$command = "/bin/echo `sudo /usr/bin/amixer get Master | /bin/grep 'Front Left:'` | /usr/bin/cut -d ' ' -f 4";
	$vol = exec($command);
	return $vol;
}

function changeCurrentVolume($vol)
{
	$vol = ($vol < 0) ? 0 : $vol;
	$vol = ($vol > 31)? 31: $vol;

	$command = 'sudo /usr/bin/amixer cset iface=MIXER,name="Master Playback Volume" ' . $vol;
	proc_close(proc_open($command, array(), $pipes));
}

?>