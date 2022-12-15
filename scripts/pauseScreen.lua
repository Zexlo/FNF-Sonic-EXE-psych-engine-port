fakePaused = false
cSelected = false
rSelected = false
eSelected = false

canPause = true




function onGameOver()

canPause = false



end


function onPause()
	return Function_Stop;
end



function onCreate()
	luaDebugMode = true
	precacheSound('pauseSounds/pause')
	precacheSound('pauseSounds/ScrollMenu')
	precacheSound('pauseSounds/unpause')
	makeLuaSprite('blackbox', 'blackBG', 0, 0)
	setObjectCamera('blackbox', 'camOther')
	setProperty('blackbox.alpha', 0.7)
	setProperty('blackbox.visible', false)
	makeLuaSprite('pauseRight', 'pauseScreen/pauseRight', 1500, 30)
	setObjectCamera('pauseRight', 'camOther')
	makeLuaSprite('pauseLeft', 'pauseScreen/pauseLeft', -800, 0)
	setObjectCamera('pauseLeft', 'camOther')
	makeLuaSprite('Timer', '', -1007, 203)
	makeGraphic('Timer', 390, 11, 'FF0000')
	setObjectCamera('Timer', 'camOther')
	makeLuaSprite('continue', 'pauseScreen/Continue', 1500, 0)
	setObjectCamera('continue', 'camOther')
	makeLuaSprite('restart', 'pauseScreen/Restart', 1500, 0)
	setObjectCamera('restart', 'camOther')
	makeLuaSprite('exit', 'pauseScreen/Exit', 1500, 0)
	setObjectCamera('exit', 'camOther')
	makeLuaSprite('fadeBG', 'simplejump', 0, 0)
	scaleObject('fadeBG', 0.7, 0.7); 
	setProperty('fadeBG.alpha', 0)
	
	addLuaSprite('blackbox', true)
	addLuaSprite('pauseRight', true)
	addLuaSprite('pauseLeft', true)
	addLuaSprite('Timer', true)
	addLuaSprite('continue', true)
	addLuaSprite('restart', true)
	addLuaSprite('exit', true)
	addLuaSprite('fadeBG', true)
end
function onCreatePost()
	
if songName == 'Sunshine' or songName == 'Soulless' then
makeLuaSprite('disk', 'covers/Tdoll', -800, 250)

elseif songName == 'Too slow' then
makeLuaSprite('disk', 'covers/tooslow', -800, 250)

elseif songName == 'Milk' or songName == 'New Milk' then
makeLuaSprite('disk', 'covers/milk', -800, 250)

elseif songName == 'Cycles' or songName == 'Execution' or songName == 'Cycles Remastered' then
makeLuaSprite('disk', 'covers/lordX', -800, 250)

elseif songName == 'Endless' or songName == 'Endless og' then
makeLuaSprite('disk', 'covers/endless', -800, 250)

elseif songName == 'Too Fest' or songName == 'Too Fest OG' then
makeLuaSprite('disk', 'covers/toofest', -800, 250)

elseif songName == 'Chaos' then
makeLuaSprite('disk', 'covers/chaos', -800, 250)

elseif songName == 'Prey' then
makeLuaSprite('disk', 'covers/blankrecord', -800, 250)

elseif songName == 'Fight or Flight' then
makeLuaSprite('disk', 'covers/blankrecord', -800, 250)

elseif songName == 'Substantial' or songName == 'Digitalized' then
makeLuaSprite('disk', 'covers/blankrecord', -800, 250)

elseif songName == 'personel' then
makeLuaSprite('disk', 'covers/DONOTSTEEL', -800, 250)

else
makeLuaSprite('disk', 'covers/cantrun', -800, 250)
	end



	scaleObject('disk', 0.28, 0.28); 	
	setObjectCamera('disk', 'other')
	addLuaSprite('disk')
	setObjectOrder('disk', getObjectOrder('pauseLeft')+1)
	setProperty('disk.angle', 180)	

end	
function onUpdatePost(elapsed)


if keyJustPressed('back') and getPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false) then
setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true);
end

	if keyJustPressed('accept') and fakePaused == false and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and canPause then
		playSound('pauseSounds/pause', 0.8, 'pause')		
		doTweenX('pauseRightTween', 'pauseRight', 600, 0.2, 'linear')
		doTweenX('fixtimebar', 'timeBar', 450, 0.2, 'linear')
		doTweenY('fixtimebar2', 'timeBar', 30, 0.2, 'linear')
		doTweenX('pauseLeftTween', 'pauseLeft', 0, 0.2, 'linear')
		doTweenX('TimerTween', 'Timer', 207, 0.2, 'linear')
		doTweenX('diskTween', 'disk', 65, 0.6, 'smoothStepIn')
		doTweenAngle('diskTweenAng', 'disk', 0, 1, 'circInOut')
		doTweenX('cTween', 'continue', 900, 0.2, 'linear')
		doTweenX('rTween', 'restart', 818, 0.2, 'linear')
		doTweenX('eTween', 'exit', 736, 0.2, 'linear')
		cSelected = true
		rSelected = false
		eSelected = false
		fakePaused = true		
	elseif keyJustPressed('accept') and fakePaused == true and not getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and canPause then
		plsHelp()
	end
	
	
	if cSelected == false then
		setProperty('continue.y', 0)
	end
	if cSelected == true then
        doTweenAngle('rotate', 'disk', 0, 0.02, 'smoothStepIn')	
		doTweenY('cTweenY', 'continue', -15, 0.02, 'circInOut')
	end
	if rSelected == false then
		setProperty('restart.y', 0)
	end
	if rSelected == true then
	doTweenAngle('rotate1', 'disk', -360, 0.02, 'smoothStepIn')
		doTweenY('rTweenY', 'restart', -15, 0.02, 'circInOut')
	end
	if eSelected == false then
		setProperty('exit.y', 0)
	end
	if eSelected == true then
doTweenAngle('rotate2', 'disk', 360, 0.02, 'smoothStepIn')	
		doTweenY('eTweenY', 'exit', -15, 0.02, 'circInOut')
	end

	--hi im coffeedev
	
	if fakePaused == true then
	
		setProperty('blackbox.visible', true)
		setPropertyFromClass('Conductor', 'songPosition', getPropertyFromClass('Conductor', 'songPosition') - elapsed * 1000  ) -- it is counted by milliseconds, 1000 = 1 second
		setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition'))
		setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition'))
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		
	elseif fakePaused == false and canPause then
		setProperty('blackbox.visible', false)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		
	end
	scaleObject('Timer', 1 * getProperty("songPercent"), 1)
	damnIWannaDie()

    end
function damnIWannaDie()
	if keyJustPressed('down') and fakePaused == true then
		if cSelected == true then
			cSelected = false
			rSelected = true
			playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')
		elseif rSelected == true then
			rSelected = false
			eSelected = true
			playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')
		elseif eSelected == true then
			eSelected = false
			cSelected = true
			playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')
		end
	elseif keyJustPressed('up') and fakePaused == true then
		if cSelected == true then
			cSelected = false
			eSelected = true
			playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')
		elseif rSelected == true then
			rSelected = false
			cSelected = true
			playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')
		elseif eSelected == true then
			eSelected = false
			rSelected = true
			playSound('pauseSounds/ScrollMenu', 0.3, 'pausescroll')
		end
	end
end
function plsHelp()
	if cSelected == true then
		playSound('pauseSounds/unpause', 1, 'unpause')
		setProperty('vocals.volume', 1)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1)
		doTweenX('fixtimebar3', 'timeBar', 450, 0.2, 'linear')
		doTweenY('fixtimebar4', 'timeBar', 30, 0.2, 'linear')
		doTweenY('fixtimebar5', 'timeBar', 30, 0.2, 'linear')
		doTweenX('pauseRightTween2', 'pauseRight', 1500, 0.2, 'linear')
		doTweenX('pauseLeftTween2', 'pauseLeft', -800, 0.2, 'linear')
		doTweenX('TimerTween2', 'Timer', -800, 0.2, 'linear')
		doTweenX('cTween2', 'continue', 1500, 0.2, 'linear')
		doTweenX('rTween', 'restart', 1500, 0.2, 'linear')
		doTweenX('eTween', 'exit', 1500, 0.2, 'linear')
		doTweenX('diskTween', 'disk', -800, 1, 'circInOut')
		doTweenAngle('diskTweenAng', 'disk', 180, 1, 'circInOut')
		cSelected = false
		rSelected = false
		eSelected = false
		fakePaused = false
	elseif rSelected == true then
		restartSong(true);
	elseif eSelected == true then
	setObjectCamera('fadeBG', 'camOther')
	playSound('pauseSounds/exit', 1, 'exit')
			doTweenAlpha('fade', 'fadeBG', 1, 1.2, 'linear')
	end
end

function onTweenCompleted(tag)		
if tag == 'fade' then
		exitSong(true)
	end
	end