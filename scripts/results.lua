local block, endsong,cont,restart,leave = true, false, false, false, false

function onCreate()

    makeLuaSprite('resultsBG', 'blackBG', 0, 0)
	setObjectCamera('resultsBG', 'HUD')
	setProperty('resultsBG.alpha', 0)
	addLuaSprite('resultsBG', true);

	if middlescroll and downscroll then		
		down = 550
		hideY = 1000
		elseif downscroll then
		down = 550	
		hideY = 550
		else
		hideY = -200
		end	

end

function onCreatePost()

    makeLuaText('resultTxt', 'RESULTS', 1250, 0, -200);
	makeLuaText('misstxt', '', 1250, 1200, 285);
	makeLuaText('ratingtype', 'RATING', 1250, 0, 1000);	
	makeLuaText('accuracyTxt', '', 1250, -1200, 365);	
	makeLuaText('hitnotes', '', 1250, -1200, 205);	
	makeLuaText('bftxt', 'BOYFRIEND', 1250, -500, 310);	
	makeLuaText('passed', 'HAS PASSED', 1250, 500, 310);	
	makeLuaText('acttxt', ''..getProperty(songName), 1250, 0, 1000);
	makeLuaText('scoretxt', '', 1250, 1200, 440);
		
    setTextSize('resultTxt', 50)
    setTextSize('ratingtype', 50)
    setTextSize('misstxt', 50)	
    setTextSize('accuracyTxt', 50)
    setTextSize('hitnotes', 50)	
    setTextSize('bftxt', 70)	
    setTextSize('passed', 70)	
    setTextSize('acttxt', 70)		
    setTextSize('scoretxt', 50)

    setTextColor('ratingtype', 'fcfc00')
    setTextColor('misstxt', 'fcfc00')
    setTextColor('accuracyTxt', 'fcfc00')
    setTextColor('hitnotes', 'fcfc00')
    setTextColor('bftxt', '1796f3')
    setTextColor('passed', 'f31717')	
    setTextColor('resultTxt', 'fcfc00')
    setTextColor('scoretxt', 'fcfc00')

    setTextFont('resultTxt', 'sonic.otf')
    setTextFont('ratingtype', 'sonic.otf')
    setTextFont('misstxt', 'sonic.otf')
    setTextFont('accuracyTxt', 'sonic.otf')	
    setTextFont('hitnotes', 'sonic.otf')
    setTextFont('bftxt', 'sonic.otf')
    setTextFont('passed', 'sonic.otf')
    setTextFont('acttxt', 'sonic.otf')
    setTextFont('scoretxt', 'sonic.otf')
    
    makeLuaSprite('replay', 'pauseScreen/Restart', 1500, -90)
	makeLuaSprite('exitres', 'pauseScreen/Exit', 1500, -90)
	makeLuaSprite('contres', 'pauseScreen/Continue', 1500, -90)
	makeLuaSprite('cBG', 'pauseScreen/CbutBG', 1500, -50)	
	makeLuaSprite('rBG', 'pauseScreen/RbutBG', 1500, -50)
	makeLuaSprite('eBG', 'pauseScreen/EbutBG', 1500, -50)	
	makeLuaSprite('zig','pauseScreen/zigzag',0,-1200)
	makeLuaSprite('trig','pauseScreen/bottomPanel',1500,30)
	makeLuaSprite('BG1' , 'PauseScreen/txtBG',-1500 ,200);
	makeLuaSprite('BG2', 'PauseScreen/txtBG', 1500,280);
	makeLuaSprite('BG3', 'PauseScreen/txtBG', -1500,360);	
	makeLuaSprite('BG4', 'PauseScreen/txtBG', 1500,440);
	makeLuaSprite('BG5', 'PauseScreen/txtBG', 460,1200);

    scaleObject('BG3',1.1, 1);	
	scaleObject('BG5',0.7, 1.8);
	scaleObject('replay',0.9, 0.9);
	scaleObject('exitres',0.9, 0.9);
	scaleObject('contres',0.9, 0.9);
	scaleObject('cBG',0.9, 0.9);
	scaleObject('rBG',0.9, 0.9);
	scaleObject('eBG',0.9, 0.9);
    
    setObjectCamera('resultTxt', 'other')
	setObjectCamera('ratingtype', 'other')
	setObjectCamera('misstxt', 'other')		
	setObjectCamera('accuracyTxt', 'other')	
	setObjectCamera('hitnotes', 'other')
	setObjectCamera('bftxt', 'other')	
	setObjectCamera('passed', 'other')
	setObjectCamera('acttxt', 'other')	
	setObjectCamera('scoretxt', 'other')

	setObjectCamera('rBG', 'other')
	setObjectCamera('eBG', 'other')
	setObjectCamera('cBG', 'other')		
	setObjectCamera('replay', 'other')	
	setObjectCamera('contres', 'other')
	setObjectCamera('exitres', 'other')	
	setObjectCamera('zig', 'other')
	setObjectCamera('trig', 'other')	
	setObjectCamera('circ', 'other')

	for i = 1,5 do
	setObjectCamera('BG'..i, 'other')
	end	

	addLuaSprite('trig', true);
	addLuaSprite('timeBG', true);
	addLuaSprite('eBG', true);
	addLuaSprite('rBG', true);
	addLuaSprite('cBG', true);	
	addLuaSprite('contres', true);	
	addLuaSprite('exitres', true);
	addLuaSprite('replay', true);

	if isStoryMode then
	cont = true
	else
	restart = true		
	end
end

function getKey(key, pressing)
    key = string.upper(key);
    if key == nil then
    debugPrint('getKey has no key.');
    return false;
elseif pressing == nil then
        pressing = false; -- "pressing" = is the key being pressed right now, "pressed" = was the key last pressed 
end

if pressing then
        return getPropertyFromClass('flixel.FlxG', 'keys.pressed.' .. key); -- clever concatenation
else
        return getPropertyFromClass('flixel.FlxG', 'keys.justPressed.' .. key);
end
    return false; -- if nothing else idk
end

function onUpdate(elapsed)

    if endsong == true then
		checkbutton()
		end
	-- results screen crap

 	if getKey('enter') and endsong == true then
		if cont == true then
			block = false	
			endSong();
			elseif restart == true then
			restartSong()
			elseif leave == true and isStoryMode then
			exitSong()
			elseif leave == true and not isStoryMode then
			block = false
			endSong()	
		end
	end

	if cont == true then
		doTweenY('contTweenY', 'contres', -65, 0.02, 'circInOut')
	
	elseif cont == false then
		setProperty('contres.y', -50)
	end
	if restart == false then
		setProperty('replay.y', -50)

	elseif restart == true then
		doTweenY('replayTweenY', 'replay', -65, 0.02, 'circInOut')
	end
	if leave == false then
		setProperty('exitres.y', -50)

	elseif leave == true then
		doTweenY('exitTweenY', 'exitres', -65, 0.02, 'circInOut')
	end      
end

-- all this is for the results screen lmaooo
function onEndSong()
	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0.8)
	setProperty('vocals.volume', 0)		
 if block == true then
 if week == 'Sunky' then
	setProperty('ratio.visible',false)
	end
	setProperty('inCutscene', true);
 	setGlobalFromScript('scripts/pauseScreen','canPause','false')
	addLuaSprite('zig', true);
	addLuaSprite('circ', true);	
	for i = 1,5 do
	addLuaSprite('BG'..i, true);
	end
	setProperty('timeBG.visible',false)
	setProperty('song.visible',false)
	setProperty('iconP1.visible',false)
	setProperty('iconP2.visible',false)
	setProperty('healthBar.visible',false)
	setProperty('healthBarBG.visible',false)
	setProperty('scoreTxt.visible',false)
	doTweenAlpha('showBG', 'resultsBG', 0.7, 1, 'sineOut')		
    doTweenX('RightTween', 'trig', 600, 0.2, 'backInOut')
	doTweenX('txt1', 'bftxt', -170, 0.4, 'backInOut')
	doTweenX('txt2', 'passed', 170, 0.4, 'backInOut')
	doTweenY('act', 'acttxt',360, 0.4, 'backInOut')
	doTweenY('zag', 'zig',-200, 0.4, 'backInOut')	
	runTimer('Xdone',1)
	for i = 0,9 do
	noteTweenY('p'..i, i,hideY, 0.2 + i/10 , 'elasticOut')
	end	
    addLuaText('resultTxt');
    addLuaText('ratingtype');
    addLuaText('misstxt');
    addLuaText('accuracyTxt');
    addLuaText('hitnotes');
    addLuaText('bftxt');
    addLuaText('passed');
    addLuaText('acttxt');
	addLuaText('scoretxt'); 
	setTextString('scoretxt', 'SCORE: '..score)	
	setTextString('hitnotes', ' NOTES HIT: '..hits)
	setTextString('misstxt', ' MISSES: '..getProperty('songMisses'))	
	setTextString('accuracyTxt','ACCURACY: ' ..(string.sub(getProperty('ratingPercent')* 100,0,5))..'%')
	if	rating >= 0 and rating < 0.5 then
	makeLuaSprite('rating','shit',430,1000)
	elseif	rating >= 0.5 and rating < 0.7 then	
	makeLuaSprite('rating','bad',450,1000)
	elseif	rating >= 0.7 and rating < 1 then	
	makeLuaSprite('rating','good',450,1000)
	else	
	makeLuaSprite('rating','sick',450,1000)	
	end
	screenCenter('rating','X')
	scaleObject('rating',0.9,0.9)
	setObjectCamera('rating','other')
	addLuaSprite('rating',true)
		return Function_Stop; --prevents song end
	end
	return Funtion_Continue; --allows song end
	end
	function onTimerCompleted(tag, loops, loopsLeft)	
	if tag == 'Xdone' then
	doTweenY('txt3', 'bftxt', 10, 0.4, 'linear')
	doTweenY('txt4', 'passed', 10, 0.4, 'linear')
	doTweenY('act2', 'acttxt',60, 0.4, 'linear')	
	end
	if tag == 'resdone' then
	doTweenX('BG1X', 'BG1', 420, 0.4, 'backInOut')
	doTweenX('BG2X', 'BG2', 420, 0.6, 'backInOut')
	doTweenX('BG3X', 'BG3',398, 0.8, 'backInOut')
	doTweenX('BG4X', 'BG4',420, 1, 'backInOut')
	doTweenY('BG5X', 'BG5',520, 1.2, 'backInOut')	
	doTweenX('txt1', 'hitnotes', 0, 0.4, 'backInOut')
	doTweenX('txt2', 'misstxt', 0, 0.6, 'backInOut')
	doTweenX('act1', 'accuracyTxt',0, 0.8, 'backInOut')
	doTweenX('act2', 'scoretxt',0, 1, 'backInOut')
	doTweenY('act3', 'ratingtype',510, 1.2, 'backInOut')	
		end
	end

	function onTweenCompleted(tag)		
	if tag == 'txt4' then
	runTimer('resdone',1)
	doTweenY('res', 'resultTxt', 140, 0.5, 'linear')

	elseif tag == 'zag' then
	setProperty('zig.y', -205)
	doTweenY('moveY1', 'zig', 0, 1, 'linear')	


	elseif tag == 'moveY1' then
	setProperty('zig.y', -205)
	doTweenY('zag', 'zig', 0, 1, 'linear')

	elseif tag == 'BG5X' then
	doTweenY('rateimg', 'rating',560, 0.6, 'linear')


	elseif tag == 'rateimg' then
	if	rating >= 0 and rating < 0.5 then

	playSound('shit',1,'rateping')
	elseif	rating >= 0.5 and rating < 0.7 then	
	playSound('shit',1,'rateping')
	elseif	rating >= 0.7 and rating < 1 then	
	playSound('good',1,'rateping')
	else	
	playSound('sick',1,'rateping')
	end
	endsong = true
	if isStoryMode then
	doTweenX('contTween', 'contres', 956, 0.2, 'linear')
	doTweenX('c1Tween', 'cBG', 956, 0.2, 'linear')	
	end
	doTweenX('replayTween', 'replay', 868, 0.2, 'linear')
	doTweenX('exitTween', 'exitres', 776, 0.2, 'linear')
	doTweenX('r1Tween', 'rBG', 868, 0.2, 'linear')
	doTweenX('e1ween', 'eBG', 776, 0.2, 'linear')	
	end
	end


	function checkbutton()
	if keyJustPressed('down') and endsong == true then
		playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')		
		if cont == true then
			restart = true
			leave = false
			cont = false
		elseif restart == true then
			leave = true
			restart = false
			cont = false
	elseif leave == true then
	
	if isStoryMode then
			leave = false
			restart = false
			cont = true
	else
			leave = false
			restart = true
			cont = false		
			end
			end
	elseif keyJustPressed('up') and endsong == true then
		playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')		
		if cont == true then
			restart = false
			leave = true
			cont = false
		elseif leave == true then
			leave = false
			restart = true
		elseif restart == true then
		if isStoryMode then
			leave = false
			restart = false
			cont = true	
	else
			leave = true
			restart = false		
			end
		end
	end
	end