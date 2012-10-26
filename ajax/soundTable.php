<?php 

$_SERVER["DOCUMENT_ROOT"] = getcwd().'/..';

ini_set('display_errors', true);
error_reporting(E_ALL & ~E_DEPRECATED);
require_once ('../lib/connections/db.php');

$soundsPath = '/root/sounds/';

$sql = "SELECT
			sfl.display_name, scat.name AS cat_name
		FROM
			soundfiles sfl
		JOIN
			sound_categories scat
		ON
			sfl.cat = scat.id;";

$res = mysql_query($sql);
$toReturn = array();
while($row = mysql_fetch_assoc($res)){
	
	array_push($toReturn, $row);
}

$switchesTableContent = '';
$switchesTableContent .= '<table id="switches"><tr>';
$switchesTableContent .= '<td>LAMPE</td><td>SOUND</td><td>ROTATOR</td><td>KLICK</td>';
$switchesTableContent .= '</tr><tr>';
for($i = 1; $i <= 4; $i++)
{
	$switchesTableContent .= '<td><input class="button" type="submit" name="what" style="background-color:#9f9;" value="switch outlet ON: '.$i.'" /></td>';
}
$switchesTableContent .= '</tr><tr>';
for($i = 1; $i <= 4; $i++)
{
	$switchesTableContent .= '<td><input class="button" type="submit" name="what" style="background-color:#f99;" value="switch outlet OFF: '.$i.'" /></td>';
}
$switchesTableContent .= '</tr></table><hr/>';

$soundTableContent = '';
$soundClasses = array();
foreach($toReturn as $entry)
{
	$soundClasses[] = $entry['cat_name'];
}
$soundClasses = array_unique ($soundClasses);
asort($soundClasses);

$soundTableContent .= '<div id="tablecontainer">';
foreach($soundClasses as $entrySC)
{
	$soundTableContent .= '	<div class="togglecontainer" id="tablecontainerrow">
								<div>'.$entrySC.'</div><br />';

	$i = 0;
	$soundTableContent .= '<div id="tablecontainerrow">';

	foreach($toReturn as $entrySB)
	{
		if($entrySC == $entrySB['cat_name'])
		{
			if($i % 6 == 0)
			{
				$i++;
			}
			$soundTableContent .= '<div class="column"><input class="button '.$entrySB['cat_name'].'" type="submit" name="what" value="'.$entrySB['display_name'].'" /></div>';
		}
	}
	$soundTableContent .= '	</div>
							</div>
							<div class="clear" />';
}
$soundTableContent .= '</div>';

header( 'Content-type: text/json; charset=iso-8859-1' );
die(json_encode(array(utf8_encode($switchesTableContent),utf8_encode($soundTableContent))));

?>
