function onEvent(name, value1, value2)
    
if name == "text" then
 
makeLuaText('txt', 'blank', 400, 400, 500)
setTextSize('txt', 30)
setTextString('txt', value1)
setTextAlignment('txt', 'center')
addLuaText('txt')
doTweenX('txt', 'Text', 1.5, 1, 'elasticInOut')

runTimer('remove',value2,1);
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'remove' then
removeLuaText("txt", true)          
end
end
end