function onCreate()
 addCharacterToList('Tails_Doll_Alt', 'dad');
 addCharacterToList('SSBF_Assets', 'bf');
  addCharacterToList('3DGO', 'bf');


	setPropertyFromClass('GameOverSubstate', 'characterName', '3DGO'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ''); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', ''); --put in mods/music/
    precacheImage('black');

        makeLuaSprite('credbox', 'box', 390, -1280);
         scaleObject('credbox', 1.2, 1.3);
	addLuaSprite('credbox', true);

        makeLuaSprite('ready', 'countdown/ready', 340,240);
	scaleObject('ready', 0.8, 0.8);        
	addLuaSprite('ready', true);
	
      makeLuaSprite('set', 'countdown/set', 340, 240);
	scaleObject('set', 0.8, 0.8);      
       setProperty('set.alpha', 0);      
	addLuaSprite('set', true);
	
      makeLuaSprite('go', 'countdown/go', 350, 210);
      	scaleObject('go', 0.9, 0.9);
             setProperty('go.alpha', 0);
	addLuaSprite('go', true);

      	makeLuaSprite('filter', 'grain',0, 0);
       setProperty('filter.alpha', 0.1);      	
	scaleObject('filter', 2.8, 2.5);
	addLuaSprite('filter', true);	
	
       makeLuaText('credits', 'CREDITS', 770, 250, -1280)
       setTextSize('credits', 30)
       addLuaText('credits')
       makeLuaText('code', 'CODE', 770, 250, -1280)
         setTextSize('code', 30)
         addLuaText('code')
       makeLuaText('jakie', 'Jackie.exe', 770, 250, -1280)
          setTextSize('jakie', 30)
          addLuaText('jakie')
       makeLuaText('art', 'CryBit', 770, 250, -1280)
          setTextSize('art', 30)
          addLuaText('art')
       makeLuaText('bun', 'ARTWORK', 770, 250, -1280)
          setTextSize('bun', 30)
          addLuaText('bun')
       makeLuaText('co', 'Zekuta', 770, 250, -1280)
          setTextSize('co', 30)
          addLuaText('co')
       makeLuaText('music', 'MUSIC', 770, 250, -1280)
          setTextSize('music', 30)
          addLuaText('music')
       makeLuaText('mar', 'MarStarBro', 770, 250, -1280)
          setTextSize('mar', 30)
          addLuaText('mar')
       makeLuaText('sas', 'Uptaunt', 770, 250, -1280)
          setTextSize('sas', 30)
          addLuaText('sas')
       makeLuaText('chart', 'CHARTING', 770, 250, -1280)
          setTextSize('chart', 30)
          addLuaText('chart')     
      makeLuaText('niff', 'niffirg', 770, 250, -1280)
          setTextSize('niff', 30)
          addLuaText('niff')
      makeLuaText('cry', 'CryBit', 770, 250, -1280)
          setTextSize('cry', 30)
          addLuaText('cry')

	setObjectCamera('credbox', 'hud');
	setObjectCamera('ready', 'hud');
	setObjectCamera('set', 'hud');
	setObjectCamera('go', 'hud');
	setObjectCamera('filter', 'hud');		
	
               
    	startTime = 0.3;
      
          	runTimer('slidedown', startTime+2);
          runTimer('beginsong', startTime-0.3);
      runTimer('wait', startTime+1.2);
      runTimer('wait1', startTime+2.2);
      runTimer('hidego', startTime+2.9); 
	runTimer('slideup', startTime+7);	
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'beginsong' then
		allowCountdown = true;
		startCountdown();
       playSound('ready');     
   end
	if tag == 'wait' then
    setProperty('ready.alpha', 0);	
       setProperty('set.alpha', 1);	              
      playSound('set');
    end       
	if tag == 'wait1' then
   setProperty('set.alpha', 0);	
       setProperty('go.alpha', 1);       
      playSound('go');
end
if tag == 'hidego' then
      setProperty('go.alpha', 0);
      end	       

	if tag == 'slidedown' then	
doTweenY('move', 'credits', 50, 1, 'linear');
doTweenY('move1', 'credbox', 0, 1, 'linear');
doTweenY('move2', 'code', 150, 1, 'linear');
doTweenY('move3', 'jakie', 200, 1, 'linear');
doTweenY('move4', 'art', 230, 1, 'linear');
doTweenY('move5', 'bun', 280, 1, 'linear');
doTweenY('move6', 'co', 310, 1, 'linear');
doTweenY('move13', 'cry', 340, 1, 'linear');
doTweenY('move7', 'music', 390, 1, 'linear');
doTweenY('move8', 'mar', 420, 1, 'linear');
doTweenY('move10', 'sas', 450, 1, 'linear');
doTweenY('move11', 'chart', 500, 1, 'linear');
doTweenY('move12', 'niff', 530, 1, 'linear');
end
	       if tag == 'slideup' then
       doTweenY('move', 'credits', -1280, 1, 'linear');
     doTweenY('move1', 'credbox', -1280, 0.4, 'linear');
       doTweenY('move2', 'code', -1280, 1, 'linear');
       doTweenY('move3', 'jakie', -1280, 1, 'linear');          
       doTweenY('move4', 'art', -1280, 1, 'linear');
       doTweenY('move5', 'bun', -1280, 1, 'linear');                 
       doTweenY('move6', 'co', -1280, 1, 'linear');
     doTweenY('move7', 'music', -1280, 1, 'linear');
     doTweenY('move8', 'mar', -1280, 1, 'linear');
     doTweenY('move10', 'sas', -1280, 1, 'linear');
     doTweenY('move11', 'chart', -1280, 1, 'linear');
doTweenY('move12', 'niff', -1280, 1, 'linear');
doTweenY('move13', 'cry', -1280, 1, 'linear');

       end
end
function onStartCountdown()
	if not allowCountdown then
		return Function_Stop;
	end
	return Function_Continue;
end
function onUpdate(elasped)
doTweenColor('ColorTween', 'timeBar', 'E69138', 1, 'linear')
end