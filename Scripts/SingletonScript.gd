extends Node

# store all scene sequences
var scene_sequence = [
	"res://Scenes/title_screen.tscn", #title screen
	"res://Scenes/storybook_scene.tscn", #main visual novel scene
	"res://Scenes/credit_screen.tscn"
	#"res://Scenes/menu_scene.tscn"
	#"res://Scenes/minteractive_game_scene.tscn"
]

#globals to help manage navigation of scenes and ambient audio
var current_page_index = 0
var total_pages = 0
var page_data = [] 
var audio_stream_player_node : AudioStreamPlayer = null

# load data for visual novel contents and begin playing looped audio
func _ready():
	#story data
	load_story_data()
	total_pages = page_data.size()
	#looped audio
	var bg_ambient_audio := AudioStreamPlayer.new()
	bg_ambient_audio.stream = load("res://Assets/Music/ambient_loop.mp3")
	bg_ambient_audio.autoplay = true
	audio_stream_player_node = bg_ambient_audio
	add_child(bg_ambient_audio)
	
#helper function for looping audio
func _process(_delta: float) -> void:
	if audio_stream_player_node:
		if !audio_stream_player_node.playing:
			audio_stream_player_node.play()

#store all text and visual data for visual novel (chapter no, name, main text, and main drawings)
#note: use BBCode, as GD is also tab/space/enter sensitive
func load_story_data():
	page_data = [
		{	
			"chapter_number": "CHAPTER 1",
			"chapter_name": "The Long Road Ahead",
			"main_story_text": "\tLong after the shock had settled in, Myrtle could only haplessly watch as her containment pod began drifting from the steady orbit of its mothership.\n\n[i]\t[Is this what witnessing your own death feels like?Not with a calamitous uproar, or even a melancholic sigh, but a vast emptiness settling between what once was and what will be in a mere… I don’t know… thousands of light years?][/i]\n\n\tBasked in the red emergency lights flooding her living quarters, she would could not dare to move a limb.\n\n\t[i][Perhaps I am still asleep.][/i]/n/n/tIn a dreary stupor, she quickly rushed from her bunk to the control room to address the issue at hand. Nothing could have prepared her for what she was about to see./n/n/t[i][This… this must be a mistake. How did my orbital path misalign? We were promised fail-safe auto-pilot systems by the SpaceFarer Enterprise and yet, the systems seem to be indicating a trajectory into the black hole. I must act now, before it is too late.][/i]\n\n\tDespite her limbs and mind working diligently away at diagnosing and correcting the hydraulics system and manually maneuvering the thrusters in an almost robotic-precision, she could not escape a lingering sense of doom creeping in the back of her mind.\n\n\t[i][How long was I asleep for? Why didn’t Alina alert me over the radio network? Something about this seems…off.][/i]\n\n\tAnd speaking of Alina -the chief explorer of the space scavenger mission the duo set off on- Myrtle took pause in her scrupulous efforts to begin opening the comms to send a distress signal. While the two explorers were never close prior to the mission, a sense of familiarity— or even fondness, if that is what you wanted to call it, had developed between them over the past year and a half of traveling in the dark expanse of endless vastness.\n\n\t[i][My family, my real family back home on Earth Prime, well I haven’t seen them in ages.][/i]",
			"story_picture": "res://Assets/Sprites/1_drawing.png"
		},
		{
			"chapter_number": "CHAPTER 2",
			"chapter_name": "Into the Abyss",
			"main_story_text": "\t[i][They never tell you how beautiful the end looks. How dying lights bend around you, how stars smear across your vision like stars twinkling when you crease your eyes too hard.][/i]\n\n\tMyrtle’s fingers hovered over the emergency thrusters, but she knew any further efforts were useless now. Whatever she tried was no match for the hungry mouth of a singularity. The ship’s system helpfully -and hurtfully, truth be told- calculated her remaining time before crossing the event horizon: 28 minutes. \n\n\t[i][Has anyone ever ventured out where I will go soon? Will I feel myself stretching like taffy, atoms pulling apart into base elementary particles? Will it be quick and blissful? Or an eternal damnation beyond our mortal comprehension.][/i]\n\n\tShe checked the radio transmitter again. Still nothing from Alina. The message she had sent mere minutes ago should have reached the boarding ship by now, but Myrtle feared her comms had red shifted too far and coalesced into a garbled mess. The silence was worse than any response. \n\n\t[i][Come on, Alina, I know you’re there.][/i]\n\n\tA warning light flashed as the ship automatically centered its core gravity to compensate against external forces. Any object that wasn’t bolted to the ground danced and vibrated as the ship rocked itself in a death throe.\n\n\t[i][They called it spaghettification in training. Made it sound almost comical. The vertical stretching, the horizontal compression. Nothing about the terror of feeling your body betray physical laws you’ve trusted your entire life.][/i]\n\n\tThe radio crackled suddenly, startling her from morbid contemplation. The sound was distorted, stretched and compressed and yet homely and reassuring.\n\n\t[i][Ali...na... recei...message…][/i]\n\n\tIt was enough.",
			"story_picture": "res://Assets/Sprites/2_drawing.png"
		},
		{
			"chapter_number": "CHAPTER 3",
			"chapter_name": "The Void Calls Back",
			"main_story_text": "\tCutting through the interference, Myrtle scrambled to adjust the frequency, desperate to hold onto this tenuous connection.\n\n\t[i][I’m here! I’m still here!][/i]\n\n\tShe shouted until her lungs were hoarse, until she felt as if she could shout her way back to the boarding ship. Descending from her delirium, she knew that the contents of her next message were crucial. Now she was aware: any communications between the two would be warped by the time they reached each other. She strained her ears to follow the rest of Alina’s message.\n\n\t[i][Dear…back…pull…help][/i] \n\n\tDid she hear correctly? Was she called ‘dear’? Did Alina cross the boundaries of their prior formal relationship to comfort her in this moment of distress? And why the hell did it even matter so much? Through the viewing port of her junk ship, Myrtle spotted something—a sharp glint of metal against the blackness. Then another.\n\n\t[i][Great, space debris, just what I needed to seal my fate.][/i]\n\n\t Small objects were hurtling toward her ship’s trajectory with impossible precision. It was in fact Alina was launching kinetic projectiles, a crude attempt to nudge her vessel back into a stable orbit. The first impact rattled the hull, sending Myrtle tumbling against the walls of her cabin. It was not a rescue, not yet. But for the first time since the alarm had woken her, something shifted in Myrtle's chest—a feeling other than dread. The steady ‘click-clack’ of the debris felt methodical, purposeful even, and the gears turned in her head.\n\n\t[i][Even if time moves differently here, at the edge of everything, perhaps I still have time enough for hope. I always knew I could count on you, Alina.][/i] \n\n\t Discontent with idling by, Myrtle jumped to her feet and began shifting weights on her ship.",
			"story_picture": "res://Assets/Sprites/3_drawing.png"
		},
		{
			"chapter_number": "CHAPTER 4",
			"chapter_name": "Lost Frequencies",
			"main_story_text": "\tAnd then, a barrage all at once. A second wave of projectiles struck the port side of Myrtle’s ship, more violently than the first. Alarms blared as the ship’s trajectory calculations recalibrated. Myrtle watched, breath held, as the projected path line on her console bent slightly—a minuscule change, but enough to add precious minutes before the point of no return.\n\n\t[i][It’s working…Alina, it’s working.][/i]\n\n\tShe grabbed the radio transmitter again, fighting to steady her hands as another dull impact shuddered through the vessel.\n\n\t[i][I’m gettin positive shifts in my trajectory, keep them coming baby!][/i]\n\n\tThe comms hissed with static before more remnants Alina’s voice began streaming in, pulled in inconceivable pitches yet still distinctly recognizable.\n\n\t[i][Hold...tight...more...coming…][/i]\n\n\tMyrtle glanced at the ship’s heads-up screen, watching seconds stretch impossibly long as travel time recalculated itself…odly. Time in general was already behaving strangely—what felt like minutes to her might be hours, days even for Alina. The thought sent a chill through her that had nothing to do with the ship’s failing cabin temperatures.\n\n\t[i][We were supposed to collect space junk and observe time dilation from afar as tourists, not become test subjects ourselves. What will Earth Prime even be like when I get back? What about Alina herself?][/i]\n\n\tHer display spelled a new warning: structural integrity compromised in three sections. The rescue attempt was damaging her ship almost as much as it was helping. Through the viewport, Myrtle could now see the accretion disk of the black hole—bubbling, wispy accretion disc dragging light through the darkness, like a halo around a gaping hole.",
			"story_picture": "res://Assets/Sprites/4_drawing.png"
		},
		{
			"chapter_number": "CHAPTER 5",
			"chapter_name": "A Tear in the Fabric of Time",
			"main_story_text": "\t[i][It’s strange how something so damning can be so mesmerizing. It’s like watching yourself fall in love with something you shouldn’t, an impossible being capable of ever giving more than it takes.][/i] Then, without warning, a third projectile wave came barreling into the hull of the ship again—a miscalculation. Steam hissed into the cabin, evident of a dead-on collision dooming the ship into an irreparable state. The small space that once felt like refuge was quickly collapsing on itself like a shrinking coffin. Then, an explosion so deafening it sent Myrtle lurching and tumbling through the halls of the narrowing ship.\n\n\t[i][No, no, no!][/i]\n\n\tMyrtle screamed as her junk ship groaned and jostled violently, indeed spiraling faster toward the event horizon. The ship display buzzed bright, incomprehensible colors, reeling from the aftermath as well. Overhead, an auditory countdown ensued.\n\n\t[i][Twelve minutes. That’s all I have left. Alina!][/i]\n\n\tShe shouted into the receiver, but only a static cry answered. The gravitational distortion was too severe now for conventional radio waves to escape. The ship writhed as tidal forces began to pull its structure apart by its frames. Warning lights cascaded across her console like falling stars. Myrtle felt the first real hints of stretching—a strange sensation starting from her scalp and rippling to the bottom of her toes, as if they were being gently coaxed from each other.\n\n\t[i][Crap, urgh…ahhh!][/i]\n\n\tAnd so that was the end of Myrtle, so we all thought in unison. As she crossed the event horizon, time itself seemed to pause—a moment stretched infinitely thin.\n\n\tBut the blackness before her wasn’t empty anymore— it shriveled into a crude tunnel of impossible mathematics, snapping the fabric of her being back into place as if she was just a mere rubber band. It seems the black hole was now a bridge, not an endless well.",
			"story_picture": "res://Assets/Sprites/5_drawing.png"
		},
		{
			"chapter_number": "CHAPTER 6",
			"chapter_name": "An Alternate Vision",
			"main_story_text": "\tA blinding light—the reverse of a black hole, a singularity that expelled rather than consumed. Through this white hole, Myrtle glimpsed another universe: familiar yet altered. On a ship identical to the mothership she'd left behind, she saw herself embracing Alina—both older, both alive.\n\n\t[i][A world where we made it. Where time flows differently. Where we found each other.][/i] Then the vision collapsed, and Myrtle found herself suspended in the throat of the wormhole, trapped between universes—between endings and beginnings—as time ceased to have meaning at all. Beyond this impossible barrier, Myrtle watched a version of herself piloting a small vessel in reverse trajectory away from the white hole, back toward a waiting boarding ship. Back toward Alina.\n\n\t[i][Is my dying mind playing tricks on me? Am I reliving it all one last time but in reverse?][/i]\n\n\tShe could choose to believe that—the rational explanation, of course. Or maybe, just maybe, that somewhere in the multiverse, versions of themselves -Alina and Myrtle, Myrtle and Alina- found their way back to each other.\n\n\t[i][No, I choose to believe we made it. Somewhere, somehow, we found a way. It’s the least Alina deserves.][/i]\n\n\t Suspended in the non-space between universes, Myrtle felt a strange peace replace her terror. Time was no dictator here, and linearity ceased to exist.\n\n\tMeanwhile, Alina’s ship drifted in the same orbit it had maintained for decades. Its exterior, once a stainless steel gray, was now pitted and discolored from solar radiation. Nothing stirred inside, as most systems have decayed away. A transmission receiver suddenly activated, processing a message so redshifted it had taken nearly 100 years to arrive.\n\n\t[i][Hey Alina, if you receive this, I want you to know that I loved you an—][/i]",
			"story_picture": "res://Assets/Sprites/6_drawing.png"
		}
	]

#navigate to next scene page/contents
func next_page():
	if current_page_index < total_pages - 1:
		current_page_index += 1
		return true
	else:
		#end of story case
		return false

#navigate to previous scene page/contents
func previous_page():
	if current_page_index > 0:
		current_page_index -= 1
		return true
	else:
		#return to home page acse
		return false

#fetch current scene text/visuals
func get_current_page_data():
	return page_data[current_page_index]

#return to begining of game (after credits scene)
func reset_storybook():
	current_page_index = 0

#TO DO LIST
	#1. Add simple looping music to the code, clicks on button presses DONE
	#2. Fix all text to be properly formatted in storybook scenes DONE
	#3. Cleanup code with comments DONE
	#4. Add README, add to GitHub (RM needs font READMEs and music attributions) DONE
	#5. Record demo, make screenshots DONE
	#6. Work on final paper (13-15 pages maybe?) DONE
	#7. Make simple HTML, submit to the Zoo by Wednesday DONE
