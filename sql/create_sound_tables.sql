	CREATE TABLE `sound_categories` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`name` TEXT NOT NULL,
	PRIMARY KEY (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=12;

	
	insert into sound_categories (name) VALUES ('SuperMario');
insert into sound_categories (name) VALUES ('FunSound');
insert into sound_categories (name) VALUES ('LittleBritain');
insert into sound_categories (name) VALUES ('Frauentausch');
insert into sound_categories (name) VALUES ('ITCrowd');
insert into sound_categories (name) VALUES ('Animals'); 
insert into sound_categories (name) VALUES ('Gollum'); 
insert into sound_categories (name) VALUES ('VickyPollard'); 
insert into sound_categories (name) VALUES ('JD');
insert into sound_categories (name) VALUES ('Rambo'); 
insert into sound_categories (name) VALUES ('Blame');
	
CREATE TABLE `soundfiles` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`display_name` TEXT NOT NULL,
	`file_name` TEXT NOT NULL,
	`cat` INT(11) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `FK_soundfiles_sound_categories` (`cat`),
	CONSTRAINT `FK_soundfiles_sound_categories` FOREIGN KEY (`cat`) REFERENCES `sound_categories` (`id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=76;


	
	
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Jeopardy', 'jeopardy_theme.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Star Trek red alert', 'red_alert.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Darth Vader', 'imperial_march.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Zonk', 'zonk.ogg');
		
		
		
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'HA HA', 'nelson.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Ruhe im Puff', 'stromberg_ruhe.ogg');
	
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'Schwazzen Bildschirm', 'schwazzen_bildschirm.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'Screw you guys', 'screw_you_guys.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'I have made fire', 'made_fire.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'On Off', 'on_off.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'Scheissding', 'scheissding.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Wunderbar', 'wunderbar.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Bazinga', 'bazinga.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'Halt Stop', 'halt_stop.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Kette ab', 'kette.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'yep yep', 'yepyep.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'to my hand', 'talk2thehand.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (11, 'failed', 'fail.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'I dont speak spanish!', 'dontspeakspanish.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'guten morgen...', 'guten_morgen.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'cindy ringtone', 'cancan.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'ralph', 'ente.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'aufs klo', 'gutenmorgenmaenner.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'wunderschön', 'wunderschoen.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'blbblblblbbb', 'toungesound.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'du bist böse!', 'bad_remulan.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'hau ab', 'rambo/hau_ab.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'angst!', 'rambo/angst.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'nur eier machen', 'rambo/eier_braten.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'keine eier!', 'rambo/keine_eier.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'mache eier!', 'rambo/mach_eier.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'bild fort', 'rambo/bild_fort.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'olé', 'rambo/lachscarpaccio.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (10, 'ich bin bauchredner', 'rambo/bauchredner.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (9, 'FATAAAL!', 'fataaal.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'Du Klauschwein!', 'gollum/du_klauschwein.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'Komm nie wieder', 'gollum/gollum_get_away.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'ich hör nicht zu', 'gollum/gollum_not_listen.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'das war ich!', 'gollum/gollum_was_me.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'deins', 'gollum/mache_de_augen_zu.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'nachm idioten gucken', 'gollum/nach_idioten_gucken.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (7, 'scheiße junge!', 'gollum/scheisse_junge.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'ihr schweine habt', 'gotye/ihr_habt_mich_angemalt.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'ich fand dich eigentlich ganz süß', 'gotye/ich_fand_dich_ganz_suess.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (6, 'dolphin', 'dolphinsound.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (6, 'krähhh', 'crowsound.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'blitzolli', 'timeforblitzkrieg.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (8, 'schnurrbart', 'vicky/denschnurrbartfaerben.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (8, 'fischladen', 'vicky/fischladen.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (8, 'jabaernein', 'vicky/jabaernein.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (8, 'kopfschmaerzen', 'vicky/kopfschmaerzen.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (8, 'nichtsgesagt', 'vicky/nichtsgesagt.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (8, 'wasdudaredest', 'vicky/wasdudaredest.OGG');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'essenkommen', 'essenkommen.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (5, 'have u tried?', 'itcrowd/turn_off_and_on.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (5, 'turn it on again!', 'itcrowd/turn_it_back_on_again.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (5, 'have u tried 2?', 'itcrowd/stick_it_up_the_arse.OGG');

		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'ans been pissen', 'frauentausch/an_been_pissen.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'fremde schuhe', 'frauentausch/fremde_schuhe.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'furchtbar, ich grieg det kotzen', 'frauentausch/furchtbar_ich_grieg_det_kotzen.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'hier geh ich nicht rein', 'frauentausch/hier_geh_ich_nicht_rein.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'schlecht1', 'frauentausch/mir_wird_jetzt_schon_schlecht.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'schlecht2', 'frauentausch/mir_wird_nur_schlecht_hier.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'saumaesig', 'frauentausch/saumaesig.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (4, 'unordentlicher mensch', 'frauentausch/unordentlicher_mensch.OGG');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (3, 'wie war das?', 'fatfighters/wie_war_das.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (3, 'frau löwe', 'fatfighters/frau_loewe.OGG');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'wer hat an der uhr gedreht?', 'schon_so_spaet.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'SUPPPORT, HELP!', 'flash1.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'Hirn geht nicht!!', 'brain_defect.ogg');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, '15khz', '15kHz_Frequenz.wav');
		insert into soundfiles (cat,display_name,file_name) VALUES (2, 'kalter Wind', 'kalterwind.ogg');
		
		insert into soundfiles (cat,display_name,file_name) VALUES (1, 'mario theme', 'mario/mario_main.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (1, 'bad', 'mario/mario_bad.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (1, 'levelup', 'mario/mario_levelup.OGG');
		insert into soundfiles (cat,display_name,file_name) VALUES (1, 'fast', 'mario/mario_fast.OGG')
		