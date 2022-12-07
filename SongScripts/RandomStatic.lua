timerInterval = 0.25; -- check random number every [timerInterval] seconds forever
chanceOfStatic = 10; -- percentage of chance of static trigger
staticSpeed = 48; -- frames per second of static, 48 = 2x speed

function onCreate()
    makeAnimatedLuaSprite('StaticRand', 'screenSTATIC', 0, 0); -- init static sprite 
    addAnimationByPrefix('StaticRand', 'idle', 'screenSTATIC', staticSpeed, false); -- init animation
    addLuaSprite('StaticRand', true); -- add sprite
    setObjectCamera('StaticRand', 'hud'); -- center sprite, over stage

    math.randomseed(os.time()); -- set rng seed according to system time
end

function onSongStart() -- right after countdown finish
    runTimer('TrigRand', timerInterval, 0); -- infinite timer, trigger onTimerCompleted every [timerInterval]
end

function onPause()
    cancelTimer('TrigRand'); -- stop the static effect in the pause screen
    return Function_Continue; -- don't interrupt the pause screen
end

function onResume()
    runTimer('TrigRand', timerInterval, 0); -- resume timer after unpause
end

--[[
    every frame is way too fucking fast and not consistent due to different framerates across platforms and players
    so we use timers to slow it down to a controlled interval, and it is consistent because it is a measured amount of time
]] 
function onTimerCompleted(tag, loops, loopsLeft) 
    if tag == 'TrigRand' then -- don't trigger on other timers
        rand = math.random()*100;
        if rand <= chanceOfStatic then
            objectPlayAnimation('StaticRand', 'idle', true); -- play the static, true is to interrupt the previous animation
        end
    end
end

function onDestroy() -- on song end, stop timer
    cancelTimer('TrigRand');
end

-- this will be ported to a custom event that can be started on demand... because this is just song event code