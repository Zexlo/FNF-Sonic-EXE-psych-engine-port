function onCreate()
addCharacterToList('SonicFunAssets', 'dad');
   addCharacterToList('SonicPixel', 'dad');
    addCharacterToList('BOYFRIEND', 'bf');
   addCharacterToList('PBF', 'bf');

	setPropertyFromClass('GameOverSubstate', 'characterName', 'Majinbf'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ''); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

	end