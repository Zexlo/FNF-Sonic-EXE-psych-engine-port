--Extra Keys Script (Hscript edition)
--By TheZoroForce240

--og extra keys code by srPerez

--local openRebindMenu = false


--copied from flxkey lol
--cant access flxkey with hscript for some reason
Rings = 0
local ANY = -2;
local NONE = -1;
local A = 65;
local B = 66;
local C = 67;
local D = 68;
local E = 69;
local F = 70;
local G = 71;
local H = 72;
local I = 73;
local J = 74;
local K = 75;
local L = 76;
local M = 77;
local N = 78;
local O = 79;
local P = 80;
local Q = 81;
local R = 82;
local S = 83;
local T = 84;
local U = 85;
local V = 86;
local W = 87;
local X = 88;
local Y = 89;
local Z = 90;
local ZERO = 48;
local ONE = 49;
local TWO = 50;
local THREE = 51;
local FOUR = 52;
local FIVE = 53;
local SIX = 54;
local SEVEN = 55;
local EIGHT = 56;
local NINE = 57;
local PAGEUP = 33;
local PAGEDOWN = 34;
local HOME = 36;
local END = 35;
local INSERT = 45;
local ESCAPE = 27;
local MINUS = 189;
local PLUS = 187;
local DELETE = 46;
local BACKSPACE = 8;
local LBRACKET = 219;
local RBRACKET = 221;
local BACKSLASH = 220;
local CAPSLOCK = 20;
local SEMICOLON = 186;
local QUOTE = 222;
local ENTER = 13;
local SHIFT = 16;
local COMMA = 188;
local PERIOD = 190;
local SLASH = 191;
local GRAVEACCENT = 192;
local CONTROL = 17;
local ALT = 18;
local SPACE = 32;
local UP = 38;
local DOWN = 40;
local LEFT = 37;
local RIGHT = 39;
local TAB = 9;
local PRINTSCREEN = 301;
local F1 = 112;
local F2 = 113;
local F3 = 114;
local F4 = 115;
local F5 = 116;
local F6 = 117;
local F7 = 118;
local F8 = 119;
local F9 = 120;
local F10 = 121;
local F11 = 122;
local F12 = 123;
local NUMPADZERO = 96;
local NUMPADONE = 97;
local NUMPADTWO = 98;
local NUMPADTHREE = 99;
local NUMPADFOUR = 100;
local NUMPADFIVE = 101;
local NUMPADSIX = 102;
local NUMPADSEVEN = 103;
local NUMPADEIGHT = 104;
local NUMPADNINE = 105;
local NUMPADMINUS = 109;
local NUMPADPLUS = 107;
local NUMPADPERIOD = 110;
local NUMPADMULTIPLY = 106;

--use regular psych controls lol
local PSYCHLEFT = -10;
local PSYCHDOWN = -11
local PSYCHUP = -12;
local PSYCHRIGHT = -13;



local arrowDirs = {'LEFT', 'DOWN', 'UP', 'RIGHT', 'SPACE'}
local arrowColors = {'purple', 'blue', 'green', 'red', 'white'}
local splashColors = {0, 1, 2, 3, 4, 5}

local scaleMult = 1
local pixelScaleShit = 8.57;

local maniaData = {
    --scale, width, offset, arrowDirection, arrowColor, controls
    {0.7, 112, 0, {5}, {5}, {SPACE}}, --1k
    {0.7, 112, 0, {1,4}, {1,4}, {PSYCHLEFT, PSYCHRIGHT}}, --2k
    {0.7, 112, 0, {1,5,4}, {1,5,4}, {PSYCHLEFT, SPACE, PSYCHRIGHT}}, --3k
    {0.7, 112, 0, {1,2,3,4}, {1,2,3,4}, {PSYCHLEFT, PSYCHDOWN, PSYCHUP, PSYCHRIGHT}}, --4k
    {0.65, 98, -15, {1,2,5,3,4}, {1,2,5,3,4}, {PSYCHLEFT, PSYCHDOWN, SPACE, PSYCHUP, PSYCHRIGHT}},--5k
}

--for indexing maniaData
local ARROW_SCALE = 1
local ARROW_WIDTH = 2
local ARROW_OFFSET = 3
local ARROW_DIRECTION = 4
local ARROW_COLOR = 5
local CONTROLS = 6

function onCreate()
	if songName ~= 'Triple Trouble' then
close(true)
end
end

function generateStaticArrows(player)
    runHaxeCode('Note.swagWidth = '..(maniaData[keyCount][ARROW_WIDTH])..';')
    
    for i = 0,keyCount-1 do 
        local staticName = 'arrow'..arrowDirs[maniaData[keyCount][ARROW_DIRECTION][i+1]]..'0'
        local pressedName = arrowColors[maniaData[keyCount][ARROW_COLOR][i+1]]..' press'
        local confirmName = arrowColors[maniaData[keyCount][ARROW_COLOR][i+1]]..' confirm'
        local arrowScale = maniaData[keyCount][ARROW_SCALE]
        local arrowSize = maniaData[keyCount][ARROW_WIDTH]
        local offset = maniaData[keyCount][ARROW_OFFSET]
        --create each strumnote
        runHaxeCode([[
            var targetAlpha = 1.0;
            var player = ]]..tostring(player)..[[;
			if (player < 1)
			{
				if(!ClientPrefs.opponentStrums) targetAlpha = 0.0;
				else if(ClientPrefs.middleScroll) targetAlpha = 0.35;
			}
            var xPos = PlayState.STRUM_X;
            if (ClientPrefs.middleScroll)
                xPos = PlayState.STRUM_X_MIDDLESCROLL;
            

			var babyArrow = new StrumNote(xPos, game.strumLine.y, ]]..i..[[, player);
			babyArrow.downScroll = ClientPrefs.downScroll;
			if (!PlayState.isStoryMode && !game.skipArrowStartTween)
			{
				babyArrow.alpha = 0;
				FlxTween.tween(babyArrow, {alpha: targetAlpha}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * (]]..i..[[/]]..keyCount..[[)*4 )});

                //babyArrow.alpha = targetAlpha;
			}
			else
			{
				babyArrow.alpha = targetAlpha;
			}

			if (player == 1)
			{
				game.playerStrums.add(babyArrow);
			}
			else
			{
				if(ClientPrefs.middleScroll)
				{
					babyArrow.x += 310;
					if(]]..(i)..[[ > ]]..((keyCount/2)-1)..[[) { //Up and Right
						babyArrow.x += FlxG.width / 2 + 25;
					}
				}
				game.opponentStrums.add(babyArrow);
			}

			game.strumLineNotes.add(babyArrow);

            babyArrow.animation.destroyAnimations();

            babyArrow.animation.addByPrefix('static', ']]..(staticName)..[[0');
            babyArrow.animation.addByPrefix('pressed', ']]..(pressedName)..[[0', 24, false);
            babyArrow.animation.addByPrefix('confirm', ']]..(confirmName)..[[0', 24, false);

            babyArrow.scale.x = ]]..arrowScale..[[;
            babyArrow.scale.y = ]]..arrowScale..[[;

			//babyArrow.postAddedToGroup();

            babyArrow.playAnim('static');
            babyArrow.x += ]]..arrowSize..[[ * ]]..(i)..[[;
            babyArrow.x += 50;
            babyArrow.x += ]]..offset..[[;
            babyArrow.x += ((FlxG.width / 2) * player);
            babyArrow.ID = ]]..(i)..[[;
            //babyArrow.updateHitbox();

            babyArrow.width = Math.abs(0.7) * babyArrow.frameWidth;
            babyArrow.height = Math.abs(0.7) * babyArrow.frameHeight;
            babyArrow.offset.set(-0.5 * (babyArrow.width - babyArrow.frameWidth), -0.5 * (babyArrow.height - babyArrow.frameHeight));
            babyArrow.centerOrigin();

            
        ]])
    end
end

function generateSingAnimations()
    --luaDebugMode = true
    local singDirs = {}
    for i = 0, keyCount-1 do 
        local arrowDir = arrowDirs[maniaData[keyCount][ARROW_DIRECTION][i+1]]
        if not string.find(arrowDir, 'SPACE') then 
            table.insert(singDirs, 'sing'..arrowDirs[maniaData[keyCount][ARROW_DIRECTION][i+1]])
        else 
            if arrowDir == 'SPACE' then 
                table.insert(singDirs, 'singUP')
            end
        end
    end
    --debugPrint(turnArrayIntoString(singDirs))
    
    --runHaxeCode('game.singAnimations = '..singDirs..';')
    setProperty('singAnimations', singDirs)
end

--lua arrays use {}, haxe arrays use [], converts them to be used with hscript
function turnArrayIntoString(arr)
    local str = '['
    for i = 0,#arr-1 do 
        str = str..arr[i+1]
        if i ~= #arr-1 then 
            str = str..','
        end
    end
    str = str..']'
    return str
end

function onCreatePost()
    makeLuaSprite('counter','Counter',1100,620)
    makeLuaText('Ringcount','0',200,1110,620)
    setTextSize('Ringcount',40)
    setTextFont('Ringcount','FNF.ttf')
    setTextColor('Ringcount','FFD631')
    setTextBorder('Ringcount',3,'C55D00')
    setObjectCamera('counter','hud')
    setObjectCamera('Ringcount','hud')
    setObjectOrder('Ringcount', getObjectOrder('counter'))   
    addLuaText('Ringcount')
    addLuaSprite('counter')

    luaDebugMode = true
    --import the shit
    addHaxeLibrary('FlxKey', 'flixel.input.keyboard')
    addHaxeLibrary('Note')
    addHaxeLibrary('SwagSong', 'Song')
    addHaxeLibrary('SwagSection', 'Section')
    addHaxeLibrary('Math')
    addHaxeLibrary('NoteSplash')
    addHaxeLibrary('StrumNote')
    addHaxeLibrary('Std')
    addHaxeLibrary('FlxMath', 'flixel.math')

    reparseChart()
    updateNotes()

end

function reparseChart()

    --local maniaChanges = {}
    local maniaChanges = '0,'..keyCount
    local eventsLength = getProperty('eventNotes.length')
    for i = 0,eventsLength-1 do 
        if getPropertyFromGroup('eventNotes', i, 'event') == 'Change Mania' then 
            --debugPrint(getPropertyFromGroup('eventNotes', i, 'event'))
            --table.insert(maniaChanges, {getPropertyFromGroup('eventNotes', i, 'strumTime'), getPropertyFromGroup('eventNotes', i, 'value1')})
            maniaChanges = maniaChanges..':'..getPropertyFromGroup('eventNotes', i, 'strumTime')..','..getPropertyFromGroup('eventNotes', i, 'value1')
            --will split the array in hscript later because converting lua array to haxe array is sometimes annoying
        end
    end
    
    --runHaxeCode('Note.swagWidth = '..(maniaData[keyCount][ARROW_WIDTH])..';')

    --need to reparse the chart and reload everything
    runHaxeCode([[
        game.unspawnNotes = [];
        while(game.notes.length > 0) {
			var daNote = game.notes.members[0];
			daNote.active = false;
			daNote.visible = false;

			daNote.kill();
			game.notes.remove(daNote, true);
			daNote.destroy();
		}

        var keyCount = ]]..keyCount..[[;
        var startingKeyCount = keyCount;

        //stupid shit with arrays
        var maniaChangesString = "]]..maniaChanges..[[";
        var maniaChanges = maniaChangesString.split(':');
        var maniaChangeMap = [];
        for (i in 0...maniaChanges.length)
        {
            maniaChangeMap.push(maniaChanges[i].split(','));
        }


        for (section in PlayState.SONG.notes) //reload dat shit
		{
			for (songNotes in section.sectionNotes)
			{
				var daStrumTime = songNotes[0];
                if (daStrumTime >= Conductor.songPosition) //only load notes after current song pos (not needed i just had this set up for something else before, shouldnt break anything)
                {
                    
                    for (mchange in maniaChangeMap)
                    {
                        if (daStrumTime >= Std.parseFloat(mchange[0]))
                        {
                            keyCount = Std.parseInt(mchange[1]);
                        }
                    }
                    var actualNoteData = Std.int(songNotes[1] % keyCount);
                    var daNoteData = Std.int(songNotes[1] % startingKeyCount);

                    var gottaHitNote = section.mustHitSection;
    
                    if (songNotes[1] > keyCount-1)
                    {
                        gottaHitNote = !section.mustHitSection;
                    }
    
                    var oldNote = null;
                    if (game.unspawnNotes.length > 0)
                        oldNote = game.unspawnNotes[Std.int(game.unspawnNotes.length - 1)];
                    else
                        oldNote = null;
    
                    var swagNote = new Note(daStrumTime, daNoteData, oldNote);
                    swagNote.mustPress = gottaHitNote;
                    swagNote.sustainLength = songNotes[2];
                    if (section.gfSection && songNotes[1]<keyCount)
                        swagNote.gfNote = true;
                    swagNote.noteType = songNotes[3];

                    swagNote.eventLength = actualNoteData; //stealing these variables lol
                    swagNote.eventName = ''+keyCount;
                    swagNote.eventVal1 = ''+daNoteData;
    
                    swagNote.scrollFactor.set();
    
                    var susLength = swagNote.sustainLength;
    
                    susLength = susLength / Conductor.stepCrochet;
                    game.unspawnNotes.push(swagNote);
    
                    var floorSus = Math.floor(susLength);
                    if(floorSus > 0) {
                        for (susNote in 0...floorSus+1)
                        {
                            oldNote = game.unspawnNotes[Std.int(game.unspawnNotes.length - 1)];
    
                            var sustainNote = new Note(daStrumTime + (Conductor.stepCrochet * susNote) + (Conductor.stepCrochet / FlxMath.roundDecimal(game.songSpeed, 2)), daNoteData, oldNote, true);
                            sustainNote.mustPress = gottaHitNote;
                            if (section.gfSection && songNotes[1]<keyCount)
                                sustainNote.gfNote = true;

                            sustainNote.noteType = swagNote.noteType;
                            sustainNote.scrollFactor.set();
                            sustainNote.eventLength = actualNoteData; //stealing this variables lol
                            sustainNote.eventName = ''+keyCount;
                            sustainNote.eventVal1 = ''+daNoteData;
                            //swagNote.tail.push(sustainNote);
                            //sustainNote.parent = swagNote;
                            game.unspawnNotes.push(sustainNote);
    
                        }
                    }
                }
			}
		}

		game.unspawnNotes.sort(game.sortByShit);
    ]])
end

function updateNotes()
    --need to change note scales and animations
    local noteCount = getProperty('unspawnNotes.length')
    local eventsLength = getProperty('eventNotes.length')

    
    for i = 0,noteCount-1 do  --If notedata is higher than strumgroup length then the game crashes
        local noteData = getPropertyFromGroup('unspawnNotes', i, 'eventLength') --stealing this variable for actual note data!!! (for mania changes lol)
       
        local currentKeyCount = keyCount
        for j = 0,eventsLength-1 do 
            if getPropertyFromGroup('eventNotes', j, 'event') == 'Change Mania' then 
                if getPropertyFromGroup('unspawnNotes', i, 'strumTime') >= getPropertyFromGroup('eventNotes', j, 'strumTime') then 
                currentKeyCount = tonumber(getPropertyFromGroup('eventNotes', j, 'value1'))
                end
            end
        end
        local arrowScale = maniaData[currentKeyCount][ARROW_SCALE]
        runHaxeCode([[
            var note = game.unspawnNotes[]]..i..[[];

            note.animation.addByPrefix(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[Scroll', ']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[0');

            note.animation.addByPrefix(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[hold', ']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[ hold piece0');

            note.animation.addByPrefix(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[holdend', ']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[ hold end0');

            if (!note.isSustainNote)
            {
                note.animation.play(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[Scroll');
                note.scale.x = ]]..arrowScale..[[;
                note.scale.y = ]]..arrowScale..[[;

                

                //fake setgraphicsize so scaling matches for notetypes and stuff
                //note.width = Math.abs(0.7) * note.frameWidth;
                //note.height = Math.abs(0.7) * note.frameHeight;
                //note.offset.set(-0.5 * (note.width - note.frameWidth), -0.5 * (note.height - note.frameHeight));
                note.centerOrigin();
                note.centerOffsets();
                note.width = Math.abs(0.7) * note.frameWidth;
                note.height = Math.abs(0.7) * note.frameHeight;
                note.offset.set(-0.5 * (note.width - note.frameWidth), -0.5 * (note.height - note.frameHeight));
                note.centerOrigin();
            }
            else 
            {
                //need to recalculate offsetx
                note.animation.play(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[Scroll');
                note.scale.x = ]]..arrowScale..[[;
                //same stuff as setgraphicsize but without changing the height to not fuck up the scaley and clipping
                note.width = Math.abs(0.7) * note.frameWidth;
                //note.height = Math.abs(0.7) * note.frameHeight;
                note.offset.x = (-0.5 * (note.width - note.frameWidth));
                //note.centerOrigin();
                note.centerOrigin();
                

                
                //note.updateHitbox();

                //width of regular note
                note.offsetX = note.width/2;
                
                note.animation.play(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[holdend');
                note.updateHitbox();

                //width of sustain note
                note.offsetX -= note.width/2;

                if (note.prevNote.isSustainNote)
                {
                    note.prevNote.animation.play(']]..arrowColors[maniaData[currentKeyCount][ARROW_COLOR][noteData+1]]..[[hold');
                    note.offsetX = note.prevNote.offsetX;
                }
                


            }
            
        ]])
    end
end

--need to disable default notesplashes
local noteSplashesEnabled = true
function disableSplashes()
    noteSplashesEnabled = getPropertyFromClass('ClientPrefs', 'noteSplashes')
    setPropertyFromClass('ClientPrefs', 'noteSplashes', false)
end
function onDestroy()
    setPropertyFromClass('ClientPrefs', 'noteSplashes', noteSplashesEnabled)
end

function onUpdatePost(elapsed)

end

function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if Rings >= 1 and getPropertyFromGroup('notes', membersIndex, 'noteData') ~= 2 then
        addHealth(0.25)
     Rings = Rings -1
     setTextString('Ringcount',Rings)            

    elseif getPropertyFromGroup('notes', membersIndex, 'noteData') == 2 then
addMisses(-1)
playAnim('boyfriend','idle',true)
    end     
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    if getPropertyFromGroup('notes', id, 'noteData') == 2 then
        playSound('Ring',1)
        Rings = Rings + 1
        setTextString('Ringcount',Rings)   
end
    if getPropertyFromGroup('notes', id, 'rating') == 'sick' and not getPropertyFromGroup('notes', id, 'noteSplashDisabled') then 
        --debugPrint('sploosh')
        local colorData = splashColors[maniaData[keyCount][ARROW_COLOR][noteData+1]]
        local arrowWidth = maniaData[keyCount][ARROW_SCALE]*160
        --luaDebugMode = true
        runHaxeCode([[

            var strum = game.playerStrums.members[ ]]..noteData..[[ ];
            if (strum != null)
            {
                var splash = game.grpNoteSplashes.recycle(NoteSplash);
                var note = game.notes.members[ ]]..id..[[ ];
                
                game.grpNoteSplashes.add(splash);
        
                var skin = 'noteSplashes';
                if(PlayState.SONG.splashSkin != null && PlayState.SONG.splashSkin.length > 0)
                    skin = PlayState.SONG.splashSkin;

                var hue = ClientPrefs.arrowHSV[]]..(noteData%4)..[[][0] / 360;
                var sat = ClientPrefs.arrowHSV[]]..(noteData%4)..[[][1] / 100;
                var brt = ClientPrefs.arrowHSV[]]..(noteData%4)..[[][2] / 100;
                if(note != null) {
                    skin = note.noteSplashTexture;
                    hue = note.noteSplashHue;
                    sat = note.noteSplashSat;
                    brt = note.noteSplashBrt;
                }

        
                splash.setupNoteSplash(strum.x, strum.y, ]]..colorData..[[, skin, hue, sat, brt);
                //make sure anims are loaded
                splash.animation.addByPrefix("note1-1", "note splash blue 1", 24, false);
                splash.animation.addByPrefix("note2-1", "note splash green 1", 24, false);
                splash.animation.addByPrefix("note0-1", "note splash purple 1", 24, false);
                splash.animation.addByPrefix("note3-1", "note splash red 1", 24, false);
                splash.animation.addByPrefix("note4-1", "note splash white 1", 24, false);

                splash.animation.addByPrefix("note1-2", "note splash blue 2", 24, false);
                splash.animation.addByPrefix("note2-2", "note splash green 2", 24, false);
                splash.animation.addByPrefix("note0-2", "note splash purple 2", 24, false);
                splash.animation.addByPrefix("note3-2", "note splash red 2", 24, false);
                splash.animation.addByPrefix("note4-2", "note splash white 2", 24, false);

                var animNum = FlxG.random.int(1, 2);
                splash.animation.play('note' + ]]..colorData..[[ + '-' + animNum, true);
                if(splash.animation.curAnim != null)
                    splash.animation.curAnim.frameRate = 24 + FlxG.random.int(-2, 2);

                splash.setGraphicSize(Std.int(3 * ]]..arrowWidth..[[));
                splash.updateHitbox();
                //splash.offset.set(0,0);
                splash.setPosition(strum.x - ((splash.width - strum.width) / 2), strum.y - ((splash.height - strum.height) / 2));
            }
            


    
        ]])  
    end

    if botPlay then 
        runHaxeCode([[
            var noteData = ]]..noteData..[[;
            if (noteData > 3) //weird shit because psych does % 4 on strum anims
            {            
                game.playerStrums.members[noteData%4].playAnim('static', true);
                var time = 0.15;
                if (]]..tostring(isSustainNote)..[[)
                    time = 0.3;
                game.playerStrums.members[noteData].playAnim('confirm', true);
                game.playerStrums.members[noteData].resetAnim = time;
            }
        ]])
    end
end


function opponentNoteHit(id, noteData, noteType, isSustainNote)
    runHaxeCode([[
        var noteData = ]]..noteData..[[;
        if (noteData > 3) //weird shit because psych does % 4 on strum anims
        {            
            game.opponentStrums.members[noteData%4].playAnim('static', true);
            var time = 0.15;
            if (]]..tostring(isSustainNote)..[[)
                time = 0.3;
            game.opponentStrums.members[noteData].playAnim('confirm', true);
            game.opponentStrums.members[noteData].resetAnim = time;
        }
    ]])
end

local keysPressed = {false,false,false,false,false}
--fuck

--need to check if holding sustains because psych dumb and still uses shitty controls.hx
function onUpdatePost(elapsed)

    local noteCount = getProperty('notes.length')
    for i = 0,noteCount-1 do 
        local noteData = getPropertyFromGroup('notes', i, 'noteData')
        local isHolding = keysPressed[noteData+1]
        if isHolding then 
            if getPropertyFromGroup('notes', i, 'isSustainNote') and getPropertyFromGroup('notes', i, 'canBeHit') and not getPropertyFromGroup('notes', i, 'wasGoodHit')
            and getPropertyFromGroup('notes', i, 'mustPress') and not getPropertyFromGroup('notes', i, 'tooLate') then 
                runHaxeCode([[
                    game.goodNoteHit(game.notes.members[]]..i..[[]);
                ]])
            end
        end 
    end
end

function onKeyPress(key)
    keysPressed[key+1] = true
end
function onKeyRelease(key)
    keysPressed[key+1] = false
end

function onCountdownStarted()
if keyCount == nil then
	keyCount = 5
	runHaxeCode([[
		game.setOnLuas('keyCount',5);
	]])
	end
	
    runHaxeCode([[
        game.playerStrums.clear();
        game.opponentStrums.clear();
        game.strumLineNotes.clear();
    ]])
    generateStaticArrows(0)
    generateStaticArrows(1)
    generateSingAnimations()
    generateBinds()
    runHaxeCode([[
        for (i in 0...game.playerStrums.length) {
            game.setOnLuas('defaultPlayerStrumX' + i, game.playerStrums.members[i].x);
            game.setOnLuas('defaultPlayerStrumY' + i, game.playerStrums.members[i].y);
        }
        for (i in 0...game.opponentStrums.length) {
            game.setOnLuas('defaultOpponentStrumX' + i, game.opponentStrums.members[i].x);
            game.setOnLuas('defaultOpponentStrumY' + i, game.opponentStrums.members[i].y);
        }
    ]])
end

function generateBinds()

    runHaxeCode([[
        game.keysArray = [];
    ]])

    --now set up keybinds
    for i = 0,keyCount-1 do
        --debugPrint(maniaData[keyCount][CONTROLS][i+1])
        if maniaData[keyCount][CONTROLS][i+1] == PSYCHLEFT then 
            runHaxeCode('game.keysArray.push(ClientPrefs.copyKey(ClientPrefs.keyBinds.get("note_left")));')
        elseif maniaData[keyCount][CONTROLS][i+1] == PSYCHDOWN then 
            runHaxeCode('game.keysArray.push(ClientPrefs.copyKey(ClientPrefs.keyBinds.get("note_down")));')
        elseif maniaData[keyCount][CONTROLS][i+1] == PSYCHUP then 
            runHaxeCode('game.keysArray.push(ClientPrefs.copyKey(ClientPrefs.keyBinds.get("note_up")));')
        elseif maniaData[keyCount][CONTROLS][i+1] == PSYCHRIGHT then 
            runHaxeCode('game.keysArray.push(ClientPrefs.copyKey(ClientPrefs.keyBinds.get("note_right")));')
        else 
            runHaxeCode([[
                //game.keysArray.push(FlxKey.]]..maniaData[keyCount][CONTROLS][i+1]..[[);
                //if (!ClientPrefs.keyBinds.exists('extraKeys]]..keyCount..' '..i..[['))
                //{
                    ClientPrefs.keyBinds.set('extraKeys]]..keyCount..' '..i..[[', []]..maniaData[keyCount][CONTROLS][i+1]..[[, 0]);
                    //ClientPrefs.saveSettings();
                //}
                game.keysArray.push(ClientPrefs.copyKey(ClientPrefs.keyBinds.get('extraKeys]]..keyCount..' '..i..[[')));
                
            ]])
        end

    end
    disableSplashes() --need to run it after this in case it saves




    local controlArray = getProperty('keysArray')
    --debugPrint(controlArray)
    for i = 0,keyCount-1 do 
        local control = getControlFromInt(controlArray[i+1][1])
        --debugPrint(control)
        runHaxeCode([[
            var idx = ]]..i..[[;
            var text = game.modchartTexts.get("bind]]..i..[[");
            if (text != null)
            {
                FlxTween.tween(text, {alpha: 1}, 1, {ease: FlxEase.circOut, startDelay: 0.5 + (0.2 * (]]..i..[[/]]..keyCount..[[)*4 )});
                text.x = game.playerStrums.members[idx].x + (game.playerStrums.members[idx].width/2);
                text.x -= (text.width/2);
                text.y = game.playerStrums.members[idx].y;
            } 
        ]])

    end
end
--stupid control bullshit cuz flxkey doesnt wanna work with hscript
local keysMap = {
    { A, 'A'},
    { B, 'B'},
    { C, 'C'},
    { D, 'D'},
    { E, 'E'},
    { F, 'F'},
    { G, 'G'},
    { H, 'H'},
    { I, 'I'},
    { J, 'J'},
    { K, 'K'},
    { L, 'L'},
    { M, 'M'},
    { N, 'N'},
    { O, 'O'},
    { P, 'P'},
    { Q, 'Q'},
    { R, 'R'},
    { S, 'S'},
    { T, 'T'},
    { U, 'U'},
    { V, 'V'},
    { W, 'W'},
    { X , 'X'},
    { Y , 'Y'},
    { Z , 'Z'},
    { ZERO, '0'},
    { ONE, '1'},
    { TWO , '2'},
    { THREE , '3'},
    { FOUR , '4'},
    { FIVE, '5'},
    { SIX, '6'},
    { SEVEN , '7'},
    { EIGHT, '8'},
    { NINE, '9'},
    { PAGEUP , 'PAGEUP'},
    { PAGEDOWN , 'PAGEDOWN'},
    { HOME , 'HOME'},
    { END, 'END'},
    { INSERT, 'INSERT'},
    { ESCAPE, 'ESCAPE'},
    { MINUS , 'MINUS'},
    { PLUS, 'PLUS'},
    { DELETE, 'DELETE'},
    { BACKSPACE, 'BACKSPACE'},
    { LBRACKET, 'LBRACKET'},
    { RBRACKET, 'RBRACKET'},
    { BACKSLASH, 'BACKSLASH'},
    { CAPSLOCK, 'CAPSLOCK'},
    { SEMICOLON, 'SEMICOLON'},
    { QUOTE, 'QUOTE'},
    { ENTER, 'ENTER'},
    { SHIFT, 'SHIFT'},
    { COMMA, 'COMMA'},
    { PERIOD, 'PERIOD'},
    { SLASH, 'SLASH'},
    { GRAVEACCENT, 'GRAVEACCENT'},
    { CONTROL, 'CONTROL'},
    { ALT, 'ALT'},
    { SPACE, 'SPACE'},
    { UP, 'UP'},
    { DOWN, 'DOWN'},
    { LEFT, 'LEFT'},
    { RIGHT, 'RIGHT'},
    { TAB, 'TAB'},
    { PRINTSCREEN, 'PRINTSCREEN'},
    { F1, 'F1'},
    { F2, 'F2'},
    { F3, 'F3'},
    { F4, 'F4'},
    { F5, 'F5'},
    { F6, 'F6'},
    { F7, 'F7'},
    { F8, 'F8'},
    { F9, 'F9'},
    { F10, 'F10'},
    { F11, 'F11'},
    { F12 , 'F12'},
    { NUMPADZERO, 'NUMPADZERO'},
    { NUMPADONE , 'NUMPADONE'},
    { NUMPADTWO , 'NUMPADTWO'},
    { NUMPADTHREE, 'NUMPADTHREE'},
    { NUMPADFOUR , 'NUMPADFOUR'},
    { NUMPADFIVE, 'NUMPADFIVE'},
    { NUMPADSIX , 'NUMPADSIX'},
    { NUMPADSEVEN, 'NUMPADSEVEN'},
    { NUMPADEIGHT, 'NUMPADEIGHT'},
    { NUMPADNINE, 'NUMPADNINE'},
    { NUMPADMINUS , 'NUMPADMINUS'},
    { NUMPADPLUS, 'NUMPADPLUS'},
    { NUMPADPERIOD, 'NUMPADPERIOD'},
    { NUMPADMULTIPLY, 'NUMPADMULTIPLY'}
}


function getControlFromInt(controlInt)
    for i = 0,#keysMap-1 do 
        if keysMap[i+1][1] == controlInt then 
            return keysMap[i+1][2]
        end
    end
    return ''
end

function onEvent(tag, val1, val2)
    if tag == 'Change Mania' then 
        runHaxeCode('game.setOnLuas("keyCount", '..val1..');')
        runHaxeCode('Note.swagWidth = '..(maniaData[keyCount][ARROW_WIDTH])..';')
        runHaxeCode([[
            game.playerStrums.clear();
            game.opponentStrums.clear();
            game.strumLineNotes.clear();
        ]])
        generateStaticArrows(0)
        generateStaticArrows(1)
        generateSingAnimations()
        generateBinds()
        runHaxeCode([[
            for (i in 0...game.playerStrums.length) {
                game.setOnLuas('defaultPlayerStrumX' + i, game.playerStrums.members[i].x);
                game.setOnLuas('defaultPlayerStrumY' + i, game.playerStrums.members[i].y);
            }
            for (i in 0...game.opponentStrums.length) {
                game.setOnLuas('defaultOpponentStrumX' + i, game.opponentStrums.members[i].x);
                game.setOnLuas('defaultOpponentStrumY' + i, game.opponentStrums.members[i].y);
            }
        ]])
        runHaxeCode([[
            for (i in 0...game.notes.members.length)
            {
                var note = game.notes.members[i];
                if (Std.parseInt(note.eventName) == ]]..keyCount..[[)
                {
                    note.noteData = note.eventLength;
                }
                else
                {
                    note.noteData = Std.parseInt(note.eventVal1);
                }
            }
            for (i in 0...game.unspawnNotes.length)
            {
                var note = game.unspawnNotes[i];
                if (Std.parseInt(note.eventName) == ]]..keyCount..[[)
                {
                    note.noteData = note.eventLength;
                }
                else
                {
                    note.noteData = Std.parseInt(note.eventVal1);
                }
            }
        ]])
    end
end


--will finish this at some point
function onStartCountdown()
    openRebindMenu = songName == 'rebind controls'
    if openRebindMenu then 
        makeLuaSprite('rebindBG', '', 0,0)
        makeGraphic('rebindBG', 1280, 720, '0xFF000000')
        setObjectCamera('rebindBG', 'hud')
        screenCenter('rebindBG', 'xy')
        addLuaSprite('rebindBG', true)

        makeLuaText('rebindText', 'Rebind Menu', 0, 10, 10)
        setTextSize('rebindText', 48)
        addLuaText('rebindText')

        runHaxeCode("game.variables['BindList'] = [];")

        for m = 0,#maniaData-1 do 
            --now set up keybinds
            local kc = #maniaData[m+1][CONTROLS]
            --debugPrint(kc)
            for i = 0,kc-1 do

                runHaxeCode([[
                    if (!ClientPrefs.keyBinds.exists('extraKeys]]..kc..' '..i..[['))
                    {
                        ClientPrefs.keyBinds.set('extraKeys]]..kc..' '..i..[[', []]..maniaData[m+1][CONTROLS][i+1]..[[, 0]);
                        ClientPrefs.saveSettings();
                    }
                ]])
            end
        end

        return Function_Stop
    end
    return Function_Continue
end
