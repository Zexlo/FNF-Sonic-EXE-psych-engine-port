local bfx = 200;
local bfy = 0;
local zoomshit = 0;

function onCreate()
    makeLuaSprite('credbox', 'box', 380, -1280);
    scaleObject('credbox', 1.2, 1.3);
	addLuaSprite('credbox', true);
	
       makeLuaText('credits', 'CREDITS', 730, 250, -1280);
       setTextSize('credits', 40);
       makeLuaText('code', 'CODE', 730, 250, -1280);
         setTextSize('code', 40);
       makeLuaText('jakie', 'Jackie.exe', 730, 250, -1280);
          setTextSize('jakie', 40);
       makeLuaText('charter', 'CHARTING', 730, 250, -1280);
          setTextSize('charter', 40);
       makeLuaText('Nif', 'Niffirg', 730, 250, -1280);
          setTextSize('Nif', 40);
       makeLuaText('art', 'ARTWORK', 730, 250, -1280);
          setTextSize('art', 40);
       makeLuaText('co', 'Cogaming_Nz', 730, 250, -1280);
          setTextSize('co', 40);
       makeLuaText('Stank', 'Stankfield', 730, 250, -1280);
          setTextSize('Stank', 40);
       makeLuaText('Music', 'MUSIC', 730, 250, -1280);
          setTextSize('Music', 40);
       makeLuaText('mouse', 'Squeak', 730, 250, -1280);
          setTextSize('mouse', 40);
		 
          addLuaText('credits');
          addLuaText('code');
          addLuaText('jakie');
          addLuaText('charter');
          addLuaText('Nif');
          addLuaText('art');
          addLuaText('co');	 
          addLuaText('Stank');
		  addLuaText('Music');
          addLuaText('mouse');
       
	setObjectCamera('credbox', 'hud');

	startTime = 0.3;

	runTimer('slidedown', startTime+3);
	runTimer('slideup', startTime+9);
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'slidedown' then
doTweenY('move', 'credits', 50, 1, 'linear');
doTweenY('move1', 'credbox', 0, 1, 'linear');
doTweenY('move2', 'code', 150, 1, 'linear');
doTweenY('move3', 'jakie', 200, 1, 'linear');
doTweenY('move4', 'charter', 270, 1, 'linear');
doTweenY('move5', 'Nif', 320, 1, 'linear');
doTweenY('move7', 'art', 380, 1, 'linear');
doTweenY('move8', 'co', 420, 1, 'linear');
doTweenY('move10', 'Stank', 470, 1, 'linear');
doTweenY('move11', 'Music', 530, 1, 'linear');
doTweenY('move12', 'mouse', 580, 1, 'linear');

end
       if tag == 'slideup' then
       doTweenY('move', 'credits', -1280, 1, 'linear');
     doTweenY('move1', 'credbox', -1280, 0.4, 'linear');         
     doTweenY('move2', 'code', -1280, 1, 'linear');
     doTweenY('move3', 'jakie', -1280, 1, 'linear');          
     doTweenY('move4', 'charter', -1280, 1, 'linear');
     doTweenY('move5', 'Nif', -1280, 1, 'linear');                 
     doTweenY('move7', 'art', -1280, 1, 'linear');
     doTweenY('move8', 'co', -1280, 1, 'linear');
     doTweenY('move10', 'Stank', -1280, 1, 'linear');
     doTweenY('move11', 'Music', -1280, 1, 'linear');
     doTweenY('move12', 'mouse', -1280, 1, 'linear');
     removeLuaText('credits', true);
     removeLuaText('code', true);
     removeLuaText('jakie', true);
     removeLuaText('charter', true);
     removeLuaText('Nif', true);
     removeLuaText('art', true);
     removeLuaText('co', true);
     removeLuaText('Stank', true);
     removeLuaText('Music', true);
     removeLuaText('mouse', true);
       end
end

 function onGameOver()
setObjectCamera('boyfriend', 'hud');
return Function_Continue;
 end