﻿/* ‘Kay Sera, Sera */

/*

Vanilla Flags:
FUCKED SERA						If Sexed before
TIMES_RODE_BY_SERA				Times She Rode You
SERA_STUCK_IT_ALL_IN_BUTT		Times She Stuffed Your Ass with Dicks
SERA FUCKED PCS TAILCUNT		Times She Fucked Your Tail Cunt
SERA_URETHRA_TAILFUCKS			Times She Tail-Fucked Your Urethra
SAEN_X_SERA_THREESOME			Sera has fucked Saendra before

New Flags:
PURCHASED_FROM_SERA				Purchased an item from her store
SERA_TRIPLE_X_RATED				Expansion activated
SERA_CREATE_VAG					Sera has created a vagina on you before
SERA_INCH_STEALING_SEX			Times She Absorbed Your Length
SERA_INCH_STEALING_HELP			Times Helped Her Tail
SERA_EXHIBITION_BLOWJOB			Times She Gave You a Public Blowjob
SERA_IN_JARDI_THREESOME			Times Sexed in Threesome with Jardi
SERA_FACE_RIDE_TRAINING			Times She Trained You in Face Riding
SERA_TIT_FUCK_LUCKY_DIP			Times Titfuck or Lucky Dip

*/

public function seraExitToMain():void
{
	pc.removeStatusEffect("Temporary Nudity Cheat");
	pc.removeStatusEffect("Genital Slit Reveal");
	if(pc.getStatusTooltip("Armor Slot Disabled").indexOf("Sera") != -1) pc.removeStatusEffect("Armor Slot Disabled");
	mainGameMenu();
}

// Specialist mods?
// Get this stuff without kissing demon butt
// (available in main menu after you have bought/sold first time)
public function seraSexXXXTFModsCheck():Boolean
{
	var numUnlocked:int = 0;
	
	if(flags["SERA_UNLOCK_CLIPPEX"] != undefined)
	{
		if(!chars["SERA"].hasItemByType(Clippex)) chars["SERA"].inventory.push(new Clippex());
		numUnlocked++;
	}
	else chars["SERA"].destroyItem(new Clippex());
	if(flags["SERA_UNLOCK_SEMENS"] != undefined)
	{
		if(!chars["SERA"].hasItemByType(SemensFriend)) chars["SERA"].inventory.push(new SemensFriend());
		numUnlocked++;
	}
	else chars["SERA"].destroyItem(new SemensFriend());
	if(flags["SERA_UNLOCK_LUCIFIER"] != undefined)
	{
		if(!chars["SERA"].hasItemByType(Lucifier)) chars["SERA"].inventory.push(new Lucifier());
		numUnlocked++;
	}
	else chars["SERA"].destroyItem(new Lucifier());
	
	if(numUnlocked >= 3) return true;
	return false;
}
public function seraSexXXXTFModsAsk():void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	output("<i>“Do you have anything that’s a bit more... ”</i> You want to say “interesting”. <i>“... exotic?”</i>");
	
	// PC has submitted
	if(flags["SERA_TRIPLE_X_RATED"] >= 4)
	{
		output("\n\n<i>“Of course I do silly,”</i> Sera smiles lazily. <i>“Some modder I would be if I didn’t. Why, are you interested?”</i>");
		output("\n\n<i>“Yes mistress,”</i> you say, politely. Sera’s leer widens.");
		output("\n\n<i>“Hmm. I think you’ll have to earn a look at them, pet. Be obedient, get on your");
		if(pc.hasKnees()) output(" knees");
		else output(" kneel");
		output(" down and open that pretty mouth of yours enough times, and who knows how I’ll reward you... ”</i> she finishes on a tuneful, teasing note. You struggle not to roll your eyes.");
		processTime(2);
	}
	// PC has not submitted 
	else
	{
		output("\n\nSera eyes you beadily.");
		output("\n\n<i>“Maybe I do and maybe I don’t, fly [pc.boy]. Maybe you’re a U.G.C. jobsworth who’s come out here to lay down some new regulations on fringe mods, and wants to see if I’ve got some first so [pc.he] can fine me. It’s happened before. So why would I show you anything?”</i>");
		if(pc.IQ() >= 75 || pc.credits > 90000)
		{
			// PC intelligence 75%:
			if(pc.IQ() >= 75)
			{
				output("\n\n<i>“If I were a U.G.C. official I could have pulled you up on about a dozen things in here if I wanted to,”</i> you say, sounding bored. <i>“Not least you throwing something at my head when I first came in. Now you’re refusing to show me whatever passes as your specialist stock after complaining about your competitor taking away your business? Guess I’ll go across the way and see what she’s got to offer.”</i>");
			}
			// Lodes emone:
			else
			{
				output("\n\n<i>“Here.”</i> You casually tap up a credit chit and clatter it onto the counter.");
				output("\n\nSera reluctantly picks it up and looks at the amount it contains. She’s got a decent poker face, but her inhuman eyes go slightly rounder as she does so. <i>“I’m in the mood to lay down some serious dough on gene mods,”</i> you go on breezily. <i>“I was thinking of doing it here. However your attitude is making me think I should take my bank balance elsewhere.”</i>");
			}
			output("\n\n<i>“Alright! Jeez. Just don’t tell anyone with a badge where you’ve got this stuff.”</i> The succubus hurriedly taps into her touch screen. Three new items appear in the buy menu. <i>“One does stuff to your tits. One does stuff to your balls. One will make you look like me. I’m going to assume you aren’t so stupid I have to tell you which is which. Don’t expect me to sell any of it cheap,”</i> she finishes with a scowl. <i>“Not easy sourcing shit like this out here.”</i>");
			
			flags["SERA_UNLOCK_CLIPPEX"] = 1;
			flags["SERA_UNLOCK_SEMENS"] = 1;
			flags["SERA_UNLOCK_LUCIFIER"] = 1;
			processTime(4);
		}
		// Neither:
		else 
		{
			output("\n\n<i>“This is a mod shop!”</i> you snap angrily. <i>“Show me your goddamn mods!”</i>");
			output("\n\n<i>“Stick to the fem-pops, sweetheart,”</i> Sera sneers. <i>“You need to mellow out some. If I had a top shelf I wouldn’t be showing it to some credit-less slack-jawed colony hick who shuttled in here yesterday, I can tell you that.”</i>");
			processTime(2);
		}
	}
	
	clearMenu();
	addButton(0, "Next", seraMenu);
}

public function letSeraFuckYouXXXpac(response:String = "no"):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var cockIndex:int = 0;
	var biggestLength:Number = -1;
	if(pc.hasCock())
	{
		cockIndex = pc.biggestCockIndex();
		biggestLength = pc.cocks[cockIndex].cLength();
	}
	
	if(response == "yes")
	{
		pc.lust(50 + rand(51));
		
		//If PC has 12 inch or bigger penis 
		if(flags["SERA_TRIPLE_X_RATED"] == undefined && pc.hasCock() && pc.biggestCockLength() >= 12)
		{
			output("<i>“Yes,”</i> you say, trying to keep your voice level. <i>“I’d be interested in that.”</i>");
			output("\n\n<i>“Mmm, I bet,”</i> says Sera, smiling... or at least displaying her teeth. Her soft palm moves up and down your [pc.cock " + cockIndex + "] slowly, easing then contracting as she breathes out, long and low, in your ear. You open your mouth as you become fully erect, slowly but inexorably... then you gasp and tense up as she suddenly stops, ruthlessly tightening her grip. <i>“But </i>this<i> isn’t acceptable,”</i> she goes on smoothly. <i>“I can’t be having any bitch of mine swinging around a dick bigger than my own. Status thing, and it doesn’t suit you anyway. So if you’re interested in me, you’re gonna have to prove it. Shrink that ugly piece of meat down, then maybe we’ll talk.”</i> She holds on for a moment longer before blessedly releasing, taking the razor sharp claws poking into your thigh with her. The succubus steps back to the counter, ass bouncing ever-so-slightly, and calmly goes back to filing her nails as if nothing happened.");
			
			processTime(2);
			flags["SERA_TRIPLE_X_RATED"] = 0;
		}
		//Subsequent “sex” if PC has shrunk below 12 inches
		else if(flags["SERA_TRIPLE_X_RATED"] == 0 && pc.hasCock() && pc.biggestCockLength() < 12)
		{
			output("Haltingly, you tell Sera you have done as she asked. She looks at you uncomprehendingly for a moment, and then wicked delight spreads across her face.");
			if(pc.isCrotchExposed())
			{
				output("\n\n<i>“Let me see,”</i> she commands. Feeling deeply embarrassed, you");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" part your genital slit and");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" flourish your [pc.cock " + cockIndex + "]. It is inescapably forlorn in comparison to how it used to look.");
			}
			else
			{
				output("\n\n<i>“Take your stuff off,”</i> she commands. <i>“Let me see.”</i> Feeling deeply embarrassed, you shuffle out of your [pc.lowerGarments]");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(", part your genital slit");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" and display your [pc.cock " + cockIndex + "]. It’s rather forlorn in comparison to how it used to look.");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			output("\n\n<i>“Oh. My. God,”</i> glees the succubus, balling her fists, leering from ear to ear. <i>“I can’t believe you actually did it! I said do and you actually did...”</i> she’s actually getting hard looking at you. She grasps her own shaft, rubbing it almost subconsciously as she stares into your eyes. <i>“How does it feel now? More sensitive? Is it harder to resist cumming? Did you think about me as you shrank it? Did you whisper “mistress” as your pride disappeared, bit by bit? Do you like how it looks in comparison to mine now, all cute and sissy-like?”</i> You don’t know how to respond to this deluge of questions and you feel a shaky, hot emotion at the way she is openly masturbating at what she’s made you do: somewhere between deep shame and naked lust. It intensifies as she gets up and strides over to you, deliberately pushing her fiercely erect foot long shaft into your tumescent [pc.cock " + cockIndex + "]. You stare into her fierce, round face, heart thumping.");
			output("\n\n<i>“You’ve proven yourself to me, my new pet,”</i> she breathes, her eyes half-slitted, almost post-coital. She runs a finger down your cheek, the softness of her pad followed closely by the scrape of her nail. <i>“So next time you’re feeling frisky, you");
			if(pc.hasKnees()) output(" get on your [pc.knees]");
			else output(" crouch down");
			output(", call me “mistress”, and we’ll see where it goes.”</i>");
			
			processTime(3);
			flags["SERA_TRIPLE_X_RATED"] = 1;
		}
		//Subsequent “sex” if PC straight up got rid of their penis(es): 
		else if(flags["SERA_TRIPLE_X_RATED"] == 0 && !pc.hasCock())
		{
			output("Haltingly, you tell Sera you have done as she asked. She looks at you uncomprehending for a moment, and then wicked delight spreads across her face.");
			output("\n\n<i>“This?”</i> she gestures at you. <i>“You did this for me? Oh. My. God.”</i> The succubus glees, balling her fists, before controlling herself long enough to adopt a commanding tone.");
			if(!pc.isCrotchExposed())
			{
				output("\n\n<i>“Take your stuff off. Let me see.”</i> Feeling deeply embarrassed, you shuffle out of your [pc.lowerGarments]");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(", part your genital slit");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" and display your");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			else
			{
				output("\n\n<i>“Show me.”</i> Feeling deeply embarrassed you");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" part your genital slit and");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" display your");
			}
			if(pc.hasVagina()) output(" [pc.vaginas].");
			else output(" featureless mound.");
			output("\n\n<i>“I can’t believe you completely got rid of it. I said do and you actually did... more than that, made yourself into a cute little slut/butt slut/cunt boy just for me,”</i> she breathes. She’s actually getting hard looking at you. She grasps her shaft, rubbing it almost subconsciously as she stares into your eyes.");
			output("\n\n<i>“What does it feel like, knowing you’re always going to be the bitch from now on? Knowing the only way you’ll cum is by taking it, hard and deep? Do you like the way every big male and herm looks at you now? Did you think about me as you shrank it? Did you whisper “mistress” as your pride disappeared, bit by bit? How does my dick make you feel now? Make you want to bend over my counter even worse, huh?”</i> You don’t know how to respond to this deluge of questions and you feel a shaky, hot emotion at the way she is openly masturbating at what she’s made you do: somewhere between deep shame and naked lust. It intensifies as she gets up and strides over to you, deliberately pushing her fiercely erect foot long shaft into your stomach");
			if(pc.hasVagina()) output(", the base of it pressing into your [pc.clits]");
			output(". You stare into her fierce, round face, heart thumping.");
			output("\n\n<i>“You certainly proved yourself to me, my new pet,”</i> she breathes, her eyes half-slitted, almost post-coital. She runs a finger down your cheek, the softness of her pad followed closely by the scrape of her nail. <i>“So next time you’re feeling frisky, you");
			if(pc.hasKnees()) output(" get on your [pc.knees]");
			else output(" crouch down");
			output(", call me “mistress”, and we’ll see where this goes.”</i>");
			
			processTime(3);
			flags["SERA_TRIPLE_X_RATED"] = 2;
		}
		//If PC grows beyond 12 inches after unlocking further scenes 
		else if(pc.hasCock() && pc.biggestCockLength() >= 12)
		{
			output("Sera glowers at you as you obediently kneel in front of her, her pretty face twisted up as she considers you, as if she can smell something unpleasant.");
			if(!pc.isCrotchExposed())
			{
				output("\n\n<i>“Take your pants off,”</i> she commands. Slowly you get up and do as she asks,");
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" parting your genital slit and");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				output(" eventually allowing your [pc.cock " + cockIndex + "] to flop out into the walnut scented air. You and it quail under the succubus’s withering glare.");
				pc.createStatusEffect("Temporary Nudity Cheat");
			}
			if(flags["SERA_INCH_STEAL"] == undefined)
			{
				output("\n\n<i>“");
				//PC shrank themselves before:
				if(flags["SERA_TRIPLE_X_RATED"] == 1) output("So you’ve overgrown your cock again,”</i> she says softly. The tension in her face and flared nostrils suggest she’s angrier now than you’ve ever known. <i>“Despite the fact I specifically told you not to.");
				else if(flags["SERA_TRIPLE_X_RATED"] == 2) output("So you went and grown a new cock... and made it monstrously ugly to boot,”</i> she says softly. The tension in her face and flared nostrils suggest she’s angrier now than you’ve ever known. <i>“Despite the fact I specifically told you why that wouldn’t be ideal for you.");
				else output("Are you just fucking with me?”</i> she says sharply, glaring at your [pc.cock " + cockIndex + "] with disgust. The tension in her face and flared nostrils suggest she’s extremely pissed off. <i>“Despite the fact I specifically told you to shrink that monster down, you have the gall to come strolling into my shop thinking you’re all large-and-in-charge.");
				output(" Do you know how ridiculous you look? An obedient slut like you swinging around an elephant trunk like that, probably imagining themselves the biggest alpha in the jungle instead of a stupid little [pc.boy] who’s gotten into daddy’s things. I guess this means you aren’t interested in this relationship anymore,”</i> she goes on calmly, examining her nails. <i>“That can be the only reason why you would disobey me so flagrantly.”</i>");
				
				processTime(3);
				flags["SERA_TRIPLE_X_RATED"] = -1;
			}
			else 
			{
				output("\n\n<i>“You just never learn, do you?”</i> Sera says in anger, flicking the tip of her foot on your [pc.cock " + cockIndex + "]. <i>“You’re supposed to be my bitch, not some fat penis slug... If you’re still interested in doing this, I’ll have to force that trouser serpent of yours down to size, especially if you’re not going to do it yourself. Got it?”</i>");
				
				processTime(1);
				clearMenu();
				addButton(0, "Yes Shrink", letSeraFuckYouXXXpac, "yes shrink", "Accept", "Allow Sera to shrink your [pc.cock " + cockIndex + "].");
				addButton(1, "Got It", letSeraFuckYouXXXpac, "don't show me", "Refuse", "Tell her you’ve got this covered.");
				addButton(2, "Nevermind", seraInchStealing, "nevermind", "Nevermind", "Actually, you’d rather not at this time....");
				if(flags["SERA_TRIPLE_X_RATED"] >= 4) addDisabledButton(3, "Don't Care", "Not Interested", "You really don’t have the power to tell her off now that you’re committed to her being your Mistress.");
				else if(pc.WQ() >= 50) addButton(3, "Don't Care", letSeraFuckYouXXXpac, "not interested", "Not Interested", "Tell her you are not putting up with her attitude anymore.");
				else addDisabledButton(3, "Don't Care", "Not Interested", "You really don’t have the willpower to tell her off....");
				return;
			}
		}
		//PC Does Not Have 12” Inch or more cock
		else
		{
			output("<i>“Yes,”</i> you say, trying to keep your voice level. <i>“I’d be interested in that.”</i>");
			output("\n\n<i>“Mmm, I bet,”</i> says Sera, smiling...or at least displaying her teeth.");
			if(pc.hasGenitals())
			{
				if(!pc.isCrotchExposed())
				{
					output(" In an instant, she undoes your [pc.lowerGarments] to get at your [pc.groin].");
					pc.createStatusEffect("Temporary Nudity Cheat");
				}
				if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
				{
					output(" Finding your genital slit, she carefully parts it.");
					pc.createStatusEffect("Genital Slit Reveal");
				}
				if(pc.hasCock()) output(" Her soft palm moves up and down your [pc.cock " + cockIndex + "] slowly, easing then contracting");
				else output(" Her finger-pad moves slowly around your [pc.clit], gently cresting it now and then");
				output(" as she breathes out, long and low, in your ear.");
			}
			else output(" She breathes out, long and low, in your ear.");
			output(" <i>“And you’re a flavor of meat I happen to like. A nice cute " + pc.mfn("bitch boi", "girl slut", "manslut") + " who knows [pc.his] place. Or do you?”</i> You’ve gotten so into the expert movement of her fingers this last bit, asked in a tone of genuine enquiry, catches you by surprise.");
			output("\n\n<i>“I... yes, I do.”</i> You respond. Sera’s nails dig into your skin as she grips your jaw and makes you gaze into her impassive expression.");
			output("\n\n<i>“Mistress.”</i>");
			output("\n\n<i>“Mistress. Yes I do, mistress.”</i>");
			output("\n\n<i>“Hmm,”</i> says Sera coolly. <i>“I think you’re gonna have to prove it.”</i>");
			if(pc.hasGenitals())
			{
				output(" Your urgently");
				if(pc.hasCock()) output(" erect cock");
				else output(" beading pussy");
				output(" practically cries out in exasperation as she pulls her hand away");
			}
			output(".");
			output("\n\n<i>“Kneel.”</i> You do it straight away, gazing up at the perfectly formed purple demon and her idly bobbing cock; you can guess what comes next. But contrary to your expectations, she turns around and bends over slightly. You are faced with her perky, round bottom.");
			output("\n\n<i>“Kiss it,”</i> she says. You can tell from her tone she’s trying not to laugh. <i>“Kiss my ass, if you really know your place.”</i>");
			
			processTime(4);
			flags["SERA_TRIPLE_X_RATED"] = 3;
		}
		
		clearMenu();
		if(flags["SERA_TRIPLE_X_RATED"] < 0)
		{
			addButton(0, "Interested", letSeraFuckYouXXXpac, "interested", "Interested", "Tell her you are still interested.");
			if(flags["SERA_TRIPLE_X_RATED"] >= 4) addDisabledButton(3, "Don't Care", "Not Interested", "You really don’t have the power to tell her off now that you’re committed to her being your Mistress.");
			else if(pc.WQ() >= 50) addButton(1, "Don't Care", letSeraFuckYouXXXpac, "not interested", "Not Interested", "Tell her you are not putting up with her attitude anymore.");
			else addDisabledButton(1, "Don't Care", "Not Interested", "You really don’t have the willpower to tell her off....");
		}
		else if(flags["SERA_TRIPLE_X_RATED"] == 3)
		{
			addButton(0, "Kiss", letSeraFuckYouXXXpac, "kiss", "Kiss", "Obey your mistress and give her a smooch on her booty.");
			addButton(1, "Perform", letSeraFuckYouXXXpac, "perform", "Perform", "Surprise your mistress with a little more than what she’s asking for.");
		}
		else addButton(0, "Next", seraExitToMain);
	}
	else if(response == "no")
	{
		output("You take a deep breath and then step backwards, ripping away from the succubus’s hand.");
		output("\n\n<i>“I’m sorry, I - ”</i>");
		output("\n\n<i>“Whatever.”</i> Sera turns back to the counter with a flick of the horn, wholly unconcerned. <i>“I’ve got no time for cowards. You want to bend over that desk for me go ahead any time, but don’t ever imagine I’m giving you a cum enema because I’m interested in you.”</i> She returns to her nail file as if nothing happened.");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraSexMenu);
	}
	else if(response == "not interested")
	{
		output("You feel deep resentment at the frankly pathetic way she’s treating you.");
		output("\n\n<i>“I’m keeping this just the way it is,”</i> you say, gripping your [pc.cock " + cockIndex + "] protectively. <i>“And if you can’t handle that, that’s your problem.”</i>");
		output("\n\n<i>“Whatever,”</i> replies Sera. She looks at you with slitted yellow disdain one last time before returning to her file and magazine. <i>“If you think I’m going to play kiss-chase with a disobedient " + pc.mf("bastard", "bitch") + " you’ve got another thing coming. Good luck using that thing. You’re going to need it.”</i>");
		
		//Sex/interactions other than mercantile disabled
		flags["SERA_NO_SEX"] = 1;
		
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "interested")
	{
		output("<i>“No! No, look, it was a mistake,”</i> you say. <i>“I didn’t mean it. I was trying some new modifications, and then...”</i> You trail off as she stares at you balefully for a couple of long moments.");
		output("\n\n<i>“Hmm. Well, I know you have difficulty controlling the impulse to put things in your mouth,”</i> she says, lips twitching slightly. <i>“But it’s not good enough, slut. You are going to shrink it down before we do anything again. Understood?”</i>");
		output("\n\n<i>“Yes mistress,”</i> you say, relieved. She continues to consider you for a while longer, that smirk continuing to tease at her mouth.");
		output("\n\n<i>“I have a way of doing it,”</i> she murmurs eventually. <i>“Slightly unorthodox, but since you’ve shown a willingness to mend your ways...”</i>");
		
		// [Show me] [No]
		clearMenu();
		addButton(0, "Show Me", letSeraFuckYouXXXpac, "show me", "Accept", "Tell her you want to see what she has in store.");
		addButton(1, "No", letSeraFuckYouXXXpac, "don't show me", "Refuse", "Tell her you’ve got this covered.");
	}
	else if(response == "don't show me")
	{
		output("<i>“Thank you mistress,”</i> you say nervously. <i>“But I will do it myself.”</i>");
		output("\n\n<i>“See that you do.”</i> She turns away with a flick of the tail.");
		
		//Sex/Talk disabled until biggestcock < 12”
		flags["SERA_NO_SEX"] = -1;
		
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "show me")
	{
		//First time PC overgrew:
		if(flags["SERA_INCH_STEAL"] == undefined)
		{
			output("<i>“I’m going to be lenient with you,”</i> she says softly. She doesn’t look lenient. She looks extremely angry. She strides forward and grabs your [pc.cock " + cockIndex + "] hard. <i>“Because you’re a good slut who can’t help needing a firm hand to guide them from time to time. This - </i>this<i> isn’t acceptable,”</i> she goes on smoothly, clenching her grip up around your manhood, almost hard enough to be painful.");
			if(flags["SERA_TRIPLE_X_RATED"] == undefined || flags["SERA_TRIPLE_X_RATED"] > 0) output(" <i>“I can’t be having any bitch of mine swinging around a dick bigger than my own. Status thing, and it doesn’t suit you anyway. So you are going to let me shrink it down to a size more befitting you. Capiche?”</i>");
			processTime(1);
			clearMenu();
			addButton(0, "Yes", letSeraFuckYouXXXpac, "yes shrink", "Yes", "Agree to shrink your penis.");
			addButton(1, "No", letSeraFuckYouXXXpac, "no shrink", "No", "Refusing her offer this far may piss her off.");
		}
		// Inch Stealing
		else seraInchStealingIntro();
	}
	else if(response == "no shrink")
	{
		output("You feel deep resentment over the frankly pathetic way she’s treating you. You look her steadily in the eye.");
		output("\n\n<i>“Take your hand the fuck off what doesn’t belong to you.”</i>");
		output("\n\nSera lets go. She looks at you with yellow-slit disdain one last time before returning to her file and magazine. <i>“If you think I’m going to play kiss-chase with a disobedient " + pc.mf("bastard", "bitch") + " you’ve got another think coming. Good luck using that thing. You’re going to need it.”</i>");
		
		//Sex/interactions other than mercantile disabled
		flags["SERA_NO_SEX"] = 1;
		
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "yes shrink")
	{
		output("<i>“I understand, mistress,”</i> you say tentatively. <i>“I will do as you ask.”</i> She keeps ahold of your [pc.cock " + cockIndex + "] for a while longer, staring into your [pc.eyes], a smile twitching the corners of her cerulean mouth.");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraInchStealingIntro);
	}
	else if(response == "kiss")
	{
		output("Well, you’ve come this far... and it’s not the ugliest thing you’ve ever faced. After a moment’s pause, you awkwardly bob forward and peck one of the soft, purple cheeks.");
		output("\n\n<i>“And the other one!”</i> You roll your eyes, scootch over and press your lips into her other warm buttock. Sera turns back around, giggling to herself, looking down at you fondly. <i>“Ohoh... I wish I’d put some nice, wet, red lipstick on you first. It would suit you, too.”</i>");
		output("\n\n<i>“Is that all, mistress?”</i> you say, trying to keep the exasperation out of your voice. She slides her clawed hand");
		if(pc.hasHair()) output(" through");
		else output(" across");
		output(" your [pc.hair] soothingly.");
		output("\n\n<i>“You’ve proved yourself to me my new pet, don’t you fret. So next you’re feeling frisky, you");
		if(pc.hasKnees()) output(" get on your [pc.knees]");
		else output(" crouch down");
		output(", call me “mistress”, and we’ll see where it goes.”</i>");
		
		flags["SERA_TRIPLE_X_RATED"] = 4;
		flags["SERA_NO_SEX"] = undefined;
		
		processTime(2);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else if(response == "perform")
	{
		output("Your heart hops slightly as you feel an overwhelming desire to demonstrate your commitment to your sadistic new mistress. You wet your [pc.lips] and gently press them into a soft, purple cheek. You keep going until your face is practically buried in warm flesh, before slowly withdrawing. When your lips finally leave her flawless hill, you open your mouth and begin to gently lick all around the red pucker you’ve created.");
		output("\n\n<i>“Oh wow,”</i> comes the voice of Sera, somewhere above you. She sounds both amused and slightly awed. <i>“I wasn’t wrong about you, was I? You and me... this is going to be a match made in heaven. Somewhere biblical, anyway.”</i> Her tone suddenly turns imperious. <i>“The other cheek now, bitch.”</i>");
		output("\n\nWithout complaint you turn to her second buttock and repeat the process, delighting in her pillowy warmth as you push your mouth into it, before giving it a gentle tongue bath. You top the performance off with a small, contented sigh you adjudge that the succubus cannot help but hear. She turns back around, and gazes down at you with a fierce possessiveness. Her dick is pointing upwards and her nipples are rock hard.");
		output("\n\n<i>“Thank you, mistress,”</i> you say sweetly. She slides her clawed hand");
		if(pc.hasHair()) output(" through");
		else output(" across");
		output(" your [pc.hair].");
		output("\n\n<i>“You’ve certainly proved yourself to me, my new pet,”</i> she husks. <i>“So next time you’re feeling frisky, you");
		if(pc.hasKnees()) output(" get on your [pc.knees]");
		else output(" crouch down");
		output(", and we’ll see what other services you can provide your mistress.”</i>");
		
		flags["SERA_TRIPLE_X_RATED"] = 4;
		flags["SERA_NO_SEX"] = undefined;
		
		processTime(2);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
	else
	{
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
}

// Inch Stealing
public function seraInchGain(lengthGain:Number = 0, set:Boolean = false):Number
{
	if(flags["SERA_INCH_STEAL"] == undefined) flags["SERA_INCH_STEAL"] = 0;
	if(set) flags["SERA_INCH_STEAL"] = lengthGain;
	else if(lengthGain != 0) flags["SERA_INCH_STEAL"] += lengthGain;
	if(flags["SERA_INCH_STEAL"] < 0) flags["SERA_INCH_STEAL"] = 0;
	
	return flags["SERA_INCH_STEAL"];
}
public function seraInchStealingIntro(response:String = ""):void
{
	clearOutput();
	showSera();
	
	var cockIndex:int = pc.biggestCockIndex();
	var biggestLength:Number = pc.cocks[cockIndex].cLength();
	
	if(response == "ask her")
	{
		if(!pc.isCrotchExposed())
		{
			output("Quickly removing your [pc.lowerGarments]");
			if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
			{
				output(" and parting your genital slit");
				pc.createStatusEffect("Genital Slit Reveal");
			}
			output(",");
			pc.createStatusEffect("Temporary Nudity Cheat");
		}
		else
		{
			output("Swaying your crotch");
			if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
			{
				output(" and parting your genital slit");
				pc.createStatusEffect("Genital Slit Reveal");
			}
		}
		output(" you turn to your mistress and ask her if there is anything she can do about your [pc.cock " + cockIndex + "].");
		if(biggestLength >= 12) output("\n\n<i>“Ugh, look at that thing,”</i> she scoffs. <i>“Yes, I can do something about that, but it won’t be for you--it’ll be for </i>me<i>.”</i>");
		else if(biggestLength <= 11.5 && biggestLength >= 7) output("\n\n<i>“I think it looks perfect,”</i> she compliments, but it is quickly reversed by, <i>“but if you think that makes you look too manly, I have a solution to make you better suited to be my sissy " + pc.mf("boy", "slut") + ".”</i>");
		else if(biggestLength <= 6.5 && biggestLength >= 4.5) output("\n\n<i>“Aw, how adorable,”</i> she teases. <i>“What makes you want to change that puny pecker of yours?”</i>");
		else output("\n\n<i>“Mmm, are you sure you want me to fiddle with your petite pretty?”</i> she sneers, <i>“It compliments your status quite well.”</i>");
		output("\n\nShe gives you a loud slap on your [pc.ass] and grabs your cock, taking a moment to examine it some more.");
		output("\n\n<i>“Since you sound so interested, I’ll show you what I’ve got in store for you, pet - but are you ready for it?”</i>");
		
		processTime(2);
		clearMenu();
		addButton(0, "Yes", letSeraFuckYouXXXpac, "yes shrink", "Yes", "Allow Sera to alter your [pc.cock " + cockIndex + "].");
		addButton(1, "Nevermind", seraInchStealing, "nevermind", "Nevermind", "Actually, you’d rather do something else....");
		return;
	}
	
	author("Nonesuch");
	
	// First time
	if(flags["SERA_INCH_STEAL"] == undefined)
	{
		output("Sera takes you by the hand and leads you briskly into the back of the Dark Chrysalis, down a narrow corridor and into another room. It’s dominated by a large, circular bed, unkempt, as everything in here seems to be. Clothes, headphones and who knows what else clutter the floor and shelves. You can’t really tell because it’s even duller in here than in the shop, if that’s possible – small, purple shaded wall fixtures seem to throw gloom rather than light. There’s a gentle, muffled white noise coming from somewhere – a stereo? – that permeates the perfumed space. You try hard not to step on anything as your demonic mistress leads you to the bed, pushes you down on it and then reaches beneath it.");
		output("\n\n<i>“This,”</i> she breathes, displaying a squat bottle of orange ointment to you, <i>“is something very special. You’re going to enjoy what it does, and so am I.”</i> She unscrews the glass stopper. A greasy, honeyed smell touches your nostrils; it gets stronger when Sera pushes the bottle into your hands, slithering onto the bed next to you as she does.");
		output("\n\n<i>“The first step is very simple,”</i> she whispers in your ear, her hot weight against your side. Her pupils are piercingly yellow in here, as day-glo as her horns. <i>“You’re going to – ah - apply that, to me.”</i> Her semi-erect prick flops into your lap.");
		processTime(4);
		// [Do it] [Perform]
		clearMenu();
		addButton(0, "Do It", seraInchStealing, "first do it", "Do It", "Apply the potion onto her penis.");
		addButton(1, "Perform", seraInchStealing, "first perform", "Perform", "Apply the potion onto her penis - but make a show of it.");
	}
	else
	{
		if(response == "shrink me")
		{
			output("Haltingly, you say you’d like to do some adjustments downstairs.");
			output("\n\nSera smiles toothily as she silently takes you by the hand and leads you into her strange, spacey bedroom.");
		}
		else output("Sera silently takes you by the hand and leads you into her strange, spacey bedroom.");
		if(pc.isCrotchGarbed())
		{
			output("\n\n<i>“Take ‘em off,”</i> she commands once she’s sat you on the bed. <i>“Let’s see.”</i> Meekly you do as she says. You");
			pc.createStatusEffect("Temporary Nudity Cheat");
		}
		else output("\n\n<i>“Let’s see.”</i> she says. You");
		if(pc.hasStatusEffect("Genital Slit") && !pc.hasStatusEffect("Genital Slit Reveal"))
		{
			output(" part your genital slit and you");
			pc.createStatusEffect("Genital Slit Reveal");
		}
		else if(pc.genitalLocation() == 0) output(" thrust your [pc.hips] and you");
		output("r [pc.cock " + cockIndex + "] flops onto the duvet.");
		
		// 12 inches or over:
		if(biggestLength >= 12) output("\n\n<i>“We’re getting there,”</i> she sighs, twisting her lip at the sight of your oversized member. <i>“Slowly but surely. You better not still be taking dick enhancers out there,”</i> she suddenly says sharply, grabbing you by the shoulder and glaring into her eye. <i>“I’m not wasting my time on this simply because it’s fun watching you squirm.”</i>");
		// 11.5-7 inches:
		else if(biggestLength <= 11.5 && biggestLength >= 7) output("\n\nShe looks at you slyly, drifting her hand down to brush it. <i>“You know that’s an alright size, right? I don’t mind what you do with your prick, as long as it’s not bigger than mine.”</i> You close your eyes and say you want it be smaller. You might be imagining it, but you think Sera’s breath comes quicker to your words.");
		
		output("\n\n<i>“Ok then, pet,”</i> she breathes. <i>“Let’s make it happen.”</i>")
		processTime(3);
		
		// Mod size check!
		if(pc.cocks[cockIndex].cLengthRaw <= 1 && biggestLength >= 4.5)
		{
			output("\n\nYou can feel your pulse beat as you look down at your [pc.cock " + cockIndex + "]. She reaches in and squeezes it, making you gasp - but something makes her stop and pause.");
			output("\n\n<i>“Odd... Even for its size, I don’t think I’ll be able to get your pecker any smaller than this...”</i> she speculates. Giving a disappointed sigh, she continues, <i>“Look, if you’re trying to spoil the mood with some size-locking mods or bloat-loving parasites then woop-dee-doo mission accomplished, meat.”</i> She stares you down. <i>“You better fix it or we can’t continue with your sissy-fication. Seriously. You’ve got me all worked up for nothing!”</i>");
			output("\n\nWith that, you");
			if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" re-dress,");
			output(" take your things and leave the room.");
			output("\n\n<b>It seems something is preventing your penis from getting any smaller!</b>");
			
			clearMenu();
			addButton(0, "Next", seraExitToMain);
			return;
		}
		// 6.5-4.5 inches:
		else if(biggestLength <= 6.5 && biggestLength >= 4.5) output("\n\nYou can feel your pulse beat as you look down at your cock, toy-like in comparison to Sera’s. She reaches down and squeezes it, easily wrapping her whole hand around it, making you gasp. <i>“You want me to make it even smaller?”</i> she whispers in your ear as she jerks her wrist. <i>“Make it into a cute little sissy twig that every girl in the galaxy will d’aww over? Maybe put a little bow around it?”</i> She giggles. <i>“Why am I asking this like you have an option? Let’s get to it.”</i>");
		// Less than 4.5, 
		else if(biggestLength < 4.5)
		{
			// [Yes] [No]
			clearMenu();
			// 1 cock:
			if(pc.cockTotal() == 1)
			{
				output("\n\nSera looks down at your petite boy clit. She bends down and breathes on it. You bite your lip. It’s enough; so sensitive is it, and so sensitive are you to her, it reacts, twitching, almost becoming hard.");
				output("\n\n<i>“Mmm,”</i> she says with deep contentment. <i>“So cute. So well suited for my eager little " + pc.mf("bitch boy", "dick girl") + ".”</i> She reaches out and takes you by the chin, making you stare into her face. Her expression is sober. <i>“I can’t shrink that any further. If I do, it’ll make you female. I can do that if you really want. I won’t force you to.");
				if(!pc.hasVagina()) output(" If I do, though...”</i> She sucks in her breath, her eyes burning. <i>“...I won’t be held responsible for my actions afterwards.");
				output("”</i> There’s a long pause. <i>“Do you really want me to do it?”</i>");
				
				if(pc.removeCockUnlocked(cockIndex, 1))
				{
					if(!pc.hasVagina() && !pc.createVaginaUnlocked(1)) addDisabledButton(0, "Yes", "Yes", "Something is preventing you from changing down there!");
					else addButton(0, "Yes", seraInchStealing, "lose penis", "Yes", "Choose to lose your manhood completely.");
				}
				else if(pc.isBro()) addDisabledButton(0, "Yes", "Yes", "What--Why would you want to lose your manhood?!");
				else addDisabledButton(0, "Yes", "Yes", "Something is preventing your [pc.cock " + cockIndex + "] from being removed!");
			}
			// more than 1 cock:
			else
			{
				output("\n\n<i>“Mmm,”</i> she says with deep contentment. <i>“So cute. So well suited for my eager little " + pc.mf("bitch boy", "dick girl") + ".”</i> She reaches out and takes you by the chin, making you stare into her face. Her expression is sober. <i>“I can’t shrink that any further. If I do, it’ll disappear for good.”</i> There’s a long pause. <i>“Do you really want me to do it?”</i>");
				
				if(pc.removeCockUnlocked(cockIndex, 1) && !pc.isBro()) addButton(0, "Yes", seraInchStealing, "standard", "Yes", "Choose to shrink your [pc.cock " + cockIndex + "] completely.");
				else addDisabledButton(0, "Yes", "Yes", "Something is preventing your [pc.cock " + cockIndex + "] from being removed!");
			}
			addButton(1, "No", seraInchStealing, "keep penis", "No", "Choose to keep your [pc.cock " + cockIndex + "] instead.");
			return;
		}
		clearMenu();
		addButton(0, "Next", seraInchStealing, "standard");
	}
}
public function seraInchStealing(response:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var cockIndex:int = pc.biggestCockIndex();
	var biggestLength:Number = pc.cocks[cockIndex].cLength();
	
	if(response == "back away")
	{
		output("You fight the urge to obey your mistress and turn away as if you didn’t notice her demands.");
		output("\n\n<i>“Why you disobedient little fuck!”</i> she scolds as you continue pretending to browse her store....");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
		return;
	}
	else if(response == "nevermind")
	{
		output("On second thought,");
		if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" you re-cover your cock");
		else output(" you pull your cock back");
		output(" and tell Sera you’d rather not have her mess with it, at least for now.");
		output("\n\nWith a deep, annoyed sigh she berates you, <i>“Fine, fine. But don’t go wasting my time asking for things you are not willing to follow through with, got it?”</i>");
		output("\n\nYou nod.");
		if(biggestLength >= 12) output("\n\nWith that she mutters, <i>“Keep carrying that disgusting beast around and I don’t think you care to be my pet anymore....”</i>");
		
		processTime(1);
		pc.removeStatusEffect("Temporary Nudity Cheat");
		seraMenu();
		return;
	}
	else if(response == "first do it" || response == "first perform")
	{
		if(response == "first do it")
		{
			output("You exhale slowly as you dip your fingers into the jar, smear the stuff all around your hand and reach across to grip Seras thick girth in the darkness. She sighs as you move it up her shaft, the tan balm adhering easily to her.");
			output("\n\nThe atmosphere here is strange, uncanny; the strange white noise makes you feel both detached and sensitive, not really in control. It combines with what you are doing in this dark space, this odd ointment and the aggressive demon who has taken possession of you, to give you a sense of sexual, sensual surrealism. You curl your fingers into the pot again before slathering the grease all around Sera’s hardness, burningly hot to your touch.");
			processTime(3);
		}
		else if(response == "first perform")
		{
			output("You feel like you have something to prove to your mistress. You exhale slowly as you dip your fingers into the jar before reaching up to your mouth. You slather the stuff thickly over your [pc.lips], before bending over Sera’s thick shaft.");
			output("\n\n<i>“Oh you are a clever, filthy little [pc.boy],”</i> she groans, gripping your [pc.hair] as you engulf her prick, running your lips down her hot, hard flesh. The tan balm adheres to her easily, and soon enough you have to pull away to apply more of it to your lips.");
			output("\n\nThe atmosphere in here is strange, uncanny; the strange white noise makes you feel both detached and sensitive, not really in control. It combines with what you are doing in this dark space, this odd ointment and the aggressive demon who has taken possession of you, to give you a sense of sexual, sensual surrealism.");
			processTime(5);
		}
		output("\n\n<i>“That’s enough,”</i> says Sera thickly. You disengage from her, feeling mildly dazed.");
		if(pc.isBimbo() || pc.isTreated() || pc.isDependant(Creature.DEPENDANT_CUM)) output(" Your smeared lips feel lavish and vaguely tingly; you stifle the urge to lick them.");
		output(" She turns to you, her bulging cock pointing lividly at your face. <i>“Come sit across me. In close. That’s it.”</i> Her dark, bullet-like nipples press into your [pc.chest] as you shuffle yourself into her on the bed, your [pc.hips] rubbing against her own smooth thighs. She looks down at your semi-erect [pc.cock " + cockIndex + "] disdainfully. <i>“Rub that against me. Nice and slow.”</i>");
		output("\n\nTentatively you grip her waist and do as she says, pumping your hips to frot your prick against hers. The oozing grease it’s covered in makes the friction smooth, there’s plenty of warmth and soon enough you’re erect as she is. Sera responds once you’re there, pumping her smaller cock against yours with harder and harder strokes, clutching your back almost painfully, her mountainous breasts plumping into you. You press into each other with fierce intimacy, jousting your bulging, pleasure-dense cocks.");
		output("\n\nShe reaches forward and limpets her lips on yours, invading your mouth with her tongue, attacking your walls with it fiercely. At the same time a tingling sensation spreads down your [pc.cock " + cockIndex + "]. It suddenly feels achingly sensitive, as if the skin on it has disappeared. You cry out in shock, muffled, around Sera’s tongue. She smirks against your face and then forces herself onto you, forcing you back onto the duvet, holding your arms down as she humps you vigorously, throwing her whole body into it. Your eyes roll to the sensation of the savage friction on your sensitized cock.");
		output("\n\n<i>“You’ve gotta want it,”</i> she snarls wolfishly, her hot breath on your face. <i>“You’ve gotta want your mistress to take it away, to absorb your inches. The more you want it, the better it will work. So say it. Say how much you enjoy me turning you into my blushing, small-dicked beta bitch.”</i>");
		
		processTime(2);
		// [Say it] [Perform]
		clearMenu();
		addButton(0, "Say It", seraInchStealing, "say it", "Say It", "Let her know you want to be her tiny-dicked beta.");
		addButton(1, "Perform", seraInchStealing, "say perform", "Perform", "Really let her know you want to be her puny-penised pansy.");
		return;
	}
	else if(response == "standard")
	{
		output("She gropes around underneath her bed and then tosses you the jar. You exhale slowly into the greasy, honeyed smell, dipping your fingers into the jar, wondering how to apply the stuff this time.");
		
		// [Hand] [Oral]
		clearMenu();
		addButton(0, "Hand", seraInchStealing, "standard hand");
		addButton(1, "Oral", seraInchStealing, "standard oral");
		return;
	}
	else if(response == "lose penis")
	{
		//She durn turn you into a gurl
		output("With a shuddering sigh, you say you want this. You want her to turn you");
		if(!pc.hasVagina()) output(" fully");
		output(" female.");
		output("\n\nSera says nothing as she gropes around underneath her bed and then tosses you the jar. She doesn’t take your eyes off you, though – there is a deep, lizard-like hunger in them, and her huge penis – so different from your own sensitive [pc.cockNoun " + cockIndex + "] that they could be completely alien appendages – is fully erect by the time the container lands into your hand. You breathe in the greasy, honeyed smell, dipping your fingers into the jar, wondering how to apply the stuff this time.");
		
		// [Hand] [Oral]
		clearMenu();
		addButton(0, "Hand", seraInchStealing, "gurl hand");
		addButton(1, "Oral", seraInchStealing, "gurl oral");
		return;
	}
	else if(response == "keep penis")
	{
		output("You shake your head. Sera nods once, and gets up. Although you were expecting a verbal barrage for wasting her time she doesn’t say anything at all as you");
		if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" re-dress and");
		output(" head back out to the shop.");
		processTime(1);
		clearMenu();
		addButton(0, "Next", seraExitToMain);
		return;
	}
	else if(response == "say it" || response == "say perform")
	{
		if(response == "say it")
		{
			output("<i>“Yes, I- I want it...”</i> you whisper.");
			output("\n\n<i>“Louder!”</i>");
			output("\n\n<i>“I want it!”</i> you cry. You arch your back as you cum, thrusted and pummeled to your high by your mistress’s dick; a moment later she joins, making a knowing “ahh” noise as she fountains cum onto your [pc.chest]. It feels like with every euphoric clench of your body your penis is dissipating, surrounded by a hot, shifting, nibbling force which is melting it away. You open your mouth as your tingling dick contracts ecstatically under Sera’s assault.");
		}
		else if(response == "say perform")
		{
			output("<i>“I want it,”</i> you moan. You fill your head with submissive thoughts; how powerful your mistress feels thrusting away at your unworthy cock, how badly you want to please her, how shamefully right it would feel to have a cute, sensitive little boy-clit for a dick...");
			output("\n\n<i>“Louder!”</i>");
			output("\n\n<i>“It belongs to you mistress, it all belongs to you!”</i> you cry out. You arch your back as you cum, thrusted and pummeled to your high by your mistress’s dick; a moment later she joins, making a knowing “ahh” noise as she fountains cum, mingling with yours on your [pc.chest]. It feels like with every euphoric clench of your body your penis is dissipating, surrounded by a hot, shifting, nibbling force which is melting it away. You open your mouth as your tingling dick contracts ecstatically under Sera’s assault.");
		}
		
		// “Say It” takes away 2 inches if cock > 12”, 1.5 if cock < 12”. “Perform” takes away 3.5 inches regardless. “Inch Stealing” option on Sera main menu unlocked. Sera always picks PC’s biggest cock. Track inches taken for Shax’s scene below.
		var inchLoss:Number = 1.5;
		if(biggestLength >= 12) inchLoss = 2;
		if(biggestLength >= 24) inchLoss++;
		if(biggestLength >= 36) inchLoss++;
		if(biggestLength >= 48) inchLoss++;
		if(response == "say perform") inchLoss = Math.round(inchLoss * (7/3));
		if(pc.hasPerk("Mini")) inchLoss *= 2;
		
		if(inchLoss > (pc.cocks[cockIndex].cLengthRaw - 1)) inchLoss = (pc.cocks[cockIndex].cLengthRaw - 1);
		
		pc.cocks[cockIndex].cLengthRaw -= inchLoss;
		
		output("\n\nAfter a moment of hazy, pleasurable floating you clamber onto your elbows to apprehensively gaze down at your gently throbbing dick. Sera lies on her side, hand rested on hip, gazing at you complacently.");
		if(pc.cocks[cockIndex].cLengthRaw <= 1)
		{
			if(pc.cocks[cockIndex].cLength() > 1)
			{
				output(" Your dick shrinks until it suddenly stops and can’t shrink no more... <b>It seems something is keeping your penis from getting any smaller.</b>");
			}
			else
			{
				if(pc.isBro()) output(" FUCK");
				output(" Wow");
				output("... Your dick is");
				if(pc.isBimbo()) output(" like, all");
				output(" tiny now. Your [pc.cockNoun " + cockIndex + "] feels so infantile now... Giving it some exprimental tugs, you confirm that it can’t possibly get any smaller. <b>This seems to be as small as your penis can get.</b>");
			}
		}
		else if(response == "say it")
		{
			output(" It’s gotten slightly but appreciably smaller, maybe a");
			if(inchLoss <= 1) output("n inch");
			else if(inchLoss <= 2) output(" couple of inches");
			else
			{
				output(" few inches");
				if(inchLoss > 3) output(" or so");
			}
			output(".");
		}
		else
		{
			if(inchLoss <= 1) output(" Unsurprisingly, only an inch has been shaved off your length.");
			else
			{
				output(" Oh God... your heart thumps as you look at how much your dick has shrunk.");
				output(" Three");
				if(inchLoss >= 4) output(", four");
				if(inchLoss >= 6) output(", six");
				if(inchLoss >= 12) output(", twelve");
				output(" inches or more disappear from your length...");
			}
			output(" What’s left feels tingly and sensitive.");
		}
		output(" Slowly, you turn and look at Sera’s.");
		if(flags["SERA_INCH_STEAL"] == undefined) output("\n\n<i>“Good, isn’t it?”</i> The demon smiles as she waggles her massive, leaking prick teasingly, swollen by what she has absorbed off you. <i>“But my dick is perfect as it is, as you know. So...”</i> She presses an opal on her harness, and then flops onto her back. Above the swell of her ass, her tail makes a peeling sound as it gains length, swelling out from its base. <i>“Can always use a couple more inches there,”</i> she says, demonstrating it by swishing her spade end and clapping it into your [pc.butt]. She looks down at yours.");
		else output("\n\nThe demon smirks back at you as she waggles her massive, leaking prick teasingly, swollen by what she absorbed off you. She lazily flops onto her back, presses an opal on her harness as she does. Above the swell of her ass, her tail makes a peeling sound as it gains length, swelling out from its base. Humming in contentment, she looks down at yours.");
		
		// 12 inches or over:
		if(biggestLength >= 12) output("\n\n<i>“Still too big I’m afraid, slut,”</i> she sighs. She scrunches your shoulder comfortingly. <i>“Never mind. A few more sessions like this and you’ll be exactly where I want you.”</i>");
		// Under 12 inches:
		else if(flags["SERA_INCH_STEAL"] == undefined) 
		{
			output("\n\n<i>“That wasn’t so hard, was it?”</i> she beams down, relishing what she’s done to you. <i>“A nice eager beta dick, perfect for you.”</i> She slides her hands up your back, brushing her lips against your ear. <i>“Or maybe it’s not?”</i> she whispers. <i>“Maybe you’d like it to be even smaller, pet?");
			if(!pc.hasVagina()) output(" Maybe you’d like to keep on going until I turn you into a girl. Would you like that?");
			output(" If you do... you can always come back.”</i>");
		}
		// Under 12 inches subsequent:
		else
		{
			output("\n\n<i>“Such a pretty, suitable little sissy prick,”</i> she croons. She gazes into your eyes, radiating utter satisfaction. <i>“You’re a very good " + pc.mf("boy", "girl") + ", coming back for these sessions. I only wish every bitch was as committed as you.”</i>");
			// Multicock removal
			if(pc.cockTotal() > 1 && biggestLength < 4.5)
			{
				output("\n\n<i>“This is it, sissy,”</i> she whispers gutturally, her breath hot on your face. <i>“This is me, finally taking it away. At least you’ve got");
				if(pc.cockTotal() == 2)output(" another");
				else output(" others");
				output(" to fill its place.”</i> She giggles, throaty and wicked. <i>“For now.”</i> It’s difficult to do anything but clutch her hot, aggressively writhing flesh, unable to concentrate on anything but her hot meat pushing and beating into your tender [pc.cock " + cockIndex + "]. The hot, shifting, nibble force is surrounding your tenderised cock, making you clench up helplessly as it disappears, centimetre by centimetre. It feels stronger, more overwhelming than ever before...");
				output("\n\n<i>“I’d tell you to want it,”</i> groans Sera above you, her cock head slapping into your midriff, leaving impact marks of pre. <i>“But I already know how very much you do. So – just – fucking – take – it!”</i> She finishes in a gleeful howl as she orgasms, fountaining cum onto your [pc.chest]. You moan as you do the same, your little bud contracting ecstatically under your mistress’s assault, dissolving deliriously, and – gone. Your cum mingles with that of Sera’s, but it comes from your [pc.cockSmallest], bulging and surging in sympathetic reaction to what just happened.");
				output("\n\nAfter a moment of hazy, pleasurable floating you clamber onto your elbows to apprehensively gaze down at your groin. Your [pc.cock " + cockIndex + "], oozing and tingling, has taken the place of your former dick, which has completely disappeared. Slowly, you turn and look at Sera’s.");
				output("\n\nThe demon smirks back at you as she waggles her massive, leaking prick, swollen by what she absorbed off you. She lazily flops onto her back, presses an opal on her harness as she does. Above the swell of her ass, her tail makes a peeling sound as it gains length, swelling out from its base. Humming in contentment, she looks back at you.");
				output("\n\n<i>“There we go dear,”</i> she whispers. <i>“The silly little thing is all gone. Replaced by another silly little thing.”</i> Again the giggle, low and wicked. <i>“You look better with less. Trust me.”</i>");
				
				// Remove cock
				pc.removeCock(cockIndex, 1);
				inchLoss = biggestLength;
			}
		}
		output("\n\nAfter you’ve rested a while longer you");
		if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" shakily re-dress and");
		output(" head back out to the shop, your mistress’s words burning in your mind, very aware of how much more space there is between your [pc.thighs] now.");
		
		processTime(15 + rand(21));
		sera.orgasm();
		pc.orgasm();
		seraInchGain(inchLoss);
	}
	else if(response == "standard hand" || response == "standard oral" || response == "gurl hand" || response == "gurl oral")
	{
		if(response == "standard hand" || response == "gurl hand")
		{
			output("You smear the stuff all around your palm and reach across to grip Sera’s thick girth in the darkness. She sighs as you move it up her shaft, the tan balm adhering easily to her.");
			output("\n\nAgain you have the sense of being detached and sensitive, not really in control. The tactile sensation of your mistress’s prick in your busily working hand, the cloying smell of the ointment combining with the sharp smell of her musk, the muffled white noise which seems to reach into you and make you feel pliable and submissive; you feel aroused, your [pc.eachCock] hardening");
			if(pc.hasVagina()) output(" and your [pc.vagina] moistening");
			output(" as you slather the grease all around Sera’s hardness, burningly hot to your touch.");
		}
		else
		{
			output("You exhale slowly as you dip your fingers into the jar before reaching up to your mouth. You slather the stuff thickly over your [pc.lips], before bending over Sera’s thick shaft.");
			output("\n\n<i>“Such a dedicated little cocksucker,”</i> she groans, gripping your [pc.hair] as you engulf her prick, running your lips down her hot, hard flesh. The tan balm adheres to her easily, and soon enough you have to pull away to apply more of it to your lips. Again you have the sense of being detached and sensitive, not really in control. The tactile sensation of your mistress’s prick moving in your mouth, the cloying smell of the ointment combining with the heavy taste of her musk, the muffled white noise which seems to reach into you and make you feel pliable and submissive; you feel aroused, your [pc.eachCock] hardening");
			if(pc.hasVagina()) output(" and your [pc.vagina] moistening");
			output(" as you slather the grease all around Sera’s hardness. You moan softly as it occurs to you you’re sucking the dick that is shortly going to literally emasculate you.");
		}
		output("\n\n<i>“That’s enough,”</i> says Sera thickly. You disengage from her, feeling mildly dazed.");
		if(pc.isBimbo() || pc.isTreated() || pc.isDependant(Creature.DEPENDANT_CUM)) output(" Your smeared lips feel lavish and vaguely tingly; you stifle the urge to lick them.");
		output(" She turns to you, her bulging cock pointing lividly at your face. <i>“Come sit across me. In close. That’s it.”</i> Her dark, bullet-like nipples press into your [pc.chest] as you shuffle yourself into her on the bed, your [pc.hips] rubbing against her own smooth thighs. She looks down at your semi-erect [pc.cock " + cockIndex + "]");
		if(biggestLength >= 12) output(" disdainfully");
		else output(" with a smirk");
		output(". <i>“");
		if(response == "standard hand" || response == "standard oral") output("Rub that against me");
		else output("Savor it");
		output(". Nice and slow.”</i>");
		output("\n\nTentatively you grip her waist and do as she says, pumping your hips to frot your prick against hers. The oozing grease it’s covered in makes the friction smooth, there’s plenty of warmth and soon enough you’re erect as she is. Sera responds once you’re there, pumping her cock against yours with harder and harder strokes, clutching your back almost painfully, her mountainous breasts plumping into you. You press into each other with fierce intimacy, jousting");
		if(response == "standard hand" || response == "standard oral") output(" your bulging, pleasure-dense cocks.");
		else output(" her massively larger cock into yours, making you arch your back and gasp.");
		output("\n\nShe reaches forward and limpets her lips on yours, invading your mouth with her tongue, attacking your walls with it fiercely. At the same time a tingling sensation spreads down your [pc.cock " + cockIndex + "]. It suddenly feels achingly sensitive, as if the skin on it has disappeared. You cry out");
		if(response == "standard hand" || response == "standard oral")
		{
			output(" in shock, muffled, around Sera’s tongue. She smirks against your face and then lunges herself onto you, forcing you back onto the duvet, holding your arms down as she humps you vigorously, throwing her whole body into it. Your eyes roll to the sensation of the savage friction on your sensitized cock.");
			// 9.5 inches or more:
			if(biggestLength >= 9.5) output("\n\n<i>“You’ve gotta want it,”</i> she snarls wolfishly, her hot breath on your face. <i>“You’ve gotta want your mistress to take it away, to absorb your inches. The more you want it, the better it will work. So say it. Say how much you enjoy me turning you into my blushing, small-dicked beta bitch.”</i>");
			// 9 inches or less:
			else if(biggestLength <= 9) output("\n\n<i>“That’s it, take it, sissy,”</i> she snarls, holding you down, glorying in her power over you. <i>“You love how this feels, don’t you? Me sucking away your manhood, bit by bit, by wanking your pathetic bitch stick silly with my wonderful cock. It feels fucking wonderful, in case you were wondering. It surges into me whilst you’re lying there, gasping and mewling, every thrust making your prick more girly and better suited to being my bottom. Then I transfer it to my tail. A few more inches to flick around over my ass. I barely even think about it after that... until I need to penetrate a slut with it. Then it all comes back. Fitting, huh?”</i> She pauses for breath as she rubs into you frenetically. <i>“You know the drill. Remember: sound like you mean it.”</i>");
			
			processTime(5);
			// [Say it] [Perform]
			addButton(0, "Say It", seraInchStealing, "say it", "Say It", "Let her know you want to be her tiny-dicked beta.");
			addButton(1, "Perform", seraInchStealing, "say perform", "Perform", "Really let her know you want to be her puny-penised pansy.");
			return;
		}
		else
		{
			output(", muffled around Sera’s tongue. She launches herself onto you, forcing you back onto the duvet, holding your arms down as she humps you vigorously, throwing her whole body into it. Your eyes roll to the sensation of the savage friction on your sensitized cock.");
			output("\n\n<i>“This is it, sissy,”</i> she whispers gutturally, her breath hot on your face. <i>“This is me, finally taking it all away. The ability to fuck, rather than be fucked. You should be grateful, you know. Nobody is going to laugh at you in the shower or the bedroom again.");
			if(!pc.hasVagina()) output(" You’re gonna be using a different room from now on, actually. Just one of the many exciting new things you’ll be experiencing.");
			output(" Thank me.”</i> It’s difficult to do anything but clutch her hot, aggressively writhing flesh, unable to concentrate on anything but her hot meat pushing and beating into your tender [pc.cockNoun " + cockIndex + "], but such is the imperative her words instill in you, you still manage a whimpered “hanks”. The hot, shifting, nibble force is surrounding your tenderised cock, making you clench up helplessly as it disappears, centimetre by centimetre. It feels stronger, more overwhelming than ever before...");
			output("\n\n<i>“I’d tell you to want it,”</i> groans Sera above you, her cock head slapping into your midriff, leaving impact marks of pre.");
			if(!pc.hasVagina())
			{
				output(" Dimly, you feel like she’s angling herself differently this time, deliberately thrusting the base of her greased cock between your");
				if(pc.hasLegs()) output(" [pc.legOrLegs]");
				else output(" [pc.thighs]");
				output(". The tingling sensation begins to take hold there, pins and needles sinking into your taint...");
			}
			output(" <i>“But I already know how very much you do. So – just – fucking – take – it!”</i> She finishes in a gleeful howl as she orgasms, fountaining cum onto your [pc.chest]. You moan as you do the same, your little bud contracting ecstatically under your mistress’s assault, but – something is different. Very different. There is no communal mingling of warm cum on your front; it’s all Sera’s. You aren’t ejaculating at all.");
			// Herm
			if(pc.hasVagina()) output(" It’s a sensation you’re familiar with, but your female orgasm is more powerful than it usually is. You shudder and roll under your mistress’s thrusting, incapacitated by the delicious pulses throbbing through you.");
			// Male
			else output(" Whatever is left down there flexes gleefully, but it’s part of something new – something inward which clenches your lower body up in a powerful series of pulses like nothing you’ve ever experienced before.");
			output("\n\nAfter you’ve screamed your last at the ceiling, you float down into what feels like an eternity of hazy, pleasurable floating. You’re not able to summon the strength to get up onto your elbows, so you simply listen to Sera do the usual; the coo of glee at the bloated state of her cock, the click on her harness and the organic peeling sound as she transfers what she’s taken from you to her long tail.");
			
			// Herm
			if(pc.hasVagina())
			{
				//Cock removed, clit increase by 1, libido increase by 1
				pc.removeCock(cockIndex, 1);
				pc.clitLength += 1;
				if(pc.hasPerk("Hung")) pc.clitLength += 1;
				pc.slowStatGain("libido", 1);
				
				output("\n\nHumming happily to herself she bends over you. You’re only able to summon the energy to close your eyes when you feel her fingernails touch your inner thigh.");
				output("\n\n<i>“It’s all gone, dear,”</i> she says merrily. She touches your [pc.clit] gently and you twitch. It feels more sensitive and distended than it used to. <i>“That’s a bit bigger, though. Little reminder of what you once had.”</i> She slides herself into you, clasping your body into hers, drawing your head to her cerulean lips as she gently teases one of your [pc.nipples]. <i>“No more odd looks from guys in the corridors. No more trying to hide bulges in polite society. You’re a girl now, pure and sweet. Of course me and you will know the truth – you had a cock, but your mistress made you cum so bad it melted right off.”</i> She licks behind your ear, tasting your sweat. <i>“Best to leave cocks to those who know how to use them, hmm?”</i>");
				output("\n\nAfter you’ve rested a while longer you");
				if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" shakily re-dress and");
				output(" head back out to the shop, your mistress’s words burning in your mind, very aware of how much more space there is between your [pc.thighs] now.");
				
				processTime(15 + rand(11));
			}
			// Male
			else
			{
				output("\n\nYou are only snapped out of it when a long fingernail flicks one of your [pc.nipples]. You gasp – and your mouth freezes around the sound. The pitch of your voice is higher. You look over at Sera, who’s lying on her side and considering you with a satisfied grin on her face.");
				// Masculine
				if(pc.mfn("m", "f", "n") == "m")
				{
					// B cup or below:
					if(pc.biggestTitSize() <= 2) output("\n\n<i>“I’ve made myself a nice little cunt boy,”</i> she says. <i>“People will still think you’re a guy. You and me though... we’ll know something different.”</i>");
					// C cup or above:
					else output("\n\nShe laughs finally, shaking her head at you fondly. <i>“You’ll want to look into moisturiser or something, pet. You’re a bit of a mess at the moment.”</i>");
				}
				// Andro/Feminine
				else
				{
					// B cup or below:
					if(pc.biggestTitSize() <= 2) output("\n\n<i>“I’ve made myself a nice, flat chested little slut,”</i> she breathes. She gently grazes your chest with her claws. <i>“You should change that. Grow out some nice big tits so your mistress has something to squeeze when you walk by.”</i>");
					// C cup or above:
					else output("\n\n<i>“That was just one small last step really, wasn’t it?”</i> she breathes, sinking a hand into one of your [pc.breasts]. <i>“You’ve been a girl in all but one place for some time now.”</i>");
				}
				output("\n\nShe shifts in closer, her navy nipples pressing into you, her scent heavy in your nose, as well as a faint trace of greasy honey.");
				output("\n\n<i>“Now then, pet,”</i> she says. <i>“Let me walk you through your new self.”</i> She spoons into you, clasping your body into hers as her hand slides up your thigh, touching – you twitch – a new, wet opening below where your [pc.cock " + cockIndex + "] once was");
				if(pc.balls > 0) output(" - not to mention a curious lack of [pc.balls]..");
				output(". Sera traces its lips and pushes her thumb gently into its top fold. You squirm as she touches a nub of flesh which has only just stopped throbbing. <i>“That,”</i> she whispers, her cerulean lips next to your ear. <i>“Is what you once were. Even cuter and more sensitive than it was, and now it won’t make any nasty messes when I’m making you squeal.”</i> You are very aware of her cock, which she has wedged between your butt cheeks, methodically hot-dogging herself, rubbing herself to a fresh erection with your soft flesh as her fingers move inwards. You tense up when she touches an obstruction – delicately pressing her nails against a thin membrane.");
				
				//Cock removed, vagina added, auto- lost hymen and gaping
				pc.removeCocks();
				pc.balls = 0;
				pc.createVagina();
				pc.vaginas[0].clits = 1;
				pc.clitLength = biggestLength * 0.25;
				if(pc.clitLength < 0.75) pc.clitLength = 0.75;
				
				output("\n\n<i>“And that is your precious maidenhead,”</i> the succubus murmurs. <i>“You’ve got to be careful with that, blushing virgin of mine. It’d be awful if some wicked someone took advantage of you before your wedding night.”</i> She giggles lowly as she fingers your tight slit. Warmth blooms in your groin, but there’s nothing there to engorge - you just feel warmer, wetter and more unfurled the more her fingers move. The sensations she is pressing on you are difficult to properly take in, it’s all so new... experimentally you shift into her hand by rotating your hips, your breath catching in your throat as it makes Sera’s fingers slide over your tender pink.");
				output("\n\n<i>“Goddamn,”</i> she husks ferally. She’s shifting you, forcing you to kneel and bend, pressing your [pc.butt] out to present your new sex to her. Her huge erection slides down your [pc.anus]. You’re either still too spaced out to stop her or you don’t want her to stop; some heady combination of the two. <i>“You know how cute you sound now? I’m gonna make you sing a symphony for me.”</i> Her thick bulb presses against your moist new entrance. It feels ridiculously, ludicrously big. There’s simply no way... Sera pushes in gently but determinedly and you tense up, your breath again catching in your throat as her beading head spreads your lips wide. She stops for a moment, recedes slightly, then extends herself again. Something gives in your pussy, a dull sliver of pain. <i>“Been so long since I did that,”</i> sighs the succubus with deep satisfaction. You grit your teeth as she continues to gently dip in and out of you. She stretches you wider, and wider, and it feels like she must be tearing you apart - then with a wet sound her huge head fully enters you. You pant hard, your eyes crossing slightly as a comforting hand squeezes your [pc.butt].");
				
				pc.cuntChange(0, chars["SERA"].cockVolume(0));
				
				output("\n\n<i>“That wasn’t so bad, was it pet?”</i> she says, leaning back to admire her thick cock embedded in your rear. <i>“It gets better now. A lot better. Your mistress promises.”</i> You groan as she takes you by the [pc.hips] and begins to thrust in deeper.");
				output("\n\nShe fucks you gently but purposefully, nudging herself further in with each slow push, forcing you to get used to her girth and length. It never stops feeling impossibly big, but at some unclear point the intense sensation crosses over from pain to pleasure. Your pussy seems to quiver around her, gladly lubricating her hot bulging head as she spreads your tunnel with it from one end to the other. You try to make as little noise as possible because you quickly discover making the smallest squeak results in Sera incrementally picking up the pace, pumping her hips with greater force, finding your limit and using every inch. It vaguely occurs that she can’t get anywhere near her whole cock into you; she is at best penetrating you with only half of it. The thought of what it might be like to have a big enough pussy to take her whole mingles with the sensation of her hands slides up your flank to fondle your [pc.nipples] and you wail, your new physiology suddenly clenching up in a series of ecstatic contractions around her. It’s so much better than taking it in the ass; some deeper biological need being met.");
				output("\n\n<i>“That’s it you tight little cocksleeve, sing for me,”</i> groans Sera, clutching your [pc.chest] as she pounds into your flexing pussy hard. You feel utterly tenderised, only able to lie there with your [pc.butt] in the air as she finally tenses deep inside you and pumps you full of thick warmth. Hazily you wonder how she can possibly cum as hard as this when she covered your front in her seed only fifteen minutes ago; hard on the heels of that thought is that you are blissfully, filthily glad that she can.");
				output("\n\nFinally, with a deeply satisfied sigh, she is spent. You moan long and low as she withdraws. Her cock head makes a “pop” noise as it goes, and you feel a long, slimy stream of hot demon jizz ooze out of your disgracefully treated new sex.");
				output("\n\n<i>“There we go, pet,”</i> she whispers, pressing you between her pliant breasts. <i>“Broken in and gaped. Now no one will look at you and think you’re anything other than what you are – an obedient slut who belongs to someone with a big, thick cock.”</i> She licks behind your ear, tasting your sweat. <i>“Best to leave dicks to those who know how to use them, hmm?”</i>");
				
				pc.vaginas[0].hymen = false;
				pc.vaginas[0].minLooseness = 5;
				pc.vaginas[0].loosenessRaw = 5;
				pc.vaginas[0].wetnessRaw = 3;
				
				output("\n\nAfter you’ve rested a while longer you");
				if(pc.hasStatusEffect("Temporary Nudity Cheat") || !pc.isNude()) output(" shakily re-dress and");
				output(" head back out to the shop, the fact of what your mistress has done to you throbbing tenderly");
				if(pc.genitalLocation() <= 2 && pc.hasLegs()) output(" between your [pc.legOrLegs]. You can actually walk a little easier now. There is that");
				else if(pc.genitalLocation() <= 2 ) output(" between your [pc.thighs]");
				else output(" in your new genital");
				output(".");
				
				processTime(20 + rand(11));
				flags["SERA_CREATE_VAG"] = 1;
			}
			flags["FUCKED SERA"] = 1;
			IncrementFlag("SERA_INCH_STEALING_SEX");
			seraInchGain(biggestLength);
			sera.orgasm();
			pc.orgasm();
		}
	}
	if(pc.hasStatusEffect("Sera's TailCock Cooldown")) pc.setStatusMinutes("Sera's TailCock Cooldown", ((6 + rand(7)) * 60));
	else pc.createStatusEffect("Sera's TailCock Cooldown", 0, 0, 0, 0, true, "", "", false, ((6 + rand(7)) * 60));
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Inch Stealing Ain’t Easy
public function seraInchStealingAintEasy(intro:Boolean = false):void
{
	clearOutput();
	showSera();
	
	if(intro && pc.WQ() >= 50)
	{
		output("She looks pretty peeved... Are you sure you want to approach your mistress?");
		
		clearMenu();
		addButton(0, "Yes", seraInchStealingAintEasy);
		addButton(1, "No", seraInchStealing, "back away");
		return;
	}
	
	//By Shax
	//Repeatable one-off scene for players who have had inches stolen by Sera
	//Basic scene requires ~5in stolen or vagina created by Sera, whichever. Also the threesome //with the snowy googirl, so’s you already definitely definitely definitely know the tailcock.
	//Cooldown of a day before it can randomly appear again.
	author("Shax");
	
	var seraLength:Number = seraInchGain();
	var faceOrgasm:Boolean = false;
	
	output("You quickly ");
	if(pc.isGoo()) output("ooze");
	else if(pc.isNaga()) output("slither");
	else if(pc.isCentaur()) output("trot");
	else if(pc.isDrider()) output("scuttle");
	else if(pc.isTaur() || !pc.hasFeet()) output("pad");
	else output("step");
	output(" over to her. You assume the default pose, on bended knee");
	if(!pc.hasKnees()) output(", or what passes for it");
	output(", adding, <i>“Mistress?”</i>");
	
	output("\n\nYou notice through her grimace that her tail is not waving about as energetically as it usually does during one of her rages, and in fact is nowhere to be seen.");
	output("\n\n<i>“Look what you did, sissy,”</i> she says simply, turning about. Before your eyes is one of the most tangled knots you’ve ever seen, let alone on something living. Her tail is a total mess. <i>“Your extra inches let this happen. It wasn’t even that serious an argument and now I can’t get this shit undone without a mirror and some real fucking irritation. Seeing as this is the result of you being such an oversized slut, this is your problem to fix now.”</i> She pulls a chair over to lean on.");
	if(!pc.isNude()) output(" <i>“Strip down for this, I may like it like that later.”</i> You comply without complaint.");
	
	output("\n\nWith the speed born of a mistress’ command, you reach up and begin to examine the knotted tail. Ultimately it can easily be traced back to the spade of her tail. It’s easy for her spade to slip through a crevice, as you know so well, but its fat, blunt reverse side makes it reluctant to go the other way. You decide that the best way to get it back through this is to get it hard, as the spade eventually diminishes with the tailcock at full erectness. You take the spade in one hand, and begin stroking it lovingly with the other. Your mistress winces at the contact at first, but recovers. She doesn’t question your actions, probably having suspected the same thing. It’s a brief affair. The spade grows engorged under your ministrations. Then, it starts to split along a seam, which you focus your attentions on lovingly. Next thing you know, a respectable tailcock is throbbing gently in your hands and the spade has indeed become thinner for it.");
	
	output("\n\nYou can’t seem to help yourself. You give the head of her tailcock a dainty lick before pulling it on its way through the morass of coiled tail. Your first unraveling loop completed, you give it another little lick, causing Sera to breathe a little harder and tense up against the chair. You repeat the action several times. Inspect, lick, pull, lick. As a result, your progress toward finishing the knot and finishing your Mistress seem about on par. The heady aroma of cock starts to mingle with fresh juice from your Mistress’ pussy a foot or so away. Between them and the staccato blowjob you’re delivering, you’re starting to get turned on yourself.");
	
	output("\n\nThis next bit is tricky. The tail somehow wound itself through a gap in an already existing knot, and then back through a different loop in the same knot, all of which were pulled tight by its subsequent antics. You’re amazed it managed to avoid cutting off its own circulation, or at least enough so to avoid putting itself in dire straits. There’s no way the spade would have made it back through this. You take a moment to slobber over the base of your mistress’ tailcock to lube its eventual passage, causing Sera to suck in air sharply. With one hand you pull the knot open as much as possible, with the other you start to pull her tailcock through the loop. It’s a tight fit, and you have to be gentle. A bit of wiggling back and forth and suddenly the tail pops through! You know you just have to do it again immediately, so you keep at it, ignoring your usual celebration. Sera’s breathing is ragged by the time you manage to squeeze her tailcock through the second loop. With that out of the way a");
	if(seraLength >= 5) output(" significant");
	else if(seraLength >= 10) output(" small");
	else if(seraLength >= 20) output(" meager");
	output(" portion of the knot falls free.");
	
	output("\n\nBefore you can even take a moment to celebrate, her tailcock finds its way to your [pc.lips] with unerring accuracy. At its insistent push you submissively open your mouth to it, which provokes a sigh of pleasure from your mistress. The tailcock quickly finds its rhythm as it fucks your face");
	if(pc.lipRating() >= 4) output(" and slurps noisily through the pillowy seal of of your [pc.lips]");
	output(". You figure there’s nothing to be done about your predicament right now but soldier on.");
	
	output("\n\nUntangling a knot of this magnitude is difficult and delicate work, the sort that can really hurt your fingers if the material is rough. Untangling a knot that is both writhing and fucking your face is a different matter altogether. Every time you think you have the knot figured out, it’ll collapse in a way which shows you’re wrong, or your mistress will just barely tickle your gag reflex. Ultimately you resort to the tried and true method, running your fingers along the end of it until you spot where it emerges from the knot. Slowly and steadily you thread her tail through it, which doesn’t diminish her thrusting in any way.");
	
	output("\n\nFinally you get down to the wire, and as you go to tug the cock through it won’t budge - because Sera is determined to fuck your face. You lean forward, pressing your [pc.lips] against the knot and taking several inches of tailcock down your throat in the process. Naturally, getting suddenly deepthroated would make anyone gasp, and you’re getting rather antsy yourself. As you finally extricate the tailcock from your face and through the loop, it, and with it your mistress, starts cumming. Great gouts of alabaster rain down on your face and [pc.chest]. Looking back over her shoulder, Sera smirks down at your impromptu bukkake with a glow of satisfaction as her primary naughty bits release all over the seat.");
	output("\n\n<i>“A certain slut’s going to have to clean that up later,”</i> she muses.");
	
	output("\n\nAs you sit there, stunned, the cum-leaking cock finds its way back into your maw and resumes fucking you ruthlessly as though nothing had happened. Obviously you’re not getting a reprieve until the job is done. The new cycle involves working through the knot as Sera’s tailcock spends as little time outside your mouth as is remotely possible.");
	
	//This section for 20+ inches. 
	if(seraLength >= 20)
	{
		output("\n\nYou’ve got a long way to go and a powerful fire in your loins. In hopes of achieving some sort of satisfaction out of this, you redouble your pace as much as you’re able. It wouldn’t do to cause your mistress any discomfort for several good reasons.");
		output("\n\nFortunately, that massive tangle you undid seems to have been the worst of it. The rhythm of getting facefucked and pulling out tangled loops settles in easily. At some point your Mistress cums again, coating you in a second layer of alabaster goo.");
	}
	//This section for 10+ inches. The sequel 2: son of electric boogaloo.
	if(seraLength >= 10)
	{
		output("\n\nBy now the knot is significantly diminished, but it’s still quite a lot of work. Diligence in the face of your mounting lust is the order of the day.");
		if(pc.canTitFuck()) output(" Sera’s tail takes to draping between your [pc.chest] getting a pseudo-titfuck out of it as she fucks your mouth. Which just makes your job harder still.");
		output(" You start getting distracted by the cock in your mouth, sometimes pausing to fellate it properly with eyes closed in bliss. Then you remember that that is getting you nowhere, and get yourself back to the task at hand.");
		output("\n\nYour mistress grunts suddenly, and starts spraying cum all over you again as you unthread another tricky loop.");
		if(seraLength >= 20) output(" You’re so drenched in her jizz by this point that you’re more of a spermy ghost than a [pc.race].");
		output(" Her chair, apparently waterproof, is currently serving as a cumbowl rather than a seat.");
	}
	// End inch variants
	
	output("\n\nThankfully, the end of your task is finally in sight. It’s the sort of knot you might expect from a cord in your pocket now rather than willful malevolence. Completing it at this stage is ultimately trivial next to what you’ve unraveled, and you set to the ending with gusto, all but fighting down your mistress’ tailcock to speed the process along. Finally, it all comes down to a simple, stupid pretzel loop. After everything else, getting her tailcock through that is trivial...");
	
	output("\n\nSera, it seems, can feel that the job is done. She crows in delight as she buries her tailcock once more in your face, now with all the fine control having her tailcock unbound allows her to bring to bear. She quickly brings herself to another panting orgasm, this time with her cock buried halfway into your mouth so you have to taste every drop of jizz as it squirts out of her.");
	
	//Orgasm scene only for PCs who either a) have some sort of oral fixation mechanic or b) have //been through the face-riding training scene with Sera 3+ times.
	// Orally Fixated:
	if(pc.isBimbo() || pc.isTreated() || pc.isDependant(Creature.DEPENDANT_CUM))
	{
		output("\n\nSucking her cock for so long with nothing else has already engorged your lips and livened your mouth. Feeling the pulsing beat of her cock wrapped in your [pc.lips] with such a huge load spilling into your mouth is enough to finally send you over the edge with warmth radiating out from cock and lips and jizz and tongue");
		// also done face-riding
		if(flags["SERA_FACE_RIDE_TRAINING"] >= 3) output(", as if your mistress’ training wasn’t enough to make the familiarity of her pleasure your pleasure");
		output(". You start to spasm throughout your body");
		if(pc.hasKnees())output(" and your [pc.knees] go weak");
		output(".");
		faceOrgasm = true;
	}
	// Only sera face-riding
	else if(flags["SERA_FACE_RIDE_TRAINING"] >= 3)
	{
		output("\n\nThey say that the mind is the largest erogenous zone, and between your mistress training you and the aphrodisiacs thrown about to do it, you suddenly learn all over again just how true that is. As her cock spurts out its pleasure onto your tongue, with all that build behind it, you feel something inside you turn over. And then it’s like there’s a live conduit between your mouth and your loins. You cum, and cum <i>hard</i>.");
		faceOrgasm = true;
	}
	// Orgasms
	if(faceOrgasm)
	{
		if(pc.isHerm())
		{
			output("With the symphony of [pc.cum] and [pc.girlCum] playing in your loins, a passing observer would assume some sort of toy or torment has been applied, but ultimately the complete lack thereof is what allowed you to be set off like this.");
		}
		else if(pc.hasCock())
		{
			output("\n\n[pc.OneCock] begins to spurt, completely unaided by you or your demonic mistress, ");
			if(pc.cumQ() < 50) output("droplets");
			else if(pc.cumQ() < 200) output("streamers");
			else output("blasts");
			output(" of [pc.cum] going splattering all over the floor in the general direction of your mistress’ feet.");
		}
		else if(pc.hasVagina())
		{
			output("has vagina: [pc.OneVagina] clenches in sympathy with the wondrous flood your mouth is experiencing, despite the complete lack of play your neglected ");
			if(pc.vaginaTotal() == 1) output("pussy has");
			else output("pussies have");
			output(" seen. Your [pc.girlCum] ");
			if(pc.girlCumQ() < 50) output("beads up");
			else if(pc.girlCumQ() < 200) output("streams down your [pc.leg]");
			else output("liberally coats the deck beneath you");
			output(".");
		}
		else
		{
			output("Has none of the above: Your asshole twitches, nerves lighting up like a christmas tree in orgasm, as satiating as your genitals might once have delivered.");
			if(pc.ass.wetness() >= 2) output(" In response to this turn of events your asshole’s lube kicks into overdrive, leaving you feeling slick and sensual in the only unfilled fuckhole.");
		}
		if(pc.canOviposit())
		{
			output(" Your ovipositor even seems to come alive with the electric sensation of your orally-motivated orgasm. Eggs and fluids churn with pregnant poise, bringing with it that breed-hungry sensation they always provoke before calming back into the afterglow of your orgasm.");
		}
		output("\n\nYour mistress catches sight of your orgasm as you swallow down every drop like a proper cumslut, and seems positively giddy at the sight. <i>“Oh. My. God. You actually,”</i> and here she stops and trips over her thoughts. <i>“You actually came from that.");
		if(flags["SERA_INCH_STEALING_HELP"] == undefined) output(" I was just going to fucking leave you to stew on it, ‘cause it’s your fucking fault this happened. Fuck that though, this is amazing, the best damn thing I’ve seen all day.");
		else output(" Clearly I just can’t punish you with blowjobs anymore, oh woe, my lust for the perfect cumslut has gone horribly right,”</i> she adds sarcastically.");
		output(" You are one well-tuned fuckslut,");
		if(flags["SERA_FACE_RIDE_TRAINING"] >= 3) output(" and I’m fucking proud of your progress under my tutelage.");
		else output(" and I’m... happy to have a pet this well trained.");
		output("”</i> Her gleeful moment passes, back in command of herself.");
		
		pc.orgasm();
	}
	//In case you’re a sucker who didn’t get one of those things under your belt.
	else output("\n\nYou slowly and methodically take every last drop of jizz down your throat, slurping up the ripe and fresh cum like a true cumslut, need burning in your loins and driving you to further and further heights of lust and degradation. Finally, your mistress simply says,");
	
	output(" <i>“Alright slut, you know what you need to do.”</i>");
	
	output("\n\nDutifully, you comply.");
	// PC came with jizz or femjizz:
	if(faceOrgasm && pc.hasGenitals()) output(" You start by bending over and cleaning up what has escaped the notice of gravity and the Chrysalis’ floor drains with your [pc.tongue].");
	output(" Your own visage is a hopeless case, and no doubt the last thing she would want you to clean, so you turn your attention to the chair, which she steps aside from.");
	output("\n\nThe chair is a lake of mixed semen and femcum, cooling down. You can scarcely believe you’re going to lick up every drop, but you know that is exactly what you are going to do. <i>“Lap it up like");
	if(pc.isNaga() || pc.isTaur() || pc.isDrider() || pc.hasFaceFlag(GLOBAL.FLAG_MUZZLED) || !InCollection(pc.skinType, [GLOBAL.SKIN_TYPE_SKIN, GLOBAL.SKIN_TYPE_GOO])) output(" the animal you are");
	else output(" an animal");
	output(",”</i> is Sera’s only instruction.");
	// pc has special tongue:
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG) || pc.hasTongueFlag(GLOBAL.FLAG_PREHENSILE) || pc.hasTongueFlag(GLOBAL.FLAG_HOLLOW)) output(" After a moment she adds, <i>“and no cheating with that special tongue of yours. Lick it up </i>right<i>.”</i>");
	output("\n\nYou set to your task. Tentatively your tongue reaches out, scooping up some of the mixture and bringing it into your mouth. It’s thick, musky, and hard to deal with. It fights being swallowed, like sticky gelatin. Neverthless, it begins sliding down your throat slowly. You don’t waste any time scooping up a second mouthful and repeating the process, it can only get more difficult to deal with.");
	output("\n\nTime passes and it feels like your only pleasure is the approving gaze of your mistress roving over your cum-plastered form. Progress is made. At one point, you actually scrape the bottom of the seat, noticing a peculiar tang. It only takes a moment to analyze the flavor and realize it tastes like Sera’s distilled ball-musk and femcum. You return to your task with a slight grin.");
	output("\n\nFinally, after ages and continually worse conditions amongst the bodily fluids, you’ve cleaned your mistress’ chair. Unceremoniously, she steps over you and takes a seat on it, proud cock hanging by the side of her leg. She is supremely satisfied, a thought which gives you a bit of a warm glow in the pit of your stomach. You lurch a moment thinking about your stomach, overfull of cum and femcum, roiling in a mixture, but you recover without anything more serious.");
	output("\n\nYou ultimately just bow your head. Sera says <i>“Alright, you’ve done your job, and a damn fine one at that. Time for you to get out of here, go find someplace to clean yourself up, because my shower is </i>not<i> dealing with that.”</i>");
	output("\n\nYou stagger to your feet and get out of the Chrysalis, far too drained and submissive at the moment to even think of protesting.");
	
	processTime(60 + rand(31));
	//Would be amusing if it disabled Sera sex for an hour or two.
	pc.createStatusEffect("Sera No Sex Cooldown", 0, 0, 0, 0, true, "", "", false, ((1 + rand(2)) * 60));
	pc.createStatusEffect("Sera's TailCock Cooldown", 0, 0, 0, 0, true, "", "", false, (24 * 60));
	if(faceOrgasm)
	{
		if(pc.hasCock()) pc.loadInMouth(chars["PC"]);
		if(pc.hasVagina()) pc.girlCumInMouth(chars["PC"]);
	}
	if(seraLength >= 20) pc.loadInMouth(chars["SERA"]);
	if(seraLength >= 10) pc.loadInMouth(chars["SERA"]);
	pc.loadInMouth(chars["SERA"]);
	pc.girlCumInMouth(chars["SERA"]);
	flags["FUCKED SERA"] = 1;
	IncrementFlag("SERA_INCH_STEALING_HELP");
	seraInchGain(0, true);
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Sex
public function fuckedSeraAsMistress():Boolean
{
	var totalSex:Number = 0;
	
	if(flags["SERA_INCH_STEALING_SEX"] != undefined) totalSex += flags["SERA_INCH_STEALING_SEX"];
	if(flags["SERA_INCH_STEALING_HELP"] != undefined) totalSex += flags["SERA_INCH_STEALING_HELP"];
	if(flags["SERA_EXHIBITION_BLOWJOB"] != undefined) totalSex += flags["SERA_EXHIBITION_BLOWJOB"];
	if(flags["SERA_IN_JARDI_THREESOME"] != undefined) totalSex += flags["SERA_IN_JARDI_THREESOME"];
	if(flags["SERA_FACE_RIDE_TRAINING"] != undefined) totalSex += flags["SERA_FACE_RIDE_TRAINING"];
	if(flags["SERA_TIT_FUCK_LUCKY_DIP"] != undefined) totalSex += flags["SERA_TIT_FUCK_LUCKY_DIP"];
	if(flags["SERA_PARTY_FUCKED"] != undefined) totalSex += flags["SERA_PARTY_FUCKED"];
	
	if(totalSex > 0) return true;
	
	return false;
}

//randomly generated. Possibly play in order before returning to first, so PCs can always get at the mod scene?
public function seraSexXXXRouter():void
{
	flags["FUCKED SERA"] = 1;
	
	var choices:Array = new Array();
	var newScenes:Array = new Array();
	var chance:int = 1;
	
	// Exhibition blowjob
	if(flags["SERA_EXHIBITION_BLOWJOB"] == undefined) newScenes.push(seraSexXXXhibitionBlowjobStart);
	choices.push(seraSexXXXhibitionBlowjobStart);
	// No. 3 in a Threesome
	if(flags["SERA_IN_JARDI_THREESOME"] == undefined) newScenes.push(seraSexXXXJardiThreesome);
	choices.push(seraSexXXXJardiThreesome);
	// Get Ridden
	if(flags["SERA_FACE_RIDE_TRAINING"] == undefined) newScenes.push(seraSexXXXGetRiddenStart);
	choices.push(seraSexXXXGetRiddenStart);
	// Titfuck/Vaginal or Anal + Lucky Dip
	if(flags["SERA_TIT_FUCK_LUCKY_DIP"] == undefined) newScenes.push(seraSexXXXTitfuckLuckyDipStart);
	if(flags["SERA_UNLOCK_CLIPPEX"] != undefined) chance += 2;
	if(flags["SERA_UNLOCK_SEMENS"] != undefined) chance += 2;
	if(flags["SERA_UNLOCK_LUCIFIER"] != undefined) chance += 2;
	if(rand(chance) == 0) choices.push(seraSexXXXTitfuckLuckyDipStart);
	
	// Go go sexytimes
	if(newScenes.length > 0) newScenes[rand(newScenes.length)]();
	else choices[rand(choices.length)]();
}

// Exhibition blowjob
public function seraSexXXXhibitionBlowjobStart():void
{
	var vagIndex:int = -1;
	
	if(pc.hasVagina() && rand(2) == 0) vagIndex = rand(pc.totalVaginas());
	
	seraSexXXXhibitionBlowjob([1, vagIndex]);
}
public function seraSexXXXhibitionBlowjob(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var dildoSize:Number = 300;
	var pageNum:int = arg[0];
	var vagIndex:int = arg[1];
	
	// First
	if(flags["SERA_EXHIBITION_BLOWJOB"] == undefined)
	{
		if(pageNum == 1)
		{
			output("You kneel in front of her, gazing up at her fantastically perverse augmented body.");
			output("\n\n<i>“Mistress.”</i>");
			output("\n\n");
			if(!pc.isNude()) output("<i>“Take your clothes off.”</i> She taps a heel as you do so. ");
			output("<i>“Come here.”</i> She slides her hand down to the scruff of your neck and then, with a few directed pokes and pulls, gets you to crawl around to her side of the counter. There’s a square recess here for her chair; something glittering on the underside of the table catches your eye, but your attention is drawn back to Sera when she grunts. She’s reaching around her ass and drawing something out of her gleaming pussy; she withdraws it with a wet sound and a sigh of deep satisfaction.");
			output("\n\n<i>“Sitting around here can be so boring,”</i> she says, tapping the soaked pink dildo against her naked thigh as she gazes down at you. The long, slim tool is vibrating gently. <i>“Least with this thing I can take the frustration off a bit. That’s the theory, anyway...”</i> as she speaks she’s kneeling down, presenting the dildo to you. She doesn’t continue until you open your mouth and lick the gently humming device, tasting her vaguely spicy musk; once you have she bends forward, pressing her breasts into your [pc.chest] as she reaches around your [pc.butt] and pushes it against the entrance of your");
			if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
			else output(" [pc.asshole]");
			output(". She rotates it gently, teasing you with it, before using a single, wicked thrust to sheathe it fully in your");
			if(vagIndex >= 0) output(" pussy");
			else output(" ass");
			output(".");
			if(vagIndex >= 0) pc.cuntChange(vagIndex, dildoSize);
			else pc.buttChange(dildoSize);
			output(" Your gasp turns into a cry of shock as, with a click, she turns the vibrations way up. She slaps you harshly across the face.");
			output("\n\n<i>“Instead of thanking me for doing you the privilege of lubing your fuck stick up, you whine about it?”</i> she snarls. <i>“Thank me! Now!”</i>");
			output("\n\n<i>“Th-thank you mistress,”</i> you manage, trying to keep your voice level despite the quakes now shaking irresistibly through your core.");
			output("\n\n<i>“As I was saying before I got rudely interrupted...”</i> She pushes you back into the recess. With a brilliant shudder, you discern what caught your eye under here. Steel handcuffs dangle from the underside of the counter, level and set about three feet away from each other. Your breathing comes heavier as purple claws firmly grab your wrists and snap you into place. <i>“In theory it takes the edge off, but really all it does is make my cock all het up and prickly. Even if I fuck myself off with it, I get blue balls. After-effect of some of the mods I’ve used. You use your pussy and it makes you want to use your cock, you use your cock and it makes you want to use your pussy... on and on it goes.”</i>");
			output("\n\nShe gazes down at you, her pretty, evil face split by a huge grin up above her pert rack and huge, thick rod. You dangle helplessly underneath the counter, trying hard not to think about the dildo shuddering insistently into");
			if(vagIndex >= 0) output(" your wet, sensitive walls");
			else if(pc.hasCock()) output(" the needy, buried ball of your prostate");
			else output(" your sensitive walls");
			output(". It’s getting harder to do as she lightly brushes her prick against your [pc.lips], filling your nose with its scent – similar but denser, wilder than her pussy. Your breath continues even heavier. <i>“Since I’ve got you though, I haven’t even been trying to get off. Just teasing myself, keeping that frustration simmering away, for hours. Know how hard it is to serve a customer like that?”</i> she growls suddenly, pushing her beading end into your mouth. <i>“Fucking hard. But now I’ve got you, oh yes, all to myself. My personal little gloryhole. I’m going to use you for hours, you ass-kissing, cock-sucking whore. It’s going to be awesome.”</i> She drives her hot shaft in deeper as she says these last words, stretching your maw; you brace yourself for what is likely to be one hell of a throat-fucking.");
			output("\n\nHowever, after about a minute of fretful, muffled, shallow thrusting into your maw, Sera momentarily relents.");
			output("\n\n<i>“No,”</i> she groans harshly. <i>“Gonna hold back. Gonna savor this.”</i> You pant, unable to respond, clutching the air with your chained hands. When she’s using your mouth, it’s difficult to focus on anything else but the sensation of being ruthlessly penetrated from above and below, the shuddering dildo stuffed into you making");
			if(pc.hasCock()) output(" [pc.eachCock] thrum and flex irresistibly as");
			if(vagIndex >= 0) output(" you seep juices");
			else output(" you tense");
			output(" eagerly around it; but what is dimly picking at the edges of your deep, submissive intoxication at all this is what happens if a customer comes in. You’ve got a bad");
			if(pc.exhibitionism() >= 33) output(" (or is it shamelessly arousing?)");
			output(" feeling Sera will present and humiliate you whilst you’re helpless. Your attention is drawn unavoidably back to your immediate situation as an urgently erect foot-long cock pokes at your mouth.");
			output("\n\n<i>“Focus, sweetheart,”</i> growls Sera. She smears beading pre-cum around your [pc.lips]. <i>“I’m not gonna waste this by blowing my load down your throat straight away, much as you’d like that. You’re gonna lick every inch, good and slow. Go on.”</i> You trail your tongue around her bulbous, bulging head, lap softly at her slit, almost not touching her at all. <i>“Oh god yes,”</i> she hisses in response. <i>“Now kiss it and draw it in. Yes! And let’s hear some nice, slutty moaning, huh? Anyone would think you weren’t enjoying worshipping your owner’s big, juicy prick.”</i>");
			output("\n\nYou open wide and slide your lips beyond her head, your tongue advancing surely down her underside; as you do you groan softly into her meat, letting the vibrations travel through her. Honestly, you don’t even do it on request; the throbbing in your own nether regions is growing, twining so closely to the pleasure of blowing your filthy-mouthed mistress you can’t separate the two.");
			output("\n\n<i>“That’s it, that’s it,”</i> husks Sera, clutching the desk and beginning to pump her thighs again. <i>“Keep doing it like th-”</i> The shop door jingles, and the two of you freeze.");
			output("\n\n");
			
			processTime(35);
			pc.lust(5);
			if(pc.exhibitionism() >= 33) pc.lust(5);
			if(pc.exhibitionism() >= 66) pc.lust(5);
			clearMenu();
			addButton(0, "Next", seraSexXXXhibitionBlowjob, [2, vagIndex]);
			return;
		}
		else if(pageNum == 2)
		{
			output("Your eyes open wide – and you orgasm. Maybe it’s the sudden tension in your muscles which does it. You rock against the dick in your mouth, letting the dildo fuck you deliriously,");
			if(pc.hasCock()) output(" [pc.eachCock] spurting rope after rope of cum against your stomach and [pc.chest]");
			else if(vagIndex >= 0) output(" your [pc.vagina " + vagIndex + "] clenching up around it again and again, spurting fluid onto the floor");
			else output(" your butt clenching up around it again and again");
			output(", trying so hard to stay quiet beads of sweat stand out on your forehead.");
			output("\n\n<i>“Hi,”</i> says a deep voice hesitantly, somewhere far away. <i>“This place open?”</i>");
			output("\n\n<i>“Yes! Yes, of course it is,”</i> says Sera. She withdraws from your mouth with a “schlorp” sound. To your ears, it sounds as loud as an alarm going off. She sways away from behind the counter, her dick still fiercely erect. Whoever that is must see how wet her cock is, surely...");
			output("\n\n<i>“My word,”</i> says the customer, sounding awed.");
			output("\n\n<i>“Eyes up here,”</i> Sera replies sharply. <i>“What are you looking for?”</i>");
			output("\n\n<i>“I, er...”</i> there’s some ponderous shifting around. Whoever he is, he sounds big. Whoever he is, you badly want him to fuck off. You wait, dangling by your arms");
			if((pc.hasCock() && pc.cumQ() >= 50) || (pc.hasVagina() && pc.girlCumQ() >= 50)) output(" in a sticky pool of your own juices");
			output(", barely daring to breathe. <i>“I’m looking for a... gift. For my nephew. He’s interested in these, human arcane type things. If you had some which aren’t particularly dangerous or, um... obscene...”</i>");
			output("\n\n<i>“Right this way,”</i> Sera says briskly. More shuffling around. <i>“This collection has all toys, reasonably priced. Give me a shout if you need a hand.”</i>");
			output("\n\n<i>“Yes, thanks...”</i> The sharp clop of six inch stilettos comes towards you. Before you can prepare yourself, Sera is on you. Without ceremony, she shoves her dick straight into your mouth, driving into your throat. You gag, choke slightly but she doesn’t care. She grips the counter, arches her back and thrusts her thick, purple thighs downwards, her breasts bouncing, practically lifting her feet off the ground to fuck your mouth as hard as she can. You desperately try and go soft, quell your gag reflex, make as little noise as you can – but your ears are full of the strenuous wet sounds of the furious oral and the light batting noise the succubus’s balls make when they beat into your chin. Your own heat is building again, the dildo mercilessly beating");
			if(vagIndex >= 0)
			{
				output(" the wettened walls of your [pc.vaginaNoun " + vagIndex + "]");
				if(pc.hasCock()) output(", stiffening your aching [pc.cockNoun]");
			}
			else if(pc.hasCock()) output(" at your sensitive prostate, stiffening your aching [pc.cockNoun]");
			else output(" the walls of your [pc.anus]");
			output("...");
			output("\n\n<i>“Excuse me?”</i> It’s coming from almost directly above you. You stifle a whimper only with difficulty.");
			output("\n\n<i>“Uh?”</i> says Sera. The thrusting stops, but she keeps her girthy meat wedged deep in your throat.");
			output("\n\n<i>“I’m, I’m sorry, I haven’t been quite forthright with you,”</i> the deep voice says. He sounds ashamed. <i>“I’m not really looking for a child’s gift. I was wondering, I came in here, that is to say...”</i>");
			output("\n\n<i>“Spit it out!”</i> As she snaps this she withdraws her bell end from your throat and into your mouth, allowing you to take as large a breath as you can while remaining silent. Dimly but urgently you consider ways to stop her using your throat again. Maybe make it feel so good in your mouth she doesn’t want to? You begin to lick and hollow your cheeks around her bulging, musky cock frenetically, using it as a gag to stop a moan surfacing as pleasure trembles up your spine.");
			output("\n\n<i>“What- what do you have in the way of testicular mods?”</i> the customer finally says. <i>“I was born with the unfortunate condition of having only two... of those, and I - the thing is, I don’t know if it’s worth asking you or going across the way to the other place, I know that some animals – ”</i>");
			output("\n\n<i>“Don’t you dare go to that place!”</i> she snarls. You try to remain absolutely silent as she begins to pump into you hard again. <i>“That bitch won’t give you what you need – what all bitches NEED – I mean, she will give you some crap that MIGHT give you a quad, but will also give you a disgusting snout, two rhino feet and who the fuck knows what else?”</i> She angrily penetrates you right to the quick, making stars dance in front of your eyes.");
			output("\n\n<i>“Is everything alright?”</i> the deep voice rumbles. <i>I should count myself lucky that this guy is the most oblivious sentient in the galaxy</i> you think, and now have to stifle the hysterical urge to laugh.");
			output("\n\n<i>“Never mind. Look, take this.”</i> Something is slapped onto the surface above you, making you flinch. <i>“Absolutely guaranteed to give you extra balls. 4000 credits. Don’t take too much or you’ll end up with about eight.”</i>");
			output("\n\n<i>“Eight, you say? Wow!”</i> The transaction takes place in a flurry of muffled clicks. As Sera carries it out she continues to slide her cock between your [pc.lips], but she’s calmed down a bit; your trick of bathing her sensitive end in attention seems to have worked, and she allows you to suck at it with steady rotations of her thighs. You slide your tongue along her straining flare gladly; you’re through the worst of it.");
			output("\n\n<i>“Thank you so much,”</i> says the customer effusively. <i>“Eight, I – this is more than I could have hoped for.”</i> His voice is becoming harder to discern as if he heads to the door.");
			output("\n\n<i>“My pleasure,”</i> trills Sera sarcastically. Your arch your neck as you feel another orgasm approaching.");
			output("\n\n<i>“And, er – you sure everything’s alright? There’s a heavy vibration of some sort coming from underneath your desk. Faulty heating?”</i>");
			output("\n\n<i>“Oh, that’s just my bitch,”</i> replies the demon casually, running her fingers through her hair. Your heart stops. <i>“[pc.He]’s under here, sucking me off.”</i> There’s a pause, and then the heavy sound of approaching footsteps. Sera steps back, pulling her cock away and gestures at you, cuffed to her counter, stuffed with a dildo and drool dripping down your chin, to an astonished-looking large, square reptile creature. The all-consuming humiliation should not in any way feel good. It may make your skin burn and your pulse beat like nothing else, but definitely not in that way, no, definitely not.");
			output("\n\n<i>“I, er, see.”</i> A thought slowly occurs to him. <i>“I don’t suppose I - ?”</i>");
			output("\n\n<i>“No,”</i> says Sera bluntly. <i>“Don’t let the door hit you on your way out.”</i>");
			output("\n\n<i>“Right. Well. Cheerio then...”</i> The door jingles. Sera looks down at you, hand on her hip, spit-polished dick pointing at you, a proud smirk on her face.");
			output("\n\n");
			
			processTime(15);
			pc.orgasm();
			pc.lust(15);
			if(pc.exhibitionism() >= 33) pc.lust(15);
			if(pc.exhibitionism() >= 66) pc.lust(15);
			clearMenu();
			addButton(0, "Next", seraSexXXXhibitionBlowjob, [3, vagIndex]);
			return;
		}
		else if(pageNum == 3)
		{
			output("You don’t know what to say or how you should feel, however she performs an executive decision by gripping the back of your head and penetrating your mouth-cunt again.");
			output("\n\nShe fucks you strenuously now, pummeling your throat with her bulging end. The force, taste, and how this sadistic hellion you have given yourself to has used and humiliated you, wrap around the buzzing warmth in your nether regions so that when she finally reaches it, gasping as she draws lines in the counter with her claws, thrusting thick cum straight into your stomach, you orgasm too, your muffled moans joining her gloating crows as your");
			if(vagIndex >= 0)
			{
				output(" cunt seizes up around the whirring dildo");
				if(pc.isSquirter(vagIndex)) output(", spurting juice everywhere");
				output(", clenching your body with ecstatic pulses");
				if(pc.hasCock()) output(" as [pc.eachCock] is forced to an almost dry, aching orgasm");
			}
			else
			{
				output(" [pc.anus] seizes up around the whirring dildo");
				if(pc.hasCock()) output(", forcing [pc.eachCock] to an almost dry, aching orgasm");
				if(pc.hasVagina() && pc.isSquirter()) output(" as your [pc.eachVagina] spurt juices everywhere");
			}
			output(". Once she’s warmed your stomach she pulls out step by step, surging her seed down your gullet, filling your mouth full of it before finally pulling out and splattering your face and [pc.hair] with the last few pulses. At last, she staggers back and collapses on her stool, semi-flaccid and oozing.");
			output("\n\n<i>“Whew!”</i> she sighs with deep satisfaction, gazing at you with heavy-lidded yellow eyes. <i>“You should feel grateful to that guy, you know. I planned to keep you under there for a lot longer.”</i> You swallow deeply. You suspect pleading with her to let you go and, in particular, remove the dildo still juddering away inside your sorely-abused tunnel would probably result in her leaving you where you are. You grope for something that might work.");
			output("\n\n<i>“Thank you for using me, mistress,”</i> you say eventually. <i>“May I have another?”</i>");
			output("\n\n<i>“You’re such a greedy slutbag!”</i> She tsks to herself as she frees your complaining wrists and blessedly withdraws the dildo. <i>“And after the mess you’ve created down here, too! Manners, bitch.”</i> She taps her thigh determinedly as she draws you, dripping, out of the alcove, reaching into a locker to throw a scented towel at you. <i>“We’re going to have work on them. Next time.”</i> You jerk as she slaps your [pc.butt] as way of farewell.");
			
			processTime(10);
			pc.exhibitionism(2);
		}
	}
	// Repeat
	else
	{
		if(pageNum == 1)
		{
			output("<i>“Mistress.”</i>");
			output("\n\nSera looks down at you, savoring the sight for a long moment before closing her inhuman eyes, reaching around her ass and withdrawing a long, pink something out of her pussy. She taps the soaked dildo against her naked thigh, watching and waiting with a small smirk on her face. You know what’s expected of you; after gathering yourself you slowly crawl around to her side of the counter and, heart thumping, shuffle backwards into the square recess. The steel handcuffs fixed to the underside brush against your shoulders.");
			output("\n\n<i>“You aren’t going to get away so easily this time,”</i> she husks, presenting the gently vibrating device to you. You lick it, tasting her vaguely spicy musk, knowing she won’t continue until you do. Her breasts press into your [pc.chest] as she reaches around your own [pc.butt] and pushes it against the entrance of your");
			if(vagIndex >= 0) output(" [pc.vagina]");
			else output(" [pc.asshole]");
			output(". She rotates it gently, teasing you with it, before using a single, wicked thrust to sheathe it fully in your");
			if(vagIndex >= 0) output(" pussy");
			else output(" ass");
			output(".");
			if(vagIndex >= 0) pc.cuntChange(vagIndex, dildoSize);
			else pc.buttChange(dildoSize);
			output("\n\nYou grit your teeth as, with a click, she turns the vibrations way up.");
			output("\n\n<i>“What do you say?”</i>");
			output("\n\n<i>“Th-thank you mistress,”</i> you manage, trying to keep your voice level despite the quakes now shaking irresistibly through your core.");
			output("\n\n<i>“Good slut.”</i> She pushes you back into the alcove, and your breathing comes heavier as purple claws firmly grab your wrists and snap them into the handcuffs. She gazes down at you when she’s done, her pretty, evil face split by a huge grin up above her pert boobs and thick rod. You dangle helplessly underneath the counter, trying hard not to think about the dildo shuddering insistently into");
			if(vagIndex >= 0) output(" your wet, sensitive walls");
			else if(pc.hasCock()) output(" the needy, buried ball of your prostate");
			else output(" your sensitive walls");
			output(". It’s getting harder to do as she lightly brushes her prick against your [pc.lips], filling your nose with its scent – similar but denser, wilder than her pussy. ");
			output("\n\n<i>“I’ve been keeping myself pent up for so long,”</i> she breathes. <i>“It builds up. All the little things, you know? The boredom, the annoying customers, the bookkeeping, the frustration.”</i> She pushes her beading end into your mouth. <i>“But now I’ve got you, my personal little gloryhole, to work it all off on. It’s going to take hours. It’s going to be awesome.”</i> She drives her hot shaft in deeper as she says these last words, stretching your maw wide open; she pummels the front of your throat with it, urgently jerking her thick thighs, quickly losing herself in the rhythm. As you attempt to soften your mouth and take this face fucking as best you can, it vaguely occurs to you that if she keeps this pace up, she will be using you for seconds, not hours.");
			output("\n\nSera is true to her word, however. After about a minute of fretful, muffled, shallow thrusting she relents, groaning harshly as she forces herself back down. She spends a long while sliding her cock in and out as slowly as she can, glorying in the sensation of your [pc.lips] gliding over her hard meat, giving you time to wrap and smooth your tongue over it. When she’s using your mouth it’s difficult to focus on anything but the sensation of being ruthlessly penetrated from above and below, the shuddering dildo stuffed into you making");
			if(pc.hasCock()) output(" [pc.eachCock] thrum and flex irresistibly as");
			if(vagIndex >= 0) output(" you seep juices");
			else output(" you tense");
			output(" eagerly around it; when she gives you instructions you follow them immediately, as if they arrived from your own impulses.");
			output("\n\nWhen she pulls her prodigious bulbous head out almost to your teeth, keeping it there and demanding you polish it, you do so, roiling your tongue across her cum-slit and the light, slightly giving flesh around it, the taste of her pre inundating your taste buds; when she says that you aren’t vocalizing your enjoyment enough, you ramp up the wet sounds you are already making, your muffled groaning around her cock fueled by the vibrations juddering through your core. It’s around then that the first customer comes in...");
			
			processTime(25 + rand(11));
			pc.lust(15);
			if(pc.exhibitionism() >= 33) pc.lust(15);
			if(pc.exhibitionism() >= 66) pc.lust(15);
			clearMenu();
			addButton(0, "Next", seraSexXXXhibitionBlowjob, [2, vagIndex]);
			return;
		}
		else if(pageNum == 2)
		{
			output("You quickly learn the best way to stop your mistress vigorously throat-fucking you or getting tempted to exhibit you to her customers is to bathe the end of her dick in close attention. When you lag, Sera either starts thrusting harder, or, if the customer is talking to her, starts dropping casual remarks about how much “entertainment” her own mods have provided for her. Or maybe this is all in your head. She is horribly, brilliantly random in her sadism.");
			output("\n\nIt may be half an hour later after you have successfully gotten through three customers without discovery that she grips the counter, arches her back and thrusts her thick, purple thighs downwards, practically lifting her feet off the ground to fuck your mouth as hard as she can. Your ears are full of the strenuous wet sounds of the furious oral, the light batting noise the succubus’s balls make when they beat into your chin. She pushes you back into the dildo mercilessly beating");
			if(vagIndex >= 0) output(" the wettened walls of your vagina");
			else if(pc.hasCock()) output(" at your sensitive prostate");
			else output(" the walls of your [pc.anus]");
			output(" and you are forced into orgasm");
			if(pc.hasCock())
			{
				output(", [pc.eachCock] spurting");
				if(pc.cumQ() >= 200) output(" rope after rope of");
				else if(pc.cumQ() >= 50) output(" a rope of");
				output(" cum against your stomach and [pc.chest]");
			}
			if(vagIndex >= 0)
			{
				output(", your [pc.vagina " + vagIndex + "] clenching up around it again and again");
				if(pc.isSquirter(vagIndex)) output(", spurting girl juice onto the floor");
			}
			else output(", your butt clenching up around it again and again");
			output(", beads of sweat standing out on your forehead.");
			output("\n\nYou dangle from your cuffs, spent and dissolved as Sera furiously pumps deep into your throat, filling every inch of your mouth with thick, musky meat, your own small gags and spasms around the impalement only seeming to provide her with greater pleasure and impetus. She groans long, low and exultant as her prick stretches your mouth even wider and then gutters hot cum straight into your stomach, pressing your [pc.lips] right up to her hairless crotch. Stars begin to swim around your vision before she unplugs herself from your throat, as ever doing it in stages - once she’s filled your stomach with warmth she pulls out step by step, surging her seed down your gullet, filling your mouth with it before finally pulling out and splattering your face and [pc.hair] with the last few pulses. She clutches her dangling, tumescent male sex in front of your mouth when she’s finished; after you’ve swallowed the hot cream in your mouth and managed to haul in several boat-loads of air after it, you lick her oozing end clean without instruction. The dildo continues to judder insistently at your tenderized inner walls; you’re at the stage now where you’ll do anything if it means release.");
			output("\n\n<i>“Whew!”</i> Sera says, breathing heavily. She wipes the sweat off her own forehead, looking like she’s just completed a strenuous but ultimately satisfying piece of shop work. <i>“That was pretty good for a first go. Hope you’re enjoying yourself down there, because even as good as you are at choking on dick it’s going to take me a while to build up as big a load as that for you again.”</i> Your wet moan turns into an arrested gulp as the door beeps again.");
			output("\n\nYou lose track, but in the time it takes for her to build to a second orgasm, plunging into your mouth gently at first and then with increasing insistence as she gets more and more erect, she manages to serve nine customers and you are driven to two more forced highs, your");
			if(vagIndex >= 0)
			{
				output(" aching cunt seizes up around the whirring dildo");
				if(pc.isSquirter(vagIndex)) output(", spurting juice everywhere");
				output(", clenching your body with ecstatic pulses");
				if(pc.hasCock()) output(" as [pc.eachCock] is forced to an almost dry, aching orgasm");
			}
			else
			{
				output(" [pc.anus] seizes up around the whirring dildo");
				if(pc.hasCock()) output(", forcing [pc.eachCock] to an almost dry, aching orgasm");
				if(pc.hasVagina() && pc.isSquirter()) output(" as your [pc.eachVagina] spurt juices everywhere");
			}
			output(". The whole universe narrows down to the vibrator stuffed in you and Sera’s cock; the dim understanding that you can escape this pleasure hell makes you focus on it intently, trying to excite and entice her as best you can with the sucking, roiling movements of your mouth and tongue.");
			output("\n\nFinally real urgency clenches her body up again; she scratches the counter with her claws, gasping as she pummels your throat strenuously with her bulging end, a fresh peak in sight. Your subdued moans join her gloating crows as she surges jizz down your throat, every bit as copious an ejaculation as the first. This time she pulls out before she’s half done, taking the time to clutch her foot-long pole and thoroughly paint you with her thick, musky seed. Unable to flinch or cover yourself, you take the hot, slimy shower on your [pc.face], [pc.hair] and [pc.chest]. At long last, she staggers back and collapses on her stool, semi-flaccid and oozing. After a few long, panting moments, she opens her yellow eyes to gaze down at you.");
			output("\n\n<i>“That’s a good look for you,”</i> she sighs, looking thoroughly pleased with herself. You are too dazed to respond; the dildo continues to thrum away inside you, oblivious to your exhaustion. The entire alcove is plastered with you and your mistress’s fluids; her jizz drips off you in gobbets. You suddenly see why she doesn’t put carpet down in her shop, and you stifle the urge to laugh hysterically. <i>“Having fun, are we?”</i> Sera husks with a raised eyebrow. She’s sliding her hand slowly down her massive cock, which never does go entirely flaccid. With a sweltering mixture of horror, awe and arousal it dawns on you that she’s more than capable of keeping you down here indefinitely. <i>“It goes without saying you enjoy polishing your mistress’s dick, but if you’re that keen I suppose we could go a third time...”</i>");
			output("\n\n<i>“I would like that very much, mistress,”</i> you say immediately, with as much enthusiasm as you can muster. She rolls her eyes and snorts with exasperation, as you knew she would.");
			output("\n\n<i>“Such a greedy slutbag!”</i> She tsks to herself as she frees your complaining wrists and blessedly withdraws the dildo. <i>“And after the mess you’ve created down here, too! Manners, bitch.”</i> She taps her thigh determinedly as she draws you, dripping, out of the alcove, reaching into a locker to throw a scented towel at you. She seems to have an unlimited supply of those. You are fast gaining an appreciation for why she does. <i>“We’re going to have work on them. Next time.”</i> You jerk as she slaps your [pc.butt] as way of farewell.");
			
			processTime(45 + rand(11));
			pc.exhibitionism(1);
			pc.exhibitionism(1);
			pc.exhibitionism(1);
			mimbraneFeed("face");
			mimbraneFeed("chest");
		}
	}
	
	pc.orgasm();
	pc.loadInMouth(chars["SERA"]);
	pc.loadInMouth(chars["SERA"]);
	sera.orgasm();
	IncrementFlag("SERA_EXHIBITION_BLOWJOB");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// No. 3 in a Threesome
public function seraSexXXXJardiThreesome(response:String = "jardis"):void
{
	clearOutput();
	author("Nonesuch");
	showBust("SERA", "JARDI");
	showName("SERA\nAND JARDI");
	
	// First
	if(flags["SERA_IN_JARDI_THREESOME"] == undefined)
	{
		if(response == "jardis")
		{
			output("You kneel in front of Sera, gazing up at her unabashedly perverse form.");
			output("\n\n<i>“Mi - ”</i> The door beeps.");
			output("\n\n<i>“Mistress?”</i> says a breathy, female voice. <i>“I’m sorry I – oh.”</i> Sera beckons impatiently.");
			output("\n\n<i>“Finally! Stand over there, girl.”</i> You slowly look up at the person who nervously takes her place at your side.");
			// Flahne met:
			if(flags["MET_FLAHNE"] != undefined) output(" It’s a rahn – but quite different to the one you met on Mhen’ga. Her eyes are brown, her lips are a deep red and her flesh is an opaque gelatinous white, like Turkish delight. She’s also considerably more svelte than Flahne, perky, pert breasts and ass discernible underneath her simple slacks and blouse. Her “hair” is done up in a neat top pile, though. Perhaps that’s fashionable amongst the rahn right now.");
			// Otherwise:
			else
			{
				if(CodexManager.entryViewed("Rahn")) output(" It appears to be rahn, with");
				else
				{
					output(" It’s some sort of");
					CodexManager.unlockEntry("Rahn");
				}
				output(" partially opaque gel humanoid with long ears, brown eyes, deep red lips and a pretty face, despite its lack of a nose. Her flesh is a striking, gelatinous white, like Turkish delight, and she is agreeably slim by human standards, her perky, pert breasts and ass discernible underneath her simple slacks and blouse. Her “hair”, which seems to be simply an extension of her gel flesh, is done up in a neat top pile.");
			}
			output(" Sera waves a claw lazily.");
			output("\n\n<i>“[pc.name], meet Jardi. She is a go’rahn and a bitch. Jardi, meet [pc.name]. [pc.He] is a [pc.race] and also a bitch.”</i> She bites her lower lip as she considers the two of you, before getting up. <i>“I’m going to make some adjustments in the back. You two have a chat. You’re going to be working together very closely soon.”</i>");
			output("\n\nJardi looks across at you shyly as the succubus strides out of the room. Feeling you should take the initiative, you ask the pretty gel-girl how she got to know Sera.");
			output("\n\n<i>“I work on the flight deck. I didn’t come in here for anything specifically, I just like exploring the station, meeting new people. But when I came in here... uh... ”</i> She twiddles her fingers, her cheeks turning a lovely rose color. <i>“I don’t know how much you know about the rahn, but we’re a very open and casual people when it comes to sex. Very... consensual? When I encountered something as forceful as that, I kind of... You know how they tell you when you meet a new people to wear a breathing mask, because they might be carrying stuff your immune system has no resistance to?”</i>");
			output("\n\nYou tell her you understand. She looks at you with her big, brown eyes.");
			output("\n\n<i>“Are all human relationships like this?”</i> You only have time to laugh before Sera’s voice comes floating out of the door behind the counter.");
			output("\n\n<i>“You two. Down the corridor and on your right. Now.”</i> You proffer your hand companionably to Jardi, who takes it with a grateful smile. Together you head on through and into the gloom of the room on your right.");
			output("\n\n");
			if(fuckedSeraAsMistress()) output("Although you’ve been in here before, the atmosphere in Sera’s bedroom is even more thickly sensual and unreal than it usually is. She’s set up a hookah on a table at the head of the bed, where she herself is positioned, lounging against the back. The smoke from the ornate device, cloying and vaguely herbal, sits effervescently in the air, making the purple-lit space even more gloomy than it usually is. The only certain illuminations are Sera’s horns and brilliant yellow slit eyes, boring into you from across the room. The strange white noise is still there, a whispering interference burying busily into your mind. The memory of the things you have already done in here combine with the dense ambience to make you feel open, pliant, accepting and sensitive before you’ve even taken two steps in.");
			else output("The space is dominated by a large, heart-shaped bed, unkempt, as everything in here seems to be – clothes, headphones and who knows what else clutter the floor and shelves. You can’t really tell because it’s even duller in here than in the shop, if that’s possible – small, purple-shaded wall fixtures seem to throw gloom rather than light. There’s a gentle, muffled white noise coming from somewhere – a stereo? – that permeates the space. There is a hookah on a table at the head of the bed, where Sera herself is positioned, lounging against the back. The smoke from the ornate device, cloying and vaguely herbal, sits faintly in the air, making the purple-lit space even more shadowy than it would normally be. The only certain illuminations are Sera’s horns and brilliant yellow slit eyes, gazing at you from across the room. The dense ambience makes the place feel unreal, thickly sensual.");
			output("\n\n<i>“Aww,”</i> she croons to herself, as you and Jardi pause in the doorway. <i>“Hand in hand. You two are so sweet I might just bust a nut.”</i> She pauses to take a long pull on the hose she has in her hand, pupils dilating as she fountains smoke out of her nostrils. <i>“You,”</i> she says, pointing at you. <i>“Come here.”</i>");
			output("\n\nHesitantly, you let go of Jardi and climb onto the bed. Your mistress lays a comforting hand on your shoulder, sliding it downwards as she offers you the mouthpiece. Again with a certain degree of apprehension, you put your lips on it and inhale. It’s not acrid, as you were expecting; hot, perfumed air with the faintest trace of bitterness billows into your lungs. It’s quite nice, in fact. The way the smoke feels like it’s permeating through you, making your pores open and the blood rise to the surface of your skin, the way it makes warmth sink down to your groin");
			if(pc.hasGenitals())
			{
				output(",");
				if(pc.hasCock()) output(" your [pc.cock] engorging");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" your [pc.vagina] puffing up");
			}
			output("... Sera looks down at you with a knowing smile.");
			output("\n\n<i>“Take another drag,”</i> she says lowly. <i>“This time hold it.”</i> You do so quite happily, drawing in the perfumed smoke, feeling intensely relaxed and happy to be here, near the warmth and power of your mistress. <i>“Now,”</i> she whispers. <i>“Go across and give it to her.”</i> ");
			output("\n\nHolding your breath, you turn to where she’s gesturing, vaguely surprised to find Jardi is still here, sat on the edge of the bed and watching this display nervously. Why is she tense? There is nothing to be tense about here. Feeling an instinctive urge to touch her, you crawl across the duvet, your payload hot in your lungs, spread your hands around her gooey head and push your lips against hers tenderly. You wait until she reciprocates, opening her mouth to kiss you back before releasing, channelling the perfumed smoke into her. You slide your lips over hers for a while longer, enjoying the beautiful warm give of this creature, before gently parting.");
			output("\n\n<i>“Ooh,”</i> sighs Jardi, blinking a couple of times. Her pupils dilate and she smiles at you amorously. You do the same back, practically giggling together at how wonderful everything is.");
			
			processTime(25);
			pc.lust(15);
			if(pc.hasCock()) pc.lust(15);
			if(pc.hasVagina()) pc.lust(15);
			clearMenu();
			addButton(0, "Next", seraSexXXXJardiThreesome, "hookah");
			return;
		}
		else if(response == "hookah")
		{
			output("<i>“Good,”</i> husks Sera. She’s lying back against the bed frame, clutching her turgid cock with one hand and toying with her gleaming pussy with the other. <i>“Now take off");
			if(!pc.isNude()) output(" each other’s");
			else output(" her");
			output(" clothes. Put on a display for me.");
			if(pc.hasCock()) output(" Don’t fuck, though. That’s not for you.");
			else output(" Make it good. It’s been so long since I watched two lesbian sluts go at each other.");
			output("”</i> You slide off Jardi’s blouse, undo her bra slowly, and when her pretty, petite breasts are exposed engulf a nipple with your mouth.");
			if(!pc.isNude()) output(" Her hands slide beneath your [pc.gear], exploring and touching you with her pleasantly moist hands as she unclasps and unwraps you as you do the same for her. She coos as you continue to work, slowly divesting her of her slacks and pink panties.");
			else output(" With your clothes already long gone the goo-girl has nothing to do but coo and slide her pleasantly moist hands down your frame, exploring you as you slowly divest her of her slacks and pink panties.");
			output("\n\nJardi’s naked, gooey flesh is delightful to touch, to cusp and sink your fingers and tongue into, a hot, human-shaped blancmange which sighs and gasps when you touch its erogenous areas, and by the way she eagerly reciprocates she finds your body equally enjoyable. She straddles your waist with her slim thighs, rotating them gently as you sink your fingers into her sweltering pussy, passionately frenching you, her long tongue reaching deeper into your mouth the deeper you probe into her sex.");
			output("\n\nPanting slightly, she pulls out and descends to your [pc.chest]. You place your hands behind you and exhale long and low as she slathers her tongue over first one [pc.nipple] then the next,");
			if(pc.hasCuntNipples() || pc.hasLipples()) output(" making them bead before penetrating them with her delightfully long, drooling muscle, humming happily as she laps at the pink insides of your pussy breasts");
			else output(" the gentle, insistence of her mouth making them stand out, keenly erect");
			output(".");
			if(pc.isNaga()) output(" You slither your coils onto the bed and slowly wrap them around the goo-girl; she runs her hands over your smooth scales as they surround her, blissed out, and gladly opens her mouth when you gently poke it with your tip. You smile dozily as she envelopes your tail end in sucking balm.");
			if(pc.hasCock()) output(" Her own hand descends to your [pc.cock] and envelopes it, goo swaddling that mushily milks you, making you achingly hard. The desire to push forward and penetrate this lissom, willing girl is almost unbearable, but your mistress’s words echo in your head, holding you back and just that, being denied by your own obedience makes it even hotter, your cock straining to Jardi’s teasing touch.");
			else if(pc.hasVagina())
			{
				output(" Her own hand descends to your mound, traces your labia and then quests into your [pc.vagina]. She is able to caress your [pc.clit] with her thumb whilst penetrating you deep, rubbing your walls with pulsing jelly. The desire to thrust your [pc.hips] into her hand and get off to what this lissom, generous girl is doing is almost unbearable – but you know your mistress wouldn’t want that, she wants you kept on the edge, and you keep your movements slow. Just that, being denied by your own obedience makes you even hotter, your pussy");
				if(pc.isSquirter()) output(" streaming");
				else output(" dripping");
				output(" to Jardi’s teasing touch.");
			}
			output("\n\nYour sighs, kisses and licks are overlain by the heavy sound of Sera’s breathing and the shifting, wet sound of her masturbation as she watches you. <i>“And some people pay for porn,”</i> you think you hear her groan at one point. Making out with this slim, tender rahn under the sensitizing effects of this room and the smoke would be wonderfully pleasant whatever the case, but the fact it’s done for your mistress’s own viewing pleasure makes it overwhelmingly erotic.");
			output("\n\nWhen you clasp Jardi’s hands and kiss her deeply again, crouched opposite you, Sera makes her move. She shifts over and lays her hand behind each of your heads, knelt over you. You continue to curl your tongue around Jardi’s, confused for a moment – until a musky, foot long prick slides in front of your lips from the side.");
			output("\n\n<i>“Keep going dears,”</i> sighs the succubus, clasping your heads firmly and moving her hips slowly, gliding your lip-lock up and down her thick cock. You open your mouth wide and feel the goo-girl’s soft, red mouth on the other side of the veiny hardness shifting between you. With a bit of effort it’s possible for the two of you to continue mingling your tongues and lips whilst Sera runs all twelve inches of her male sex through your joining, it just requires you to open your mouths quite wide, make sloppier and needier noises than you were before. Jardi’s hands tighten around yours when Sera ends by sliding all the way back so her pre-cum beading bulb is between you; your body throbbing with arousal and acquiescent bliss, you join the goo girl in lavishing it with your tongue.");
			output("\n\nSera’s breath is heavy as she withdraws and singles out Jardi, her hand brushing her breasts as she turns her around and firmly presses her head into the duvet, exposing her tight round ass and oozing goo pussy, rose with arousal. She slides her bulging cock down the crack of her behind and teases her entrance with it; the goo girl’s muffled whimper travels to you through the sheets. Sera looks over her shoulder at you, her yellow eyes livid in the gloom.");
			// Cock, less than 6 inches:
			if(pc.hasCock() && pc.biggestCockLength() < 6)
			{
				output(" Her teeth gleam as she sees how eagerly erect your toy-like [pc.boy] cock is.");
				output("\n\n<i>“I’m gonna touch her and make her cry out in ways you can’t, sissy.”</i> She flares her hips as she gently dips into Jardi’s seeping vagina, displaying her purple rear to you – her bloated balls, wet pussy, and large, round ass. <i>“Since you did such a good job of warming her up for me, though... I will leave it up to you how you use your mouth to please me as I do.”</i>");
			}
			// Otherwise:
			else
			{
				output(" Her teeth gleam as she flares her hips to dip into Jardi’s seeping vagina, displaying her rear to you - her bloated balls, wet pussy, and large, round ass.");
				output("\n\n<i>“Since you did such a good job of warming this slut up for the good, hard fucking I’m gonna give her... I will leave it up to you how you use your mouth to please me as I do.”</i>");
			}
			
			processTime(10);
			pc.lust(5);
			if(pc.hasCock()) pc.lust(5);
			if(pc.hasVagina()) pc.lust(5);
			
			// [Balls] [Pussy] [Ass]
			clearMenu();
			addButton(0, "Balls", seraSexXXXJardiThreesome, "balls");
			addButton(1, "Pussy", seraSexXXXJardiThreesome, "pussy");
			addButton(2, "Ass", seraSexXXXJardiThreesome, "ass");
			return;
		}
		else if(response == "balls" || response == "pussy" || response == "ass")
		{
			if(response == "balls")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you envelope one of her bulging testicles in your mouth. Equal parts mistress musk and salt saturates your [pc.tongue], sending arousal wiring down to your [pc.groin].");
				output("\n\n<i>“Oh, that’s good,”</i> Sera whispers. <i>“Use your tongue. Yes!”</i> She practically sings it when you gently compress your cheeks around the sensitive orb in your mouth. <i>“You should feel what this filthy [pc.boy]-slut is doing, Jardi,”</i> groans the demon. <i>“[pc.He]’s going to make me cum a fucking ocean into you. Now the other one,”</i> she orders, with a stern flourish. You are too under the influence of the room and her but to do anything other; you shift your [pc.lips] across her dipping and rising scrotum to suck at her other ball, gently lapping at it as her round ass rises and recedes, buried in the white mound ahead of you.");
				output("\n\nShe pumps into Jardi slowly at first, letting you get used to her recede and extent, before picking up the pace, bumping back into you brusquely, making you move your neck in order to continue shifting your lips worshipfully over her cum factories. With every inward thrust they seem to tighten, thicken, as they prepare their load. There is a breathy, muffled moan as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her balls and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly adept appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. You flinch as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s breathy whimper becomes a squawk, and there is a sound like a tap momentarily being turned on.");
				output("\n\n<i>“You don’t know about go’rahns, do you [pc.name]?”</i> Sera says magisterially, slowing her thrusting down for a moment. <i>“I know you can’t see from where you are – sucking my balls and all – but you can hear. Consider this an education.”</i> She speeds up, jouncing into you, pushing herself hard into your caressing warmth. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". You encompass her gonads whole, kneading the dense orbs closely with your sucked in cheeks and tongue.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				output(" They swell in your mouth as, with a dozen gratified exhalations, she unloads them into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s close enough to call it that.");
			}
			else if(response == "pussy")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch of her cock into Jardi’s plump cunt. The rahn makes a sing-song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face into her neat, gleaming cunt, touching the stubborn bud of her clit with your tongue.");
				output("\n\n<i>“Good [pc.boy],”</i> sighs Sera, withdrawing and flaring her hips further, drawing your mouth into her wet opening. <i>“Lick all around and then – yes!”</i> You lavish saliva on her firm button until it is bulging out of its hood, before sinking your tongue into her moist opening, curling into her warm pink as deep as you can go. She pumps into Jardi slowly at first, letting you get used to the extent of her movements before picking up the pace, bumping back into you brusquely, swathing her female sex around your tongue every time she draws her male sex outwards. Her pussy muscles are incredibly limber; when she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Still, with smart movements of your tongue you are able to caress her clit whilst attacking her inner pink vigorously. There is a breathy, muffled moan ahead of you as the demon pumps harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her pussy and she rewards you by penetrating your own [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly adept appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. You flinch as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily.");
				output("\n\n<i>“You don’t know about go’rahns, do you [pc.name]?”</i> Sera says magisterially, slowing her thrusting down for a moment. <i>“I know you can’t see from where you are – face full of my pussy and all – but you can hear. Consider this an education.”</i> She speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s cunt, delving into her wet tunnel as far as you can.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your [pc.tongue] into her pussy.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your [pc.tongue] into her pussy.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				output(" Your mistress’s buttocks slap into you as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you, her pussy clenching down on your tongue and glazing your face liberally with lubricant. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			else if(response == "ass")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face between her soft butt-cheeks, touching the tight pucker of her rose with your [pc.tongue].");
				output("\n\n<i>“Give a [pc.boy] a chance to lick my pussy and [pc.he] chooses to lick my ass,”</i> sighs Sera in mocking exasperation, withdrawing and flaring her hips further, drawing your mouth into her crack. <i>“Says a lot about you. Lap all around it then you nasty whore, make it nice and soft – mmm, that’s it – then get your tongue up in there. I want to feel it deep when I cum into this bitch.”</i> You lavish saliva on her sphincter, lubing and loosening it sufficiently for you to penetrate into her hot tunnel, reaching inside as far as you can, your [pc.lips] pressing deep into her ass. She pumps into Jardi slowly at first, letting you get used to her recede and extent, before picking up the pace, bumping back into you brusquely, her flawless butt-cheeks flapping into your face energetically. When she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Nonetheless, after curling downwards you feel something like a hard ball against your tip which makes Sera crow with glee when you bump it. There is a breathy, muffled moan ahead of you as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her anus and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly adept appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily.");
				output("\n\n<i>“You don’t know about go’rahns, do you [pc.name]?”</i> Sera says magisterially, slowing her thrusting down for a moment. “I know you can’t see from where you are – licking my butt and all – but you can hear. Consider this an education.”</i> She speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand slams into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s asshole, searching in deep to tongue at her prostate.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				output(" Your mistress’s full buttocks slap into your face as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			output("\n\nWhen it is all over, Sera collapses onto the sheets, shifting herself away from the massive wet patch your frantic threesome has left. As she does so she throws an arm around both you and Jardi, taking you with her, drawing you into the warmth of her soft, sweat-dappled breasts as she sinks into the pillows.");
			output("\n\n<i>“My");
			if(pc.mfn("m", "f", "n") != "m") output(" girls");
			else output(" boy and girl");
			output(",”</i> she croons, looking down at the two of you with deep, avaricious satisfaction. Jardi, who looks thinner and utterly drained, doesn’t seem to have the strength to do anything but hug her back. It’s unusual to see your hyper-sexed mistress look anything but agitated so you savor the moment; press into her soft boob and doze in this strange, shadowy room for a few spaced out minutes.");
			output("\n\nEventually she shoos you off with a throaty laugh and a wave of her claw. You quickly");
			if(!pc.isNude()) output(" re-dress and");
			output(" head back out to the shop floor: the real world, or something approaching it. Jardi wiggles her fingers at you, smiling bashfully as she leaves. Standing here now, it’s difficult to believe anything of what just happened... if it wasn’t for a throbbing afterglow and the taste of perfumed smoke in your mouth.");
			
			processTime(35);
		}
	}
	// Repeat
	else
	{
		if(response == "jardis")
		{
			output("<i>“Mistress.”</i>");
			output("\n\nSera looks down at you from atop her stool silently, tapping her nails on the counter. She looks like she’s waiting for something. What that might be occurs to you at the exact moment the shop door beeps.");
			output("\n\n<i>“I won’t be late again mistress, I sw- oh.”</i> The purple dominatrix eats you and Jardi up with her eyes for a few moments, a predatory smile on her face, then without a word gets up and saunters into the back, slapping her butt cheek lightly with her tail as she does. You take a deep breath and offer your hand to the albino goo girl; she as ever takes it with a tremulous red smile. Together you head down the corridor and into the smoky, spacey gloom of Sera’s bedroom.");
			output("\n\n<i>“I thought the hand-holding thing would stop being adorable but it never does,”</i> murmurs the tall, dusky figure lounging at the head of the bed, twisting a hookah pipe. <i>“I’m going to have to look into getting you two matching collars.”</i> Brilliant, inhuman eyes consider you from across the room. <i>“Here.”</i>");
			output("\n\nThe memory of the things you have done in here combine with the dense ambience to make you feel open, pliant, accepting and sensitive before you’ve even gotten to Sera’s proffered nozzle and sucked in the hot, perfumed air. You close your eyes and let it permeate through you, making your pores open and the blood rise to the surface of your skin, warmth sinking down to your groin");
			if(pc.hasGenitals())
			{
				output(",");
				if(pc.hasCock()) output(" your [pc.cock] engorging");
				if(pc.isHerm()) output(" and");
				if(pc.hasVagina()) output(" your [pc.vagina] puffing up");
			}
			output("...");
			output("\n\nFeeling intensely relaxed and blissful, you don’t need your mistress to tell you to take a second pull, holding it deep within you as you turn and crawl over to Jardi. She doesn’t resist when you put your hand around her gooey head and push your lips against hers tenderly, hums happily as she opens her mouth to kiss you back, allowing you to channel the perfumed smoke into her. You slide your lips over hers for a while longer, enjoying the beautiful warm give of this creature, before gently parting. The pale goo girl looks at you dozily as her pupils dilate, a red, amorous smile slowly spreading across her glistening face.");
			output("\n\n<i>“Good,”</i> husks Sera. She’s lying back against the bed frame, clutching her turgid cock with one hand and toying with her gleaming pussy with the other. <i>“Now take off");
			if(!pc.isNude()) output(" each other’s");
			else output(" her");
			output(" clothes. Enjoy yourselves");
			if(flags["SERA_IN_JARDI_THREESOME"] == undefined) output(" like an owned pair of sluts should");
			output(".");
			if(flags["SERA_IN_JARDI_THREESOME"] == undefined) output(" Not too much, though. I’m the one who’s going to make you two cum.");
			output("”</i> You slide off Jardi’s blouse, undo her bra slowly, and when her pretty, petite breasts are exposed engulf a nipple with your mouth.");
			if(!pc.isNude()) output(" Her hands slide beneath your [pc.gear], exploring and touching you with her pleasantly moist digits as she unclasps and unwraps you as you do the same for her, unbuttoning her blouse, exposing her pretty, petite breasts, engulfing a nipple as you do. She coos as you continue to work, slowly divesting her of her slacks and pink panties.");
			else output(" With your clothes already long gone the goo-girl has nothing to do but coo and slide her pleasantly moist hands down your frame, exploring you as you slowly divest her of her slacks and pink panties.");
			output("\n\nJardi’s naked, gooey flesh is delightful to touch, cusp and sink your fingers and tongue into, a hot, human-shaped blancmange which sighs and gasps when you touch her erogenous areas, and by the way she eagerly reciprocates she finds your body equally enjoyable. She straddles your waist with her slim thighs, rotating them gently as you sink your fingers into her sweltering pussy, passionately snogging you, her long tongue reaching deeper into your mouth the deeper you probe into her wet pussy.");
			output("\n\nPanting slightly, she pulls out and descends to your [pc.chest]. You place your hands behind you and exhale long and low as she slathers her tongue over first one [pc.nipple] then the next,");
			if(pc.hasCuntNipples() || pc.hasLipples()) output(" making them bead before penetrating them with her delightfully long, drooling muscle, humming happily as she laps at the pink insides of your pussy breasts");
			else output(" the gentle, insistence of her mouth making them stand out, keenly erect");
			output(".");
			if(pc.isNaga()) output(" You slither your coils onto the bed and slowly wrap them around the goo-girl; she runs her hands over your smooth scales as they inundate her, blissed out, and gladly opens her mouth when you gently poke it with your tip. You smile dozily as she envelopes your tail end in sucking balm.");
			if(pc.hasCock()) output(" Her own hand descends to your [pc.cock] and envelopes it, goo swaddling that mushily milks you, making you achingly hard. The desire to push forward and penetrate this lissom, willing girl is almost unbearable, but your mistress’s words echo in your head, holding you back and just that, being denied by your own obedience makes it even hotter, your cock straining to Jardi’s teasing touch.");
			else if(pc.hasVagina())
			{
				output(" Her own hand descends to your mound, traces your labia and then quests into your [pc.vagina]. She is able to caress your [pc.clit] with her thumb whilst penetrating you deep, rubbing your walls with pulsing jelly. The desire to thrust your [pc.hips] into her hand and get off to what this lissom, generous girl is doing is almost unbearable – but you know your mistress wouldn’t want that, she wants you kept on the edge, so you keep your movements slow. Just that, being denied by your own obedience makes you even hotter, your pussy");
				if(pc.isSquirter()) output(" streaming");
				else output(" dripping");
				output(" to Jardi’s teasing touch.");
			}
			processTime(25 + rand(11));
			pc.lust(15);
			if(pc.hasCock()) pc.lust(15);
			if(pc.hasVagina()) pc.lust(15);
			clearMenu();
			addButton(0, "Next", seraSexXXXJardiThreesome, "hookah");
			return;
		}
		else if(response == "hookah")
		{
			output("Your sighs, kisses and licks are overlain by the heavy sound of Sera’s breathing and the shifting, wet sound of her masturbation as she watches you. <i>“And some people pay for porn,”</i> you think you hear her groan at one point. Making out with this slim, tender rahn under the sensitizing effects of the room and smoke would be wonderfully pleasant whatever the case, but the fact it’s done for your mistress, for her own viewing pleasure makes it overwhelmingly erotic.");
			output("\n\nWhen you clasp Jardi’s hands and kiss her deeply again, crouched opposite you, Sera makes her move. She shifts over and lays her hand behind each of your heads, kneeling over you. You continue to curl your tongue around Jardi’s, confused for a moment – until a musky, foot long prick slides in front of your lips from the side.");
			output("\n\n<i>“Keep going dears,”</i> sighs the demon, clasping your heads firmly and moving her hips slowly, gliding you and Jardi’s lip-lock up and down her thick cock. You open your mouth wide and feel the goo-girl’s soft, red mouth on the other side of the veiny hardness shifting between you. With a bit of effort it’s possible for the two of you to continue mingling your tongues and lips whilst Sera runs all twelve inches of her sex through your joining, it just requires you to open your mouths quite wide, make sloppier and needier noises than you were before. Jardi’s hands tighten around yours when Sera ends by sliding all the way back so her pre-cum beading bulb is between you; your body throbbing with arousal and acquiescent bliss, you join the goo girl in lavishing it with your tongue.");
			output("\n\nSera’s breath is ragged as she withdraws and singles out Jardi, her hand brushing her breasts as she turns her around and firmly presses her head into the duvet, exposing her tight round ass and oozing goo pussy, rose with arousal. She slides her bulging cock down the crack of her behind and teases her entrance with it; the goo girl’s muffled whimper travels to you through the sheets. Sera looks over your shoulder at you, her yellow eyes livid in the gloom.");
			// Cock, less than 6 inches:
			if(pc.hasCock() && pc.biggestCockLength() < 6)
			{
				output(" Her teeth gleam as she sees how eagerly erect your toy-like [pc.boy] cock is.");
				output("\n\n<i>“I’m gonna touch her and make her cry out in ways you can’t, sissy.”</i> She flares her hips as she gently dips into Jardi’s seeping vagina, displaying her purple rear to you – her bloated balls, wet pussy, and large, round ass. <i>“Since you did such a good job of warming her up for me, though... I will leave it up to you how you use your mouth to please me as I do.”</i>");
			}
			// Otherwise:
			else output(" Her teeth gleam as she flares her hips to dip into Jardi’s seeping vagina, displaying her rear to you - her bloated balls, wet pussy, and large, round ass. <i>“Since you did such a good job of warming this slut up for the good, hard fucking I’m gonna give her...I will leave it up to you how you use your mouth to please me as I do.”</i>");
			
			processTime(10);
			pc.lust(5);
			if(pc.hasCock()) pc.lust(5);
			if(pc.hasVagina()) pc.lust(5);
			
			// [Balls] [Pussy] [Ass]
			clearMenu();
			addButton(0, "Balls", seraSexXXXJardiThreesome, "balls");
			addButton(1, "Pussy", seraSexXXXJardiThreesome, "pussy");
			addButton(2, "Ass", seraSexXXXJardiThreesome, "ass");
			return;
		}
		else if(response == "balls" || response == "pussy" || response == "ass")
		{
			if(response == "balls")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you envelope one of her bulging testicles in your mouth. Equal parts mistress musk and salt saturates your [pc.tongue], sending arousal wiring down to your [pc.groin].");
				output("\n\n<i>“Oh, that’s good,”</i> Sera whispers. <i>“Use your tongue. Yes!”</i> She practically sings it when you gently compress your cheeks around the sensitive orb in your mouth. <i>“You should feel what this filthy [pc.boy]-slut is doing, Jardi,”</i> groans the demon. <i>“[pc.He]’s going to make me cum a fucking ocean into you. Now the other one,”</i> she orders with a stern flourish. You are too under the influence of the room and her but to do anything other; you shift your [pc.lips] across her dipping and rising scrotum to suck at her other ball, gently lapping at it as her round ass rises and recedes, buried in the white mound ahead of you.");
				output("\n\nShe pumps into Jardi slowly at first, letting you get used to the extent of her movements, before picking up the pace, bumping back into you brusquely, making you move your neck in order to continue moving your lips over her cum factories. With every inward thrust they seem to tighten and thicken as they prepare their load. There is a breathy, muffled moan as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her balls and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly focused appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily. The succubus speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". You encompass her gonads whole in return, kneading the dense orbs closely with your sucked in cheeks and tongue.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you surround her overstuffed balls with sucking warmth.");
				output(" They swell in your mouth as, with a dozen gratified exhalations, she unloads them into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s close enough to call it that.");
			}
			else if(response == "pussy")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing-song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face into her neat, gleaming cunt, touching the stubborn bud of her clit with your tongue.");
				output("\n\n<i>“Good [pc.boy],”</i> sighs Sera, withdrawing and flaring her hips further, drawing your mouth into her wet opening. <i>“Lick all around and then – yes!”</i> You lavish saliva on her firm button until it is bulging out of its hood, before sinking your tongue into her moist opening, curling into her warm pink as deep as you can go. She pumps into Jardi slowly at first, letting you get used to the extent of her movements before picking up the pace, bumping back into you brusquely, your tongue swallowed whole by her female sex every time she draws her male sex outwards. Her pussy muscles are incredibly limber; when she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Still, with smart movements of your tongue you are able to caress her clit whilst attacking her inner pink vigorously. There is a breathy, muffled moan ahead of you as the succubus pumps harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her pussy and she rewards you by penetrating your own [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly focused appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily. The succubus speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s cunt, delving into her wet tunnel as far as you can.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her pussy.");
				output(" Your mistress’s buttocks slap into you as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you, her pussy clenching down on your tongue and glazing your face liberally with lubricant. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			else if(response == "ass")
			{
				output("You slowly crawl forward, the sight of Sera’s ample thighs and behind taking up everything as she slowly buries every inch into Jardi’s plump cunt. The rahn makes a sing song gasp when her mistress’s hips touch her behind, seeping fluid from her stuffed tunnel freely. You wrap your hands around the purple, pliant warmth of the succubus’s waist and when she withdraws you bury your face between her soft butt-cheeks, touching the tight pucker of her rose with your tongue.");
				output("\n\n<i>“Give a [pc.boy] a chance to lick my pussy and [pc.he] chooses to lick my ass,”</i> sighs Sera in mocking exasperation, withdrawing and flaring her hips further, drawing your mouth into her crack. <i>“Says a lot about you. Lap all around it then you nasty whore, make it nice and soft – mmm, that’s it – then get your tongue up in there. I want to feel it on my prostate when I cum into this bitch.”</i> You lavish saliva on her sphincter, lubing and loosening it sufficiently for you to penetrate into her hot tunnel, reaching inside as far as you can, your [pc.lips] pressing deep into her ass. She pumps into Jardi slowly at first, letting you get used to the extent of her movements before picking up the pace, bumping back into you brusquely, her flawless butt-cheeks flapping into your face energetically. When she thrusts inwards she tightens up hard on your tongue, making it almost impossible to move. Nonetheless, after curling downwards you feel something like a hard ball against your tip which makes Sera crow with glee when you bump it. There is a breathy, muffled moan ahead of you as the succubus thrusts harder, driven on by your ministrations.");
				output("\n\nSomething warm and blunt drifts down your lower back, questing into the crack of your [pc.butt].");
				if(!pc.hasVagina())
				{
					output(" You tense up for a moment when Sera pushes her tail spade into your [pc.anus], but it is only for a moment; the beguiling relaxation and arousal inundating your senses allows her to easily penetrate you, pumping into your tight depths with demanding fretfulness");
					if(pc.hasCock()) output(", inexorably making your erect [pc.cockNoun] twitch and bat against your abdomen");
					output(".");
				}
				else
				{
					output(" You close your eyes and sigh as Sera skillfully reaches further down with her tail spade and circles your [pc.clit] with its very tip, making it bulge deliciously.");
					output("\n\n<i>“I don’t believe I said stop, slut.”</i> You bend back to your task, lapping delicately at her anus and she rewards you by penetrating your [pc.vagina] hard, making you spasm slightly. The beguiling relaxation and arousal inundating your senses allows her to easily penetrate you though, pumping into your tight depths with demanding fretfulness, inexorably making you wetter and wetter.");
				}
				if(flags["SERA_INCH_STEAL"] != undefined) output(" A purple tinted memory of how she gained such a long tail surfaces, and you stifle a moan only with difficulty.");
				
				output("\n\nSera fucks into the two of you ruthlessly with her hard, unrelentingly focused appendages, and soon your own cries join those of Jardi’s, every bit as muffled as hers. Your head jerks as, with a reverberating crack, Sera’s hand lands on the goo girl’s butt. Jardi’s long, breathy whimper becomes a squawk, and there is a sound like a tap being turned on momentarily. The succubus speeds up, jouncing into you, penetrating herself hard on your tongue. Her hand smacks into Jardi’s other flank.");
				output("\n\n<i>“Who’s your spring, huh snow slut?”</i> Your mistress snarls. Smack. <i>“Who’s your spring melt? Tell me!”</i>");
				output("\n\n<i>“You are mistress, you are,”</i> whimpers Jardi. Her voice sounds thick, as if her mouth is full of drool. Again the gushing sound. You arch your back as Sera pushes her tail deep into you");
				if(pc.hasVagina() && pc.isSquirter()) output(", forcing your cunt to sound like a tap itself");
				output(". Urgently you focus your attention on your mistress’s asshole, searching in deep to tongue at her prostate.");
				output("\n\n<i>“S’right you cum-colored cocksleeve, I’m your spring melt,”</i> Sera declaims. <i>“So what are you?”</i>");
				output("\n\n<i>“I’m your w - I’m your waterf...”</i> It’s lost as Jardi orgasms. It sounds exactly like somebody tipped a bucket of water onto the bed. Even from where you are, your arms and [pc.chest] are splattered with warm fluid. Every inch of Sera’s spade penetrates you and you clench your arms around her waist as you cum,");
				if(pc.hasVagina()) output(" your [pc.vagina] flexing ecstatically around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else if(pc.hasCock()) output(" your [pc.cock] flexing out streamers of cum onto the bed and your chest, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				else output(" your [pc.anus] flexing tremulously around her tail, your [pc.hips] pumping into it as hard as they can as you bury every inch of your tongue into her ass.");
				output(" Your mistress’s buttocks slap into you as, with a dozen gratified exhalations, she completely unloads her over-stuffed balls into the mess of an albino goo-girl in front of you. It’s not quite a simultaneous triple orgasm, but it’s pretty close.");
			}
			output("\n\nWhen it is all over, Sera collapses onto the bed, shifting herself away from the massive wet patch your frantic threesome has left. As she does so she curls an arm around both you and Jardi, taking you with her, drawing you into the warmth of her soft, sweat-dappled breasts as she sinks into the pillows.");
			output("\n\n<i>“My");
			if(pc.mfn("m", "f", "n") != "m") output(" girls");
			else output(" boy and girl");
			output(",”</i> she croons, looking down at the two of you with deep, avaricious satisfaction. Jardi, who looks thinner and utterly drained, doesn’t seem to have the strength to do anything but hug her back. It’s unusual to see your hyper-sexed mistress look anything but agitated, so you savor the moment; press into her soft boob and doze in this strange, shadowy room for a few spaced out minutes.");
			output("\n\nEventually she shoos you off with a throaty laugh and a wave of her claw. You quickly");
			if(!pc.isNude()) output(" re-dress and");
			output(" head back out to the shop floor: the real world, or something approaching it. Jardi wiggles her fingers at you, smiling bashfully as she leaves. Standing here now, it’s difficult to believe anything of what just happened... if it wasn’t for a throbbing afterglow and the taste of perfumed smoke in your mouth.");
			
			processTime(25 + rand(11));
		}
	}
	
	pc.orgasm();
	sera.orgasm();
	IncrementFlag("SERA_IN_JARDI_THREESOME");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Get Ridden
public function seraSexXXXGetRiddenStart():void
{
	var vagIndex:int = -1;
	var cockIndex:int = -1;
	
	if(pc.hasVagina()) vagIndex = rand(pc.totalVaginas());
	if(pc.hasCock()) cockIndex = rand(pc.cockTotal());
	
	seraSexXXXGetRidden([1, vagIndex, cockIndex]);
}
public function seraSexXXXGetRidden(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var dildoSize:Number = 300;
	var pageNum:int = arg[0];
	var vagIndex:int = arg[1];
	var cockIndex:int = arg[2];
	
	// Female/Genderless
	if(cockIndex < 0)
	{
		// First
		if(flags["SERA_FACE_RIDE_TRAINING"] == undefined)
		{
			if(pageNum == 1)
			{
				output("<i>“Mistress.”</i>");
				output("\n\n<i>“You’re in luck pet,”</i> Sera purrs. She rises and sashays over to your kneeling form, touching a flawless purple thigh as she runs her claws through your [pc.hair]. <i>“I need my female side tended to today. I’m sure your tender little butthole is glad to hear about that. Unfortunately, you don’t have the common courtesy to have a dick I can ride raw.”</i>");
				// Emasculated:
				if(vagIndex >= 0 && flags["SERA_CREATE_VAG"] != undefined) output(" She raises an eyebrow at you and you blush deeply, your thoughts and hers running the same way. <i>“Perhaps I got a bit carried away when I was reshaping you, hmm?”</i>");
				output(" She sighs and clasps your shoulders, bringing her round, infernal face close to yours.");
				output("\n\n<i>“Don’t fret over it, though. Your mistress thinks of everything.”</i> She reaches over to the counter, plucks a small remote control off it and points it at the front of the shop. The lock clicks and the windows go dark, except for deep blue neon signage on one, blinking on and off. It looks like the glass has turned one way, but... you squint at the sign as Sera continues to rummage around behind you. SNIM 03 NI KCAB – TULS A GNIOD, blears back at you blandly. It’s accompanied by two line figurines, repeating a vigorous action with every second blink. Both the figurines have smiley faces. The one that isn’t on all fours has two curly lines over its head.");
				output("\n\nSomething claps down behind you and you jump. Sera has put her chair down in the center of the room. Tapping impatiently against her thigh is what looks like a long, purple double dildo with a harness built into it halfway down, evidently designed to fuck the wearer whilst they themselves are fucking. One end is relatively modest, a smooth six inches; the other is monstrous, roughly the same size and length as Sera’s dick itself. Only Sera’s doesn’t have round nodules all the way down.");
				output("\n\n<i>“It’s one of my favourite pieces of gear, this,”</i> says Sera lovingly. <i>“So many good features.");
				if(!pc.isNude()) output(" Take your clothes off.");
				output("”</i>");
				if(!pc.isNude()) output(" Slowly you do as she asks, discarding your [pc.gear] onto the floor.");
				output(" You can’t take your eyes off the fearsome piece of equipment as it slowly rises and falls into the succubus’s thigh, making her flesh ripple. It’s clear what end she intends for you, and the thought makes blood rush to your skin. Without instruction you slowly sink down to the floor, spreading your [pc.hips], exposing your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(". Sera laughs to herself softly.");
				output("\n\n<i>“Oh, bitch. So naive. Come sit here.”</i> Confused, you do as she directs, shuffling into the chair so your back is pressed into its two front legs. Your mistress presses her hot palm against your forehead, pushing it back so it is lying on the seat. It is only then, as she brings the double dildo over, the plastic harness slithering onto your face, that you understand.");
				output("\n\n<i>“Oh do be quiet pet,”</i> Sera sighs exasperatedly as your gasp is muffled by a vast amount of thick, bumpy latex. <i>“This is all for your own good and I’m going to be giving you important instructions, so try and keep your cries for mercy to a minimum for once, ok?”</i> The dildo almost completely fills your mouth, touching the front of your throat. You can breathe... just. Air hisses through your nose as Sera buckles your head securely to the seat of the chair, leaving the other half of the strap-on pointing at the ceiling. You stare up at it as Sera clacks away, swaying her hips. The only light in the room now is the flickering candles and the intermittent blare of blue light from the window, but you can make out the logo inscribed on the upper half: VAPUWARE. You reach out and touch it, tracing the words as your tongue moves around the smooth synthetic flesh in your mouth.");
				output("\n\nA pulpy tail spade slaps into the back of your hand. Sera stands over you, smiling cruelly, her curvy form lit by the syncopated stun of cold neon behind her. There are blunt, indistinct objects in her hands.");
				output("\n\n<i>“Put them behind the chair legs.”</i> Slowly, you do as she asks, curling your fingers around the back of them.");
				// >12” inches stolen:
				if(flags["SERA_INCH_STEAL"] >= 12) output(" Sera’s grin splits wider as she steps over your [pc.legs] and wiggles her butt, allowing her extremely long tail to do the work, slithering around your form and the chair to tighten around your wrists, leaving you tied and pressed helpless into the hard wood, your neck bent back helplessly. <i>“Your tax inches in action, sissy,”</i> she breathes.");
				// Otherwise:
				else output(" She bends down and, with a firm click, handcuffs you to the back of the chair. You are left tied and strapped helpless into the hard wood, your neck bent back, your [pc.chest] exposed.");
				if(vagIndex >= 0)
				{
					output(" You give out a muted moan as something warm and thrumming is nestled into the entrance of your vagina. Sera plays with your sensitive [pc.vaginaColor " + vagIndex + "] [pc.vaginaNoun " + vagIndex + "] slowly until your [pc.clit] is bulging well out of its hood before shoving the squat vibrator all the way in to your moistened pussy.");
					pc.cuntChange(vagIndex, dildoSize);
				}
				else
				{
					output(" You cringe but cannot resist as the blunt tip of a cone enters your [pc.anus]; you seize up and writhe slightly as she screws the butt plug in, your entrance stretched, the two insertions pressing into each other through your sensitive walls.");
					pc.buttChange(dildoSize);
				}
				output("\n\n<i>“There we go, dear,”</i> Sera sighs as she sits her warm, purple flesh down north of your collarbone, near the erection she has used your mouth to project vertically over the chair. <i>“Something in all of your slut holes.");
				if(vagIndex < 0) output(" The important ones, anyway.");
				output("”</i> She sidles in closer, holding the back of the chair to lead her moist pussy up your chin, immersing your lower lip with the texture of it. <i>“So even when I’m riding you you’re learning how to take it, nice and hard.”</i> She raises herself up the dildo slowly, sliding it over her visibly bulging clit, sighing as it bends into her wetness before enveloping it with a harsh gasp, sitting down on your face hard.");
				
				processTime(35);
				pc.lust(10);
				clearMenu();
				addButton(0, "Next", seraSexXXXGetRidden, [2, vagIndex, cockIndex]);
				return;
			}
			if(pageNum == 2)
			{
				output("The chair creaks briskly as she grasps the back of it and begins to thrust into you, riding her end with rhythmic rotations of her lower body. Her thighs tighten and jounce into your ears, occasionally blocking out all sound but her soft flesh impacting into your head. She seems to have angled the chair back towards her a bit, reducing the strain on your neck, but that’s really the least of the things occupying your attention.");
				if(vagIndex >= 0) output(" The teasing vibrations in your [pc.vagina " + vagIndex + "] shudder against the thick, obdurate plug in your [pc.anus], making you quiver with the intensity of it.");
				else output(" The teasing vibrations in your [pc.anus] shudder through you, making you quiver with the intensity of it.");
				output("\n\nYou grasp the chair legs with your helpless hands as Sera begins to ride you harder, her juices beginning to dribble maddeningly down your cheeks. You are forced to look up at her writhing front, her flat abdomen pushing into your nose, her turgid cock batting against the chair back, her high breasts bouncing with each clench of her thighs. She looks back at you above it all, smiling back exultantly.");
				output("\n\n<i>“Are you sucking, pet?”</i> You try and register disbelief with your eyes. It’s filling your mouth, isn’t it? <i>“You aren’t sucking properly,”</i> she says softly, brushing a nipple as she lays her hand on your brow again. <i>“This harness is designed to let your mistress know when you’re slacking on your blowjob training. WORSHIP that big piece of meat in your mouth. You and I will both know when you’re doing it right.”</i>");
				output("\n\nYou groan slightly, her female musk dense in your nose, and try and do as she asks; hollowing your cheeks to knead the girthy dildo strapped into your face, equally merciless and obdurate PVC boring into you below and the pliant weight of her butt and thighs bouncing into you from above. You are convinced forcing you to do this is simply sadism on the part of Sera – until the thing suddenly shakes slightly in your mouth and she squeals with joy.");
				output("\n\n<i>“You’re getting it, don’t stop, don’t stop!”</i> she cries out, tightening her hips crushingly around your head. Breath whistling through your nose, you attack the obscene gobstopper filling your mouth, running your tongue along its length and shifting your lips around its base. It seems to be glowing with warmth now, and apparently powered by your ministrations, the upper end is now shaking and twisting, elevating Sera’s excitement into a euphoric froth.");
				output("\n\nYou feel battered, dazed and extremely warm as she rides you as hard as she can, clattering and jarring the chair as she growls with guttural enjoyment, smearing your face with her juices as she thrusts down hard. You’d be worried about her breaking it if you weren’t so worried about yourself. Valiantly, you ignore the softness thrashing around your head to surround the synthetic cock with your wet flesh, kneading as vigorously as you can; as best you can tell this causes the other end to begin to shudder violently. Claw-tipped fingers grip your [pc.hair] and hold painfully tight as Sera cums, howling at the ceiling as her pussy seizing up around the ecstatic vibrations you’ve filled it with.");
				output("\n\nYour eyes open wide as you feel the tip of your end bulge. Before you have time to think it suddenly unloads thick, sweet liquid down your gullet. Good grief, what an absolutely disgusting feature! It fills you with... with... you moan, heat sweeping through you as the dildo’s juice hits your stomach, your [pc.nipples] suddenly");
				if(pc.hasCuntNipples() || pc.hasLipples()) output(" wetting themselves deliriously");
				else output(" standing out on end");
				output(". Arousal crowds your mind, blotting out everything, and your own muffled cries join those of your mistress’s as you are pushed to an overwhelming orgasm, thrashing your [pc.legs] around and straining against your bonds as your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(" pulses again and again around the vibrator shoved up it.");
				output("\n\nYou look up at your mistress when you are done, utterly melted. Still embedded on your shared dildo, she grins down at you, radiating satisfaction.");
				output("\n\n<i>“Good, isn’t it?”</i> she whispers. <i>“Suck it good and it will make your mistress cum. Make your mistress cum and it will blow a nice, thick load of aphrodisiac down your throat. So...”</i> She slides her fingers through your [pc.hair] again and shifts slightly, her beading pussy sliding across your [pc.lips]. <i>“Ready for round two?”</i> You answer by opening wide and swallowing the warm, thick prosthetic up to its base, humming happily as you do.");
				output("\n\nBlue light flashes over your strange, conjoined forms as Sera rides you to a second orgasm. It takes her longer to get there this time – she spends a time idly simmering, swivelling her hips tortuously slow in a post-orgasm haze – but as you dutifully suckle your end the vibrations begin to buzz through her again and she fucks into your face with increasing urgency. You accept her soft weight bouncing aggressively onto you, knowing that this is simply a sign your own reward is fast approaching.");
				output("\n\nYou lave the underside of the broad, warm prosthetic closely with your tongue, making succulent smacking sounds as you french it, your drool mingling with your mistress’s juices on your face; you can feel the way this makes the other end thrash like a landed fish. Sera groans harshly, taking your head in her hands again and thrust down hard deliberately again and again. Your coo is drowned out by a fresh deluge of sweet ejaculate, washing away everything but orgasmic bliss as it spreads through you");
				if(vagIndex >= 0) output(", your [pc.vagina " + vagIndex + "] spurting around its insertion as you seize up around it and your butt plug ecstatically.");
				else output(", your [pc.anus] clenching up around its insertion ecstatically.");
				output("\n\nSera pools onto the floor when she’s done, spending a luxurious amount of time regaining her breath and enjoying her haze before returning to you. You slither down next to her when she finally unties you and removes all of your insertions, throbbing with satisfaction, your face glazed with your mistress’s juices. She puts an arm around you and draws you into her musk and heat.");
				output("\n\n<i>“Eventually dear,”</i> she breathes, <i>“I am going to get you so good at this that you’ll get an ‘O’ as sweet and round as your mouth every time I feel the need to empty my balls down your throat. Won’t that be nice?”</i> To your blissed out mind, this sounds like everything you’ve ever wanted.");
				
				processTime(35);
			}
		}
		// Repeat
		else
		{
			if(pageNum == 1)
			{
				output("<i>“Mistress.”</i>");
				output("\n\n<i>“You’re in luck pet,”</i> Sera purrs. <i>“I need my female side tended to today.”</i> Click. The door locks, the windows go dark and the deep blue neon comes on. In its syncopated light you watch Sera stand. <i>“So you know what that means.”</i> You feel a shuddering thrill as you see the object in her hand; a long, asymmetrical double dildo, with a harness halfway down.");
				output("\n\nSera picks up her chair and claps it down in the center of the room. She turns and nods at it with a smirk. She watches, gently tapping the toy into her thigh, flesh gently rippling with each impact as you");
				if(!pc.isNude()) output(" slowly take your [pc.gear] off,");
				output(" crawl across and sit your naked back against its front legs. You sigh shakily as you feel your mistress’s hot palm against your forehead, pushing it back so it is lying on the seat, obediently opening your mouth as the big end of the dildo looms above you. Thick, bumpy synthetic cock s pushed past your [pc.lips]; it almost completely fills your mouth, touching the front of your throat. You can breathe...just. Air hisses through your nose as Sera buckles your head securely to the seat of the chair, leaving the other half of the strap-on pointing at the ceiling. You stare up at it as Sera clacks away, swaying her hips. The only light in the room is the flickering candles and the intermittent blare of blue light from the window. ");
				output("\n\nAs you hear stilettos tapping back towards you, you curl your fingers around the back legs of the chair in preparation. Sera still can’t help flicking her tail across your body, flicking your [pc.nipples] and make you twitch.");
				// >12” inches stolen:
				if(flags["SERA_INCH_STEAL"] >= 12) output(" She steps over your [pc.legs] and wiggles her butt, allowing her extremely long tail to do the work, slithering around your form and the chair to tighten around your wrists, leaving you tied and pressed helpless into the hard wood, your neck bent back helplessly. <i>“Your tax inches in action, sissy,”</i> she breathes.");
				// Otherwise:
				else output(" She bends down and, with a firm click, handcuffs you to the back of the chair. You are left tied and strapped helpless into the hard wood, your neck bent back, your [pc.chest] exposed.");
				output(" You give out a muted moan as something warm and thrumming is nestled into the entrance of your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(". Sera plays with");
				if(vagIndex >= 0)
				{
					output(" your cunt slowly until your [pc.clit] is bulging well out of its hood before shoving the squat vibrator all the way in to your moistened pussy.");
					pc.cuntChange(vagIndex, dildoSize);
				}
				else
				{
					output(" you teasingly. You cringe but cannot resist as the blunt tip of a cone enters your [pc.anus]; you seize up and writhe slightly as she screws the butt plug in, your entrance stretched, the two insertions pressing into each other through your sensitive walls.");
					pc.buttChange(dildoSize);
				}
				output("\n\n<i>“There we go, dear,”</i> Sera sighs as she sits herself down north of your collarbone, near the erection she has forced you to hold with your mouth over the chair. <i>“Something in all of your slut holes.");
				if(vagIndex < 0) output(" The important ones, anyway.");
				output("”</i> She sidles in closer, holding the back of the chair to lead her moist pussy up your chin, immersing your lower lip in the texture of it. You can smell and taste her piquant excitement as she exults in your helpless, bound form. <i>“So even when I’m riding you you’re learning how to take it, deep and hard.”</i> She raises herself up the dildo slowly, sliding it over her visibly bulging clit, sighing as it bends into her wetness before enveloping it with a harsh gasp, sitting down on your face hard.");
				
				processTime(25 + rand(11));
				pc.lust(10);
				clearMenu();
				addButton(0, "Next", seraSexXXXGetRidden, [2, vagIndex, cockIndex]);
				return;
			}
			if(pageNum == 2)
			{
				output("The chair creaks briskly as she grasps the back and begins to thrust into you, riding her end with rhythmic rotations of her lower body. Her thighs tighten and jounce into your ears, occasionally blocking out all sound but her soft flesh impacting on your head. She seems to have angled the chair back towards her a bit, reducing the strain on your neck but that’s the least of the things occupying your attention.");
				if(vagIndex >= 0) output(" The teasing vibrations in your [pc.vagina " + vagIndex + "] shudder against the thick, obdurate plug in your [pc.anus], making you quiver with the intensity of it.");
				else output(" The teasing vibrations in your [pc.anus] shudder through you, making you quiver with the intensity of it.");
				output(" You grasp the chair legs with your helpless hands as Sera begins to ride you harder, her juices beginning to dribble maddeningly down your cheeks. You are forced to look up at her writhing front, her flat abdomen pushing into your nose, her turgid cock batting against the chair back, her high breasts bouncing with each clench of her thighs. She looks back at you above it all, smiling back exultantly.");
				output("\n\n<i>“You know what you should be doing, pet. WORSHIP that big piece of meat in your mouth. You and I will both know when you’re doing it right.”</i> You get to work, hollowing your cheeks to suckle at the girthy dildo strapped into your face, working warmth into it as equally merciless and obdurate PVC boring into you below and the pliant weight of her butt and thighs bouncing into you from above. The thing shakes slightly in your mouth and she squeals with joy.");
				output("\n\n<i>“You’re getting it, don’t stop, don’t stop!”</i> she cries out, tightening her hips crushingly around your head. Breath whistling through your nose, you attack the obscene gobstopper filling your mouth, running your tongue along its length and shifting your lips around its base. It seems to be glowing with warmth now, and powered by your ministrations, the upper end is now shaking and twisting, elevating Sera’s excitement into a euphoric froth.");
				output("\n\nYou feel battered, dazed and extremely warm as she rides you as hard as she can, clattering and jarring the chair as she growls with guttural enjoyment, smearing your face with her juices as she thrusts down hard. You’d be worried about her breaking it if you weren’t so worried about yourself. Valiantly, you ignore the thrashing around about your head to surround the synthetic cock with your wet flesh, kneading it as vigorously as you can; as best you can tell this causes the other end to shudder violently. Claw-tipped fingers grip your [pc.hair] and hold painfully tight as Sera cums, howling at the ceiling as her pussy seizing up around the ecstatic vibrations you’ve filled it with. You feel the tip of your end bulge. Blissfully you close your eyes as it unloads thick, sweet liquid down your gullet, moaning as heat sweeps through you when the dildo’s juice hits your stomach. Your [pc.nipples] suddenly stand out on end/wet themselves deliriously and arousal crowds your mind, blotting out everything. Your own muffled cries join those of your mistress’s as you are pushed to an overwhelming orgasm, thrashing your [pc.legs] around and straining against your bonds as your");
				if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
				else output(" [pc.anus]");
				output(" pulses again and again around the vibrator shoved up it.");
				output("\n\nYou look up at your mistress when you are done, utterly melted. Still embedded on your shared dildo, she grins down at you, radiating satisfaction.");
				output("\n\n<i>“Good, isn’t it?”</i> she whispers. <i>“Suck it good and it will make your mistress cum. Make your mistress cum and it will blow a nice, thick load of aphrodisiac down your throat. So...”</i> She slides her fingers through your [pc.hair] again and shifts slightly, her beading pussy sliding across your [pc.lips]. <i>“Ready for round two?”</i> You answer by opening wide and swallowing the warm, thick prosthetic up to its base, humming happily as you do.");
				output("\n\nBlue light flashes over your strange, conjoined forms as Sera rides you to a second orgasm. It takes her longer to get there this time – she spends a time idly simmering, swivelling her hips tortuously slow in a post-orgasm haze – but as you dutifully suckle your end the vibrations begin to buzz through her again and she fucks into your face with increasing urgency. The deep, dirty eroticism of being used like this whilst pleasure is forced into you is compounded by the satisfaction you know you’re providing your mistress; the way she looks down at you from her position of power at you and coos indulgently, the soft weight of her butt and thighs piling and squeezing into you harder and harder, heightens your arousal.");
				output("\n\nYou lave the underside of the broad, warm prosthetic closely with your tongue, making succulent smacking sounds as you french it, your drool mingling with your mistress’s juices on your face; you can dimly feel the way this makes the other end thrash like a landed fish. Sera groans harshly, taking your head in her hands and thrust down deliberately hard again and again. You coo is drowned out by a fresh deluge of sweet ejaculate, washing away everything but orgasmic bliss as it spreads through you,");
				if(vagIndex >= 0) output(" your [pc.vagina] spurting around its insertion as you seize up around it and your butt plug");
				else output(" your [pc.anus] seizing up around its insertion");
				output(" ecstatically.");
				output("\n\nSera pools onto the floor when she’s done, spending a luxurious amount of time regaining her breath and enjoying her haze before return to you. You slither down next to her when she finally unties you and removes all of your insertions, throbbing with satisfaction, your face glazed with your mistress’s juices. She puts an arm around you and draws you into her musk and heat.");
				output("\n\n<i>“Eventually dear,”</i> she breathes, <i>“I am going to get you so good at this that you’ll get an ‘O’ as sweet and round as your mouth every time I feel the need to empty my balls down your throat. Won’t that be nice?”</i> To your blissed out mind, this sounds like everything you’ve ever wanted.");
				
				processTime(25 + rand(11));
			}
		}
		pc.orgasm();
	}
	// Male/Herm
	else
	{
		output("<i>“You’re in luck pet,”</i> Sera purrs. She rises and sashays over to your kneeling form, touching a flawless purple thigh as she runs her claws through your [pc.hair]. <i>“I need my female side tended to today. I’m sure your tender little butthole is glad to hear about that.”</i> She turns around to reach over to the counter, giving you a good look at her trim, bare pussy with its prominent clit, framed by her black harness straps. She retrieves a small remote control and points it at the front of the shop. The lock clicks and the windows go dark, except for deep blue neon signage on one, blinking on and off. It looks like the glass has turned one way, but... you squint at the sign as Sera continues to rummage around behind you. SNIM 03 NI KCAB – TULS A GNIOD, blears back at you blandly. It’s accompanied by two line figurines, repeating a vigorous action with every second blink. Both the figurines have smiley faces. The one that isn’t on all fours has two curly lines over its head.");
		output("\n\nSomething claps down behind you and you jump. Sera has put her chair in the center of the room.");
		output("\n\n<i>“");
		if(!pc.isNude()) output("Take your clothes off and sit.");
		else output("Sit.");
		output("”</i>");
		if(!pc.isNude()) output(" She watches you as you do this, slowly discarding your [pc.gear] before seating yourself.");
		output(" The cold wood makes goosebumps crowd your skin as Sera slowly approaches, swinging her hips exaggeratedly. They stand out even more when a blare of neon light allows you to see what is swinging in one of her hands.");
		output("\n\nShe sits herself down in your lap with a sigh, pushing her pillowy breasts into your front as she reaches behind you. Her slightly spicy, warm scent inundates you as she takes each of your hands and handcuffs them securely to the chair legs. With your arms forced downwards at full stretch your [pc.chest] is helplessly pushed outwards. You try to keep your breathing level as Sera shifts her soft but considerable weight on top of your [pc.hips], gently grazing your throat with her claws, then your [pc.nipples], leading her hands down inexorably to your groin. You exhale slowly as her palm encircles your semi-erect [pc.cockNoun " + cockIndex + "].");
		if(pc.cocks[cockIndex].cLength() < 6) output("\n\n<i>“I’m really going to have to ride you hard in order to get anything out this little thing,”</i> she sighs. If she’s dispirited by the prospect she’s doing a very good job of disguising it. She stares into your eyes gloatingly as she coils you tighter, the smooth dry pressure making you ragingly erect. <i>“May wind up breaking your pelvis I’m gonna squeeze your boy clit so bad. You’re alright with that, right?”</i>");
		else output("\n\n<i>“What a polite and eager beta dick,”</i> she coos. She stares into your eyes gloatingly as she coils you tighter, the smooth dry pressure making you ragingly erect. <i>“Do you try and impress all the naive native girls and guys with this when you’re out on the frontier? I hope you make it clear to them who it really belongs to.”</i>");
		output("\n\nShe flexes her wrist more and more vigorously, drawing your [pc.cock " + cockIndex + "] out in a winch of warm, wringing friction. You open your mouth and grip the chair legs with your trapped hands as your sex bulges and strains to the movement of her hand. You can’t pull away, can’t do anything to stop her, and you can’t stop your orgasm rising upwards... you cry out as something suddenly clamps down tightly around the base of your fierce erection.");
		output("\n\n<i>“There we go,”</i> says Sera briskly, gently flicking your helplessly stiff prick, trapped by the cock ring she has placed at the base of it. She shifts herself forward, encircling your waist with her thick thighs, sliding her arm around your neck, kissing your snared erection with her labia. <i>“It’d be terrible if you came like a spineless sissy the second my pussy touched you, wouldn’t it? It’s good you’ve got your mistress to plan ahead. So she can make use of you again, and again, and again.”</i> So saying, she leads her moistened sex up the sensitive underside of your [pc.cock " + cockIndex + "], and after gently teasing its swollen head for a moment with her entrance, sits down hard, swallowing you whole.");
		output("\n\nShe rides you with luxuriant rolls of her hips, her hot, purple flesh rippling up your bound body with each push, her pussy milking you assiduously. Her fuck-cave is long yet incredibly tight, gloving you easily and clenching every inch. She grips your head between her breasts as she screws you, bending your [pc.cock " + cockIndex + "] backwards in the succulent grip of her sex. You dare enough initiative to shift your head over her pillowy softness to find a hard nipple, surrounding it with your [pc.lips] and lapping at the erect nub; you are rewarded with a pleased, husky growl and a pick up of the pace.");
		output("\n\nSera’s tumescent cock and flat abdomen slap into your tummy, her toned pussy squeezing you almost painfully close with every returning pump of her hips. Melded beneath her you find yourself fretfully pushing upwards into her with the shallow amount of movement available to you, the frenetic sex made unbearably good by your bound state, your back arching as you tense against your handcuffs.");
		output("\n\nShe gasps and then buries her sharp teeth into your shoulder, hips tightening around your waist as her pussy spasms around your [pc.cock " + cockIndex + "], her juices rolling down your [pc.hips]. Dizzy with her scent, warmth and delicious clenching you want nothing more to join her in orgasm, to pack her cunt with your cum, and you desperately rock yourself upwards – to no avail. Whatever she’s clamped around your cock has you well and truly trapped. You are left to roll your eyes and head back as the waves of female flesh roll over you, the exquisite pleasure kneading your manhood contrasting with the pain locked into the soft part of your shoulder, your mistress’s heavy breath hissing out of her nose and down your back.");
		output("\n\nYou are brought out of your stunned state by another pain, more acute and directed, seizing one of your [pc.nipples]. You jerk your head back up to look into Sera’s wicked gaze.");
		output("\n\n<i>“I know what you were trying to do there,”</i> she says in a teasing, lilting voice, domineering cruelty prowling through her relaxed, post-orgasm tones. <i>“And you are a bad pet for attempting it. You cum when your owner says you can. That understood?”</i> She pinches your nipple again, making you spasm; your [pc.cock " + cockIndex + "] still embedded in her wet depths, your sudden jerk of movement makes her coo.");
		output("\n\n<i>“Yes, mistress!”</i>");
		output("\n\n<i>“Good,”</i> Sera murmurs. <i>“Now let’s see if you can make up for your slutty behavior by being an obedient and attentive [pc.boy] toy now.”</i> You groan lowly as she begins to thrust into you again.");
		output("\n\nIn the slow blink of the blue light she rides you insensate, rocking herself to two further highs. You think. It stops mattering to you after a while; there is only your bulging, sensitized cock and her ruthless use of it, her cock ring keeping you singing on edge as surely as the metal around your wrists keeps you secured to the rocking, jerking chair. Whenever you begin to zone out and lose yourself completely to the wringing wetness she plays with your [pc.nipples], making you twitch and spasm in her pussy in a way which is evidently pleasing to her. To get her sharp nails away from your reddened teats you go back to her own nipples, attending to her pert and high breasts with your tongue in a way you hope she will enjoy enough to give you release.");
		output("\n\nShe pauses for one blissful moment a long time later, sliding her fingers");
		if(pc.hasHair()) output(" through");
		else output(" across");
		output(" your [pc.hair] as you suckle her, panting slightly.");
		output("\n\n<i>“End,”</i> she says thickly. Confusion is swiftly overrun by ecstasy as heat suddenly grips the base of your snared dick, vibrations thrumming through it. Your");
		if(pc.balls > 0)
		{
			if(pc.balls == 1) output(" [pc.ball] tightens as your");
			else output(" [pc.balls] tighten as your");
		}
		output(" long denied orgasm begins to rise. Sera’s thighs and pussy pulse around you fervently as she fucks herself to her final high; you jolt upwards with cramped movements in response, elated you are finally going to reach one yourself. Your seed builds as you fly over the point of no return...");
		output("\n\nSomething taps distinctly into your groin, and your heat immediately begins to dissipate. No! God no! You’re already there, your cock is bulgingly full of your seed, and... it’s gone. Slowly, agonisingly, the wonderful, mind-blowing high which has been just out of reach this entire time recedes, like a slowly approaching tide of wine lapping at your toes before ebbing away. On top of you Sera cries out exultingly, her breasts pushing into your [pc.chest] as she grips you tight and reaches it again, her pussy glazing your [pc.hips] as she kneads your useless dick for all it is worth.");
		output("\n\nWhen it is finally over, and she has spent a time regaining herself on your lap, she grins at you lazily and slides off. Still handcuffed to the chair, you can do nothing as she grips your [pc.cock " + cockIndex + "] and carefully points it downwards. You moan long and low as a small waterfall of cum oozes warmly out onto the floor.");
		output("\n\n<i>“There we go,”</i> she says happily. <i>“You served your mistress well, and we got all that nasty spooge out of you. Everyone’s happy, right?”</i> You stare at her dully, soaked in sweat, unable to speak as she removes the cock ring, waggling it teasingly in front of you. The monstrous device is chrome, glowing with a steady, inward red pulse. The demon girl strokes your jaw comfortingly.");
		output("\n\n<i>“Bitches cum from taking, not giving,”</i> she breathes, looking down at you heavy-lidded with carnal satisfaction. Blue light highlights her incredible form in flashes; without the light all you can see are her eyes and phosphorescence. <i>“You should know that by now. Thank your mistress for being kind enough to drain you.”</i> Experience tells you that she is more than capable of simply leaving you here, and your arms are beginning to ache.");
		output("\n\n<i>“Th-thank you, mistress.”</i> White teeth reveal themselves in a wicked grin.");
		output("\n\n<i>“Good [pc.boy].”</i> The handcuffs and chair disappear, and you pool onto the floor, exhausted and reddened with thwarted arousal. You’re still pulling your [pc.gear] back on when the inside lights flick back into being. Sera has gone back to flicking through her touch pad device as if nothing happened... the only difference being the big, contented smile on her face now.");
		
		processTime(35 + rand(11));
		// Cum reset, lust +10
		pc.ballFullness = 0;
	}
	pc.loadInMouth(chars["SERA"]);
	pc.girlCumInMouth(chars["SERA"]);
	pc.lust(20);
	sera.orgasm();
	IncrementFlag("SERA_FACE_RIDE_TRAINING");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}

// Titfuck/Vaginal or Anal + Lucky Dip
public function seraSexXXXTitfuckLuckyDipStart():void
{
	var vagIndex:int = -1;
	var cockIndex:int = -1;
	
	if(pc.hasVagina()) vagIndex = rand(pc.totalVaginas());
	if(pc.hasCock()) cockIndex = rand(pc.cockTotal());
	
	seraSexXXXTitfuckLuckyDip(["intro", vagIndex, cockIndex]);
}
public function seraSexXXXTitfuckLuckyDip(arg:Array):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	var response:String = arg[0];
	var vagIndex:int = arg[1];
	var cockIndex:int = arg[2];
	
	if(response == "intro")
	{
		output("<i>“Mistress.”</i>");
		output("\n\nSera rises from her chair and quickly clacks over to you. Her expression - usually some combination of malevolence, cupidity and schadenfreude - is one of pure glee. ");
		output("\n\n<i>“What a day this is,”</i> she says, gripping your shoulders tightly. <i>“Not only do I make a massive sell, but my favorite toy walks through the door immediately afterwards for me to reward myself with!”</i> Her hands are moving as she speaks, reaching underneath your [pc.gear], impatiently shucking it off you. It’s difficult not to be carried along with the exuberance in your mistress’s face and you find yourself aiding her, fumbling your clothes off until you’re knelt naked in front of her impossibly curvy form. She steps back for amount, idly fondling her semi-erect 12 inch cock as she considers you. ");
		// If B cup or below:
		if(pc.biggestTitSize() <= 2)
		{
			output("\n\nShe trails her claws across your bare chest, lightly touching your [pc.nipples] before, with a lusty grin, slapping you in the face with her pendulous male sex. You sigh with mocking exasperation as you grasp it and begin to shift your grip up and down her meat.");
			output("\n\n<i>“Don’t pretend you don’t enjoy it,”</i> she murmurs as you skillfully jerk her, undulating your fingers up her sensitive raphe as you press your palm closely into the top side, coiling her more and more vigorously as the flesh beneath your hand gets hotter and harder, pointing further and further up. Her bulbous end seems to grow in size, her wet cum-slit dilating, and you give it a gentle, teasing lick, the sharp, musky flavor of her in your mouth and nose stoking your own arousal.");
			output("\n\nShe pushes herself into you a moment later, urging you to rise silently. Her big, pert breasts flattening against your [pc.chest], hissing quietly into your ear as she urgently turns you, bends you over the counter, grips your hands behind your back and finally slides her fully recovered erection between your butt-cheeks. It’s clear she’s not interested in her usual theatrics - simply the base, gleeful use of you for her own gratification. Still, she finds time to test you,");
			if(vagIndex >= 0)
			{
				output(" pushing her fingers into your [pc.vagina " + vagIndex + "], curling over your [pc.clit], curling at you briskly until you are");
				if(pc.isSquirter(vagIndex)) output(" dribbling moisture");
				else output(" eagerly beading");
				output(" to her movements.");
			}
			else output(" pushing her thumb into your [pc.anus], waiting until you relax before briskly working you loose.");
			output(" Her bulging head presses against your entrance.");
		}
		// If C cup or above:
		else
		{
			output("\n\nA lusty grin splits her face as her yellow eyes fall on your [pc.chest]. She slides her hand all the way down to the base of her dick and swings it forward, landing it with a slap between your breasts. She hasn’t said a word but it doesn’t take a genius to work out what she’s looking for. You smile up at her coquettishly as you wrap your hands around your [pc.skinColor] softness and press it into her hot, stiff length. Sera hums with approval, looking into your eyes as she tightens her grip on your shoulders, slowly beginning to pump into the sleeve of boob-flesh you’ve created. The sharp, musky smell of her pre is in your nose as her thick, purple meat pushes demandingly towards your face.");
			output("\n\nIt’s clear she’s not interested in her usual theatrics - simply the base, gleeful use of you for her own gratification. As she gets more and more into the smooth friction she has found between your [pc.chest] her hands move downwards, following the curve of your rippling boobs, landing for a moment on your hands before sliding inwards to touch your [pc.nipples].");
			if(pc.bRows() == 1)
			{
				output("\n\n");
				if(pc.hasCuntNipples() || pc.hasLipples()) output("You sigh as she runs her finger-pads around their sensitive lips, then squeak as she ruthlessly buries her thumbs into them up to the quick, stroking their insides insistently. Acute pleasure shivers through you");
				else output("You sigh and then squeak when she first rubs your erect nubs between thumb and forefinger before squeezing them ruthlessly hard, sending acute pleasure shivering through you");
				if(vagIndex >= 0) output(", your [pc.vagina " + vagIndex + "] moistening");
				else if(cockIndex >= 0) output(", your [pc.cock " + cockIndex + "] hardening");
				output(".");
			}
			else
			{
				output("\n\nHer grin widens as her fingers sink down still further to grip your [pc.breasts " + 0 + "]. She plays with your second set of nipples for a time, sending acute pleasure shivering through you before gripping them between her fingers, squeezing your second pair of breasts ruthlessly hard, using them as leverage to fuck your top row with firm drives of her hips. You groan to the intensity of it, in turn pressing the boobs in your own hands into her rapidly moving prick.");
			}
		}
		if(pc.isLactating()) output("\n\nIt doesn’t take long underneath this fierce treatment for [pc.milk] to begin to dribble and squirt freely from your [pc.nipples], slicking Sera’s hands with the proof of the shameless enjoyment you’re taking from being titfucked. She giggles to herself softly at the sight and takes the time to rub her straining dick over each nipple, teasing your wet, delicate nubs at the same time as slathering her hardness with your own juices; then she slaps it between your [pc.chest] and begins to thrust into your presented rack again, going at you even harder now that she’s thoroughly lubricated both of you.");
		output("\n\nShe pants as she fucks your softness faster and faster, arching her head back and pushing her thick thighs into you as she rises towards her orgasm. The submissive notion of licking her bulging end as it presents itself between your pre-cum");
		if(pc.isLactating()) output(" and [pc.milk]");
		output(" slicked boobs dimly occurs to you, but she’s fucking you so frenetically it’s not even an option. She reaches down and");
		if(pc.hasCuntNipples() || pc.hasLipples()) output(" fingers");
		else output(" pinches");
		output(" your nipples intently as her slit dilates, so that your cries join hers as she orgasms; yours however are swiftly drowned out by the warm jizz which is fountained onto you with each upward thrust of hard meat between your [pc.chest]. Sera doesn’t stop until she has caked your face and much of your [pc.hair] with her glorious love, her final few spatters providing you with a presentable pearl necklace too.");
		
		processTime(15);
		pc.lust(15);
		clearMenu();
		addButton(0, "Next", seraSexXXXTitfuckLuckyDip, ["second", vagIndex, cockIndex]);
		return;
	}
	else if(response == "second")
	{
		if(pc.biggestTitSize() > 2)
		{
			output("She takes a few steps back to lean against the counter with a raspy sigh, her distended cock leaving a dribbled trail of cum on the floor as she goes. You lean back to gather yourself, the alabaster mess oozing down you, and raise a hand to wipe your face.");
			output("\n\n<i>“No.”</i> You freeze. You were expecting Sera to be lost in a warm, self-centered fuzz of her own but her eyes are open, gazing down at you: golden, playful and cruel. Cat’s eyes. <i>“I’m not done with you yet pet, and you look so much more... appropriate when you’re covered in my jizz. Come here, and prepare your mistress for the good, hard fucking she’s going to give you now.”</i> A warm shudder passes through you as, after a pause, you shift yourself over so you’re between her long legs and wrap one hand around her long, fluid-slicked shaft. Claw-tipped fingers urge you to rise, staying where they are to convex down your back and grip your [pc.ass] as you do whilst continuing to steadily jerk her.");
			output("\n\nShe leans back with a wide, lazy smile, enjoying the luxuriant refractory period you’re providing her with, drinking in your cum-creamed face whilst your grip gently shifts up and down her girth. Blushing, you look down from that gloating, infernally alluring visage, try to ignore the sensation of musky cream steadily oozing down your [pc.chest] and quickly hit on something to busy yourself with. You send your other hand burying beneath her warm, pliant thighs and touch the lips of her pussy. She hums with deep approval, pushing her thighs outwards so you can enter her, curling your fingers into her hot, moist depths as you continue to wring her male sex. In response she gets to work with her own hands, clutching your [pc.ass] tightly before moving inwards, penetrating your");
			if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
			else output(" [pc.anus]");
			output(", testing and loosening you.");
			output("\n\nSera may have been human once but her present physiology scorns the limitations her birthright would have given her. It takes little more than a minute for her cock to be bulging and erect again, pointing at you demandingly. She pushes herself into you, her big, pert breasts flattening against your [pc.chest], hissing quietly into your ear as she urgently turns you, bends you over the counter, grips your hands behind your back and finally slides her fully recovered erection between your butt-cheeks.");
			if(vagIndex >= 0)
			{
				output(" Your [pc.vagina " + vagIndex + "] has been anticipating this for some time now, her flavor rich in your mouth and nose, and it eagerly");
				if(pc.isSquirter(vagIndex)) output(" dribbles");
				else output(" beads");
				output(" moisture to the hot thickness sliding over your labia and [pc.clit].");
				
			}
			output(" Her bulging head presses against your entrance.");
			output("\n\n");
		}
		
		output("<i>“So, uh,”</i> trying to keep your voice steady. <i>“What was the big sell? Mistress?”</i> you add, for good measure. Sera pauses, as if slightly surprised by your question. Then she thrusts forwards, burying most of her huge cock into your");
		if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
		else output(" [pc.anus]");
		output(" with a single action. You arch your back and open your mouth, globs of cum flying off you, every cell in your nether regions attempting to grow accustomed to the massive intrusion.");
		
		if(vagIndex >= 0) pc.cuntChange(vagIndex, chars["SERA"].cockVolume(0));
		else pc.buttChange(chars["SERA"].cockVolume(0));
		
		//Randomised
		var TFItem:String = RandomInCollection(["Clippex", "Semen’s Friend", "Lucifier"]);
		if(flags["SERA_UNLOCK_CLIPPEX"] == undefined) TFItem = "Clippex";
		else if(flags["SERA_UNLOCK_SEMENS"] == undefined) TFItem = "Semen’s Friend";
		else if(flags["SERA_UNLOCK_LUCIFIER"] == undefined) TFItem = "Lucifier";
		
		output("\n\n");
		// Clippex:
		if(TFItem == "Clippex")
		{
			output("<i>“Someone bought a whole load of Clippex,”</i> she grunts. She saws into you, keeping her grip tight around your wrists, filling more and more of your tunnel with her alarmingly thick cock, bending it into your sensitive spots to make you tense up around her with involuntary pleasure. <i>“Grows your tits and particularly your nipples out, does crazy things with them if you keep taking it. Turns them into cunts, then mouths...</i> “ You are not capable of responding. Your hands grip the air and you suck skies of air into your mouth as she finds your limit and begins to thrust into you vigorously, her balls slapping into your [pc.hips], her length rubbing and stretching your tunnel acutely.");
			output("<i>“...pretty specialist transformation, expensive. Lucky to find someone willing to... ungh... buy so much.”</i> She stops talking for a while, concentrating on rutting you hard enough to make the counter shake, her thighs beating a soft percussion against your [pc.butt].");
			if(vagIndex >= 0) output(" Your stuffed [pc.vagina " + vagIndex + "] seeps juices around her cock deliriously.");
			else if(cockIndex >= 0) output(" Your [pc.cock " + cockIndex + "] one strains helplessly against your abdomen as she rides over your prostate again and again.");
			else
			{
				output(" Your [pc.anus]");
				if(pc.ass.wetness() >= 2) output(" seeps lubricant and");
				output(" up around her cock deliriously.");
			}
			output(" <i>“Thinking maybe I should give some to you?”</i> she husks finally. You feel her protuberant nipples touch your shoulders. <i>“Pets could always use more slut holes that need filling.”</i>");
		}
		// Semen’s Friend:
		else if(TFItem == "Semen’s Friend")
		{
			output("<i>“This guy bought a whole packet of Semen’s Friends,”</i> she says thickly. She saws into you, keeping her grip tight around your wrists, filling more and more of your tunnel with her alarmingly thick cock, bending it into your sensitive spots to make you tense up around her with involuntary pleasure. <i>“Increases the size of your balls, makes them more productive but does all sorts of other crazy stuff with your cum, too. Can turn it black. Can make it look and taste like chocolate.”</i> You are not capable of responding. Your hands grip the air and you suck skies of air into your mouth as she finds your limit and begins to thrust into you vigorously, her balls slapping into your [pc.hips], her length rubbing and stretching your tunnel acutely.");
			output("<i>“I regretted ordering it almost as soon as I clicked “Ok”. Who wants four testicles? Well... someone, obviously. So – goddamn – glad to have shifted it.”</i> She stops talking for a while, concentrating on rutting you hard enough to make the counter shake, her thighs beating a soft percussion against your [pc.butt].");
			if(vagIndex >= 0) output(" Your stuffed [pc.vagina " + vagIndex + "] seeps juices around her cock deliriously.");
			else if(cockIndex >= 0) output(" Your [pc.cock " + cockIndex + "] one strains helplessly against your abdomen as she rides over your prostate again and again.");
			else
			{
				output(" Your [pc.anus]");
				if(pc.ass.wetness() >= 2) output(" seeps lubricant and");
				output(" up around her cock deliriously.");
			}
		}
		// Lucifier
		else
		{
			output("<i>“I managed to sell almost my entire stock of Lucifier,”</i> she grunts. She saws into you, keeping her grip tight around your wrists, filling more and more of your tunnel with her alarmingly thick cock, bending it into your sensitive spots to make you tense up around her with involuntary pleasure. <i>“Wondered what I used to make me look like this? Does almost everything – the skin, the horns, the eyes... ”</i> You are not capable of responding. Your hands grip the air and you suck skies of air into your mouth as she finds your limit and begins to thrust into you vigorously, her balls slapping into your [pc.hips], her length rubbing and stretching your tunnel acutely.");
			output("<i>“...it’s popular on human colonies. Out here though – well, you try explaining to an alien its cultural significance. And frontier explorers steer clear of it because it... ungh... does things to your libido. Big things.”</i> She stops talking for a while, concentrating on rutting you hard enough to make the counter shake, her thighs beating a soft percussion against your [pc.butt].");
			if(vagIndex >= 0) output(" Your stuffed [pc.vagina " + vagIndex + "] seeps juices around her cock deliriously.");
			else if(cockIndex >= 0) output(" Your [pc.cock " + cockIndex + "] one strains helplessly against your abdomen as she rides over your prostate again and again.");
			else
			{
				output(" Your [pc.anus]");
				if(pc.ass.wetness() >= 2) output(" seeps lubricant and");
				output(" clenches up around her cock deliriously.");
			}
			output(" <i>“As I’m sure you’re getting a good appreciation of,”</i> she pants finally. You feel her protuberant nipples touch your shoulders. <i>“But it’s not so bad if you’ve got a whole load of slut to work it off on.”</i>");
		}
		
		output("\n\nTalking done, she uses the hand not holding your wrists back to pull your head back, squeezing it between her heaving breasts as she rams into you, filling you from stem to stern.");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG))
		{
			output(" Aware this is one of her favourite moves and ready for it, you slide your long, flexible tongue out of your open mouth and glide it across your skin and hers, flicking it over one of her erect nipples.");
			output("\n\n<i>“Oh – you – clever – fucking – [pc.boy]!”</i> she gasps, between slams of her hips into your ass.");
		}
		output("\n\nYour moans turn into cries of ecstasy as your");
		if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
		else output(" [pc.anus]");
		output(" clenches up around her unremitting sex and you orgasm helplessly");
		if(vagIndex >= 0) output(", your pussy quaking and wetting itself ecstatically");
		else if(cockIndex >= 0) output(", your prick surging lines of cum onto the counter as your prostate is mercilessly milked");
		else output(", your ass quaking ecstatically");
		output(". Sera fucks you with regal heedlessness throughout, keeping hold of your hands and head firmly so you are made to wriggle and spasm your high out impaled on her cock. Only when you are a quivering mess does she push to her own peak, hissing and groaning wordlessly as she embeds herself deep into your brutalized tunnel, her claws digging into you as her cock bulges and she pumps a new, thick, warm load into your depths. Your eyes roll as she fills your");
		if(vagIndex >= 0) output(" womb");
		else output(" intestines");
		output(" with her seed, pulling out after a series of deeply satisfied exhalations to spurt the last of it over your [pc.ass] and lower back.");
		output("\n\nThe succubus collapses back on to her chair, breathing heavily, satiated at last – for the next ten minutes or so, anyway. You pitch onto your side, soaked from head to bottom, panting hard yourself. She’s taking you in with heavy-lidded eyes - you, covered from head to toe in her cum, leaking more of it gently from your");
		if(vagIndex >= 0) output(" [pc.vagina " + vagIndex + "]");
		else output(" [pc.anus]");
		output(" – with an expression of profound contentment.");
		
		processTime(15);
		pc.orgasm();
		pc.loadInMouth(chars["SERA"]);
		if(vagIndex >= 0) pc.loadInCunt(chars["SERA"], vagIndex);
		else pc.loadInAss(chars["SERA"]);
		sera.orgasm();
		clearMenu();
		if(TFItem == "Semen’s Friend") addButton(0, "Semen’s?", seraSexXXXTitfuckLuckyDip, [TFItem, vagIndex, cockIndex], TFItem + "?", "Ask your mistress for some " + TFItem + ".");
		else addButton(0, TFItem + "?", seraSexXXXTitfuckLuckyDip, [TFItem, vagIndex, cockIndex], TFItem + "?", "Ask your mistress for some " + TFItem + ".");
		addButton(1, "Finish", seraSexXXXTitfuckLuckyDip, ["finish", vagIndex, cockIndex]);
		return;
	}
	else if(response == "Clippex" || response == "Semen’s Friend" || response == "Lucifier")
	{
		output("<i>“So, um... " + response + ",”</i> you say hesitantly. Sera gazes at you impassively. <i>“Do you think I could have some?”</i>");
		output("\n\n<i>“Interested in doing some bodywork, are we?”</i> she murmurs. Idle with post-coitus, she slides her chair back to consider your recumbent, ooze-covered form further. Her stilettos came loose during the vigorous sex; she slides a dainty, clipped foot out proper and circles her big toe at you teasingly. <i>“Your mistress thinks you look just fine as you are, candy-cheeks, and that’s all that matters. She wonders just how interested </i>you<i> really are.”</i>");
		
		processTime(1);
		// [Not interested] [Interested] [Perform]
		clearMenu();
		addButton(0, "Nah", seraSexXXXTitfuckLuckyDip, ["not interested", vagIndex, cockIndex], "Not Interested", "You are not really interested in the " + response + ".");
		addButton(1, "Interested", seraSexXXXTitfuckLuckyDipGetItem, response, "Interested", "Accept the " + response + " from your mistress.");
		addButton(2, "Perform", seraSexXXXTitfuckLuckyDipPerform, response, "Perform", "Accept the " + response + " but make a show of it.");
		return;
	}
	else if(response == "not interested")
	{
		output("<i>“You’re right,”</i> you say. <i>“It’s not important.”</i> Sera considers you for a moment longer before flicking her toe at the locker behind the counter. She looks slightly disappointed, but doesn’t say anything more whilst you get up to fetch yourself a towel.");
		
		processTime(2);
	}
	else if(response == "finish")
	{
		output("<i>“Life is so goddamn grand,”</i> she exults finally. She closes her eyes and flicks a dismissive, lazy claw at the locker behind the counter. After you’ve spent a few more moments resting, you get up to fetch yourself a towel.");
		
		processTime(5);
	}
	
	IncrementFlag("SERA_TIT_FUCK_LUCKY_DIP");
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}
public function seraSexXXXTitfuckLuckyDipGetItem(TFItem:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	processTime(2);
	IncrementFlag("SERA_TIT_FUCK_LUCKY_DIP");
	
	var discount:Boolean = false;
	
	output("You clamber into a kneeling position on her desk and grasp your hands together between your thighs.");
	output("\n\n<i>“Please mistress,”</i> you say. <i>“May I have some " + TFItem + "?”</i> Sera is silent a moment longer. You give it the doe-eyes, and she laughs.");
	output("\n\n<i>“Oh, I can’t say no to that. Fine! But it’s expensive stuff, pet.");
	
	// “Interested” = product unlocked w/ discount.
	if(TFItem == "Clippex")
	{
		if(!pc.hasKeyItem("Coupon - Clippex"))
		{
			pc.createKeyItem("Coupon - Clippex", 0.25, 0, 0, 0, "Save 75% on your next purchase of Clippex!");
			discount = true;
		}
		flags["SERA_UNLOCK_CLIPPEX"] = 1;
	}
	if(TFItem == "Semen’s Friend")
	{
		if(!pc.hasKeyItem("Coupon - Semens F."))
		{
			pc.createKeyItem("Coupon - Semens F.", 0.25, 0, 0, 0, "Save 75% on your next purchase of Semen’s Friend!");
			discount = true;
		}
		flags["SERA_UNLOCK_SEMENS"] = 1;
	}
	if(TFItem == "Lucifier")
	{
		if(!pc.hasKeyItem("Coupon - Lucifier"))
		{
			pc.createKeyItem("Coupon - Lucifier", 0.25, 0, 0, 0, "Save 75% on your next purchase of Lucifier!");
			discount = true;
		}
		flags["SERA_UNLOCK_LUCIFIER"] = 1;
	}
	if(discount) output(" I’m going to give it to you at a discount but you can’t tell anyone else about it, ok?");
	output("”</i> As she speaks she’s flicking her claws over her touch screen. You grin quietly to yourself as you get up to find a towel.");
	if(discount) output("\n\n<b>You have gained a coupon for " + TFItem + "!</b>");
	
	clearMenu();
	addButton(0, "Next", seraExitToMain);
}
public function seraSexXXXTitfuckLuckyDipPerform(TFItem:String = ""):void
{
	clearOutput();
	author("Nonesuch");
	showSera();
	
	processTime(10);
	// “Perform” = 1 of product added + unlocked w/ discount.
	IncrementFlag("SERA_TIT_FUCK_LUCKY_DIP");
	
	var discount:Boolean = false;
	
	output("You can see what she’s asking for here and, with a familiar, unabashed thrill wriggling through you, you acquiesce. Slowly, you climb off the table and sit yourself down in front of her chair. Your eyes are on hers as you bend forward and touch her outstretched toe with your tongue. Her mouth is open, reveling in the sight of you as you gently suck her slim, bulbous digit before lapping at the rough skin of the balls of her feet.");
	output("\n\n<i>“Oh, that’s good,”</i> she sighs. <i>“Every girl who spends all day on high heels needs one of you... Be sure to get between the toes.”</i> You do so, tasting her sweat as you curve up and down each valley before rasping at the harshness of her heel. You finish off with a long, worshipful wash of the soft instep, flexing beneath your mouth as she coos to your treatment of the most sensitive part of her feet. You allow yourself a swallow when she finally withdraws it, knowing exactly what’s coming next.");
	output("\n\n<i>“You didn’t spend enough time on the balls, bitch,”</i> Sera says imperiously, wiggling her other bare foot in front of your face. <i>“Make sure you do that with this one.”</i>");
	output("\n\nYour tongue aches and your mouth is dry by the time you are done. Sharp teeth, piercings and yellow eyes gleam down as purple, saliva-dampened toes are curled and stretched in front of you admiringly. Her cock is in its normal semi-erect state... but from where you are you can see her pussy is glistening richly.");
	output("\n\n<i>“Oh, I shouldn’t. But you’re such a precious slut! I want to keep you and watch you lick my feet every single... just this once, then.”</i> A ");
	
	if(TFItem == "Clippex")
	{
		output("small white bottle");
		if(!pc.hasKeyItem("Coupon - Clippex"))
		{
			pc.createKeyItem("Coupon - Clippex", 0.25, 0, 0, 0, "Save 75% on your next purchase of Clippex!");
			discount = true;
		}
		flags["SERA_UNLOCK_CLIPPEX"] = 1;
	}
	else if(TFItem == "Semen’s Friend")
	{
		output("small silver tin");
		if(!pc.hasKeyItem("Coupon - Semens F."))
		{
			pc.createKeyItem("Coupon - Semens F.", 0.25, 0, 0, 0, "Save 75% on your next purchase of Semen’s Friend!");
			discount = true;
		}
		flags["SERA_UNLOCK_SEMENS"] = 1;
	}
	else if(TFItem == "Lucifier")
	{
		output("candy apple in a wrapper");
		if(!pc.hasKeyItem("Coupon - Lucifier"))
		{
			pc.createKeyItem("Coupon - Lucifier", 0.25, 0, 0, 0, "Save 75% on your next purchase of Lucifier!");
			discount = true;
		}
		flags["SERA_UNLOCK_LUCIFIER"] = 1;
	}
	
	output(" lands on the counter above you. You didn’t even see where it came from.");
	if(discount) output(" <i>“I can give you more at a discount,”</i> Sera purrs, flicking a big toe at the locker near your head. You shuffle over and open it to find a pile of clean towels. <i>“But that one’s your only freebie, ok? Unless... well... hmm.”</i>");
	else output(" Sera purrs and flicks a big toe at the locker near your head. You shuffle over and open it to find a pile of clean towels. <i>“That one’s your only freebie, ok? Unless... well... hmm.”</i>");
	output("\n\n<b>You have gained one " + TFItem + "!</b>");
	if(discount) output("\n\n<b>You have also gained a coupon for your next purchase of " + TFItem + "!</b>");
	output("\n\n");
	
	if(TFItem == "Clippex") quickLoot(new Clippex());
	else if(TFItem == "Semen’s Friend") quickLoot(new SemensFriend());
	else if(TFItem == "Lucifier") quickLoot(new Lucifier());
	else
	{
		clearMenu();
		addButton(0, "Next", seraExitToMain);
	}
}
