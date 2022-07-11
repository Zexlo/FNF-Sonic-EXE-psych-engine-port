function onCreate()
  addCharacterToList('Fleetway1', 'dad');
  addCharacterToList('Fleetway2', 'dad');
  addCharacterToList('Fleetway3', 'dad');
  addCharacterToList('bf-super', 'bf');
  precacheImage('chaos/Lewis Porker');

       setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-fleetway-die'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ''); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
    precacheImage('black');

	precacheImage('StartScreens/CircleCycles');
	precacheImage('StartScreens/TextCycles');

        makeLuaSprite('credbox', 'box', 380, -1280);
         scaleObject('credbox', 1.2, 1.3);
	addLuaSprite('credbox', true);
	
       makeLuaText('credits', 'CREDITS', 730, 250, -1280)
       setTextSize('credits', 30)
       addLuaText('credits')
       makeLuaText('code', 'CODE', 730, 250, -1280)
         setTextSize('code', 30)
         addLuaText('code')
       makeLuaText('jakie', 'Avery', 730, 250, -1280)
          setTextSize('jakie', 30)
          addLuaText('jakie')
       makeLuaText('art', 'Nebula', 730, 250, -1280)
          setTextSize('art', 30)
          addLuaText('art')
       makeLuaText('bun', 'Crybit', 730, 250, -1280)
          setTextSize('bun', 30)
          addLuaText('bun')
       makeLuaText('co', 'ARTWORK', 730, 250, -1280)
          setTextSize('co', 30)
          addLuaText('co')
       makeLuaText('music', 'Rightburst Ultra', 730, 250, -1280)
          setTextSize('music', 30)
          addLuaText('music')
       makeLuaText('mar', 'Zekuta', 730, 250, -1280)
          setTextSize('mar', 30)
          addLuaText('mar')
       makeLuaText('sas', 'cogaming', 730, 250, -1280)
          setTextSize('sas', 30)
          addLuaText('sas')
       makeLuaText('chart', 'MUSIC', 730, 250, -1280)
          setTextSize('chart', 30)
          addLuaText('chart')
     makeLuaText('jac', 'jacaris', 730, 250, -1280)
          setTextSize('jac', 30)
          addLuaText('jac')
     makeLuaText('title', 'CHARTING', 730, 250, -1280)
          setTextSize('title', 30)
          addLuaText('title')
     makeLuaText('wild', 'Wilde', 730, 250, -1280)
          setTextSize('wild', 30)
          addLuaText('wild')
            
          	setObjectCamera('credbox', 'hud');

	startTime = 0.3;
	runTimer('slidedown', startTime+1);
	runTimer('beginsong', startTime);
	runTimer('slideup', startTime+6);
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'fadeout' then
		doTweenAlpha('fadeblack', 'black', 0, 2, 'sineOut');
		doTweenAlpha('fadecircle', 'circle', 0, 2, 'sineOut');
		doTweenAlpha('fadetext', 'text', 0, 2, 'sineOut')
	end
	if tag == 'slidedown' then
doTweenY('move', 'credits', 50, 1, 'linear');
doTweenY('move1', 'credbox', 0, 1, 'linear');
doTweenY('move2', 'code', 120, 1, 'linear');
doTweenY('move3', 'jakie', 150, 1, 'linear');
doTweenY('move4', 'art', 180, 1, 'linear');
doTweenY('move5', 'bun', 210, 1, 'linear');
doTweenY('move6', 'co', 270, 1, 'linear');
doTweenY('move7', 'music', 310, 1, 'linear');
doTweenY('move8', 'mar', 350, 1, 'linear');
doTweenY('move10', 'sas', 380, 1, 'linear');
doTweenY('move11', 'chart', 440, 1, 'linear');
doTweenY('move12', 'jac', 470, 1, 'linear');
doTweenY('move13', 'title', 530, 1, 'linear');
doTweenY('move14', 'wild', 570, 1, 'linear');



end
	if tag == 'beginsong' then
		allowCountdown = true;
		startCountdown();
	end
       if tag == 'slideup' then
       doTweenY('move', 'credits', -1280, 1, 'linear');
     doTweenY('move1', 'credbox', -1280, 1, 'linear');         
       doTweenY('move2', 'code', -1280, 1, 'linear');
       doTweenY('move3', 'jakie', -1280, 1, 'linear');          
       doTweenY('move4', 'art', -1280, 1, 'linear');
       doTweenY('move5', 'bun', -1280, 1, 'linear');                 
       doTweenY('move6', 'co', -1280, 1, 'linear');
     doTweenY('move7', 'music', -1280, 1, 'linear');
     doTweenY('move8', 'mar', -1280, 1, 'linear');
     doTweenY('move10', 'sas', -1280, 1, 'linear');
     doTweenY('move11', 'chart', -1280, 1, 'linear');
  doTweenY('move12', 'jac', -1280, 1, 'linear');
  doTweenY('move13', 'title', -1280, 1, 'linear');
  doTweenY('move14', 'wild', -1280, 1, 'linear');

       end
end
function onStartCountdown()
	if not allowCountdown then
		return Function_Stop;
	end
	return Function_Continue;
end

function onUpdate(elapsed)
  setProperty('dad.y', defaultOpponentY + math.sin( getPropertyFromClass('Conductor', 'songPosition')/crochet )*100 );
 end

