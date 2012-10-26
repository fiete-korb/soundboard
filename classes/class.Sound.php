<?php 

require_once ('../classes/class.SoundPlayer.php');

class Soundfile
{
	private $pathToSoundFile = '/var/www/sounds/';
	private $name = '';
	private $player;
	
	public function __construct($soundName)
	{
		$this->name = $soundName;
	}
	
	public function playSound()
	{
		$this->player = new SoundPlayer($this);
		$this->player->play($this);
	}		
}

?>