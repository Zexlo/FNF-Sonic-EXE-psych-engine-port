function onCreate()
    makeAnimatedLuaSprite('wavBG', 'curse/STATIC', -500, 0); 
    addAnimationByPrefix('wavBG', 'first', 'staticBackground', 24, true); --XML sheet anim name
    playAnim('wavBG', 'first',false);
    scaleObject('wavBG',1.2,1.2)
    doTweenColor(ourple,'wavBG','5d67c2',0.2,'linear')
    end
    
function onUpdate(elapsed)
    doTweenColor('ColorTween', 'timeBar', '4a57c2', 1, 'linear')
    if curStep >= 181 and curStep <=184 then
        doTweenZoom('wee', 'camGame', 1.3, 0.5, 'linear');
        end
    
        if curStep >= 10 then
            setTextColor('txt', '4a57c2')
                end 

    if curBeat >= 183 and curBeat <= 248 then
    addLuaSprite('wavBG', false);     
    doTweenAlpha('showwav','wavBG',1,0.3,'linear')          
    else
    doTweenAlpha('hidewav','wavBG',0,0.3,'linear')
end
end