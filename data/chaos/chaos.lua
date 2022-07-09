-- Lua stuff
function onCreate()
	-- triggered when the lua file is started

	-- create a lua sprite called "Porker" which is the tag used in the script to refer the image and it anim to
	makeAnimatedLuaSprite('Porker', 'Lewis Porker', 1550, -800); --majing FG2 is the filename in mod/images so change it to your image (it needs to have an XML for its anims)
	addAnimationByPrefix('Porker', 'first', 'PorkerFG', 24, false); --first is just the anim tag in lua it can be whatever, PorkerFG is the animation name from the XML sheet
	objectPlayAnimation('Porker', 'first');
	addLuaSprite('Porker', true); -- false = add behind characters in the BG, true = add in front characters, the characters will appear behind these sprites acting as a front layer
end

-- Gameplay interactions
function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0 then
		objectPlayAnimation('Porker', 'first');
	end
end

function onStepHit()
	-- triggered 16 times per section
	setProperty('Porker.scale.x', getProperty('Porker.scale.x') + 0.00); -- if you change the value it will grow in size without stopping so DO NOT edit the value (idk if removing this will break it im too lazy
end

function onCountdownTick(counter) -- rest of this SHOULD NOT be changed
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter % 2 == 0 then
		objectPlayAnimation('Porker', 'first'); 
	end
end