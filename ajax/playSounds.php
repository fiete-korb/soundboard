<?php


$_SERVER["DOCUMENT_ROOT"] = getcwd().'/..';

ini_set('display_errors', true);
error_reporting(E_ALL & ~E_DEPRECATED);

require_once ('../lib/connections/db.php');

global $mdb2;

$soundsPath = '/root/sounds/';

if(isset($_SERVER['argv'][1])){
	$_SERVER['argv'][1] = utf8_decode($_SERVER['argv'][1]);
} 

if(isset($_POST['what']))
{
	$what = utf8_decode($_POST['what']);
	
	if(false !== stripos($what, 'switch outlet'))
	{
		$outletNumber = substr($what, -1);
		toggleOutlet((false === stripos($what, 'OFF')), $outletNumber);
	}
	elseif(false !== stripos($what, 'volume'))
	{
		changeCurrentVolume($_POST['volToSet']);
	}
	elseif(false !== stripos($what, 'talk'))
	{
		if(false !== stripos($what, 'de'))
		{
			readIt($_POST['phrase'], 'de');
		}
		else
		{
			readIt($_POST['phrase'], 'en');
		}
	}
	elseif(false !== stripos($what, 'Play (mp3)')){
		$params 	= array_merge($_POST, $_FILES);
		$file 		= isset($params['mp3_file']['tmp_name']) ? $params['mp3_file']['tmp_name'] : '';
		$filename	= isset($params['mp3_file']['name']) ? $params['mp3_file']['name'] : '';
		playItDirect($file, $filename, $soundsPath);
	}
	elseif(false !== stripos($what, 'cleanSayGarbage'))
	{
		cleanSayGarbage();
	}
	else
	{
		playSound($soundsPath.getFileNameFromWhat($what));
	}
}

if (isset($_SERVER['argv'][1]) && $_SERVER['argv'][1] == 'saymittag')
{
	changeCurrentVolume(18);
	readIt('Hallo! Es ist Mittag. Bitte jetzt das Essen essen!','de');
}

if (isset($_SERVER['argv'][1]) && $_SERVER['argv'][1] == 'saytime')
{
	changeCurrentVolume(18);
	readIt("Es ist".date('H')." Uhr ".date('i'),'de');

	sleep(8);

	$break = 10;

	for($counter = 0 ; $counter < $break; $counter++ )
	{
		readIt($break - $counter ,'de');
		sleep(1);
	}

	sleep(15);
	playSound($soundsPath.'fataaal.ogg');
}

if (isset($_SERVER['argv'][1]) && $_SERVER['argv'][1] == 'playessenkommen')
{
	changeCurrentVolume(18);
	playSound($soundsPath.'essenkommen.ogg');
	sleep(8);
	changeCurrentVolume(18);
	readIt("Es ist".date('H')." Uhr ".date('i'),'de');
	sleep(5);
	changeCurrentVolume(16);
	toggleOutlet(true,1);
	toggleOutlet(true,2);
	playSound($soundsPath.'schon_so_spaet.OGG');
	sleep(5);
	toggleOutlet(false,1);
	changeCurrentVolume(20);
}

if(isset($_GET['redbutton']) && $_GET['redbutton'] == 'true')
{
	changeCurrentVolume(27);
	toggleOutlet(true,1);
	toggleOutlet(true,2);
	playSound($soundsPath.'red_alert.ogg');
	sleep(15);
	toggleOutlet(false,1);
}


//-------------------- FUNCTIONS --------------------------

function getFileNameFromWhat($posted_name)
{
	$sql = "SELECT
	sfl.file_name
	FROM
	soundfiles sfl
	WHERE
	sfl.display_name = '".$posted_name."' 
	LIMIT 1
	;";
	
// 	print($sql);
	
	$res = mysql_query($sql);
	$ret = mysql_fetch_row($res);
	
// 	print_r($ret);
	
	return $ret[0]; 
}

function playSound($sound)
{
	
	print ($sound);
	
	$command = 'sudo /usr/bin/play '.$sound . ' 2>&1 >/dev/null &';
	//execute it in the background

	// 	proc_close(proc_open($command, array(), $pipes));

	$process = proc_open($command, array(), $pipes);

	if (is_resource($process)) {
		$return_value = proc_close($process);		
	}
}

function toggleOutlet($activate, $number)
{
	$command = 'sudo /usr/bin/sispmctl '.($activate?'-o':'-f').' '.$number;
	//execute it in the background
	$handle = proc_close(proc_open($command, array(), $pipes));
}

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

function readIt($phrase, $lang = 'en')
{
	//first get the mp3 from google
	$phrase = urlencode($phrase);
	$tFile = tempnam('/tmp/', 'saySound_').'.mp3';

	copy('http://translate.google.com/translate_tts?tl='.$lang.'&q='.$phrase, $tFile);

	//now encode it to ogg
	$command = 'sudo /usr/bin/ffmpeg -i ' . $tFile . ' ' . $tFile.'.wav';
	exec($command);

	//and finaly play it
	$command = 'sudo /usr/bin/play '.$tFile.'.wav' . ' 2>&1 >/dev/null &';
	proc_close(proc_open($command, array(), $pipes));
}

function playItDirect($file, $filename, $soundsPath)
{
	try {
		ini_set('memory_limit', '100M');
		$filename = str_replace(' ','',$filename);
		
		$destination = $soundsPath."upload/".$filename;
		$substDest = $soundsPath."upload/toplay";
		
		print($file);
		
		print(move_uploaded_file($file, $destination)?'ja':'nein');
		
		//now encode it to ogg
		$command = 'sudo /usr/bin/ffmpeg -i ' . $destination . ' ' . $substDest.'.wav';
		exec($command);
		
		//and finaly play it
		$command = 'sudo /usr/bin/play '.$substDest.'.wav' . ' 2>&1 >/dev/null &';
		proc_close(proc_open($command, array(), $pipes));
	} catch (Exception $e) {
		print($e->getMessage());exit;
	}
	
}

function pr($t)
{
	print '<pre>'.print_r($t,true).'</pre>';
}

?>