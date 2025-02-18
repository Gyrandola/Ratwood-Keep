/datum/antagonist/sieger
	name = "Sieger"
	roundend_category = "siegers"
	antagpanel_category = "Siege"
	job_rank = ROLE_SIEGER
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "sieger"
	confess_lines = list(
		"DEATH BEFORE DISHONOR!",
		"THE CITY WILL FALL!",
	)
	rogue_enabled = TRUE

/datum/antagonist/sieger/examine_friendorfoe(datum/antagonist/examined_datum, mob/examiner, mob/examined)
	if(istype(examined_datum, /datum/antagonist/sieger/leader))
		return span_boldnotice("OUR LEADER!")
	if(istype(examined_datum, /datum/antagonist/sieger))
		return span_boldnotice("A fellow sieger.")

/datum/antagonist/sieger/on_gain()
	. = ..()
	var/datum/game_mode/chaosmode/C = SSticker.mode
	var/mob/living/carbon/human/H = owner.current
	C.siegers |= owner
	owner.special_role = ROLE_SIEGER
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	add_objective(/datum/objective/siege)
	greet()

/datum/antagonist/sieger/greet()
	to_chat(owner, span_danger("I count myself among the ranks of the besiegers, loyal to my leader, I will make sure Rockhill falls."))
	owner.announce_objectives()

/datum/antagonist/sieger/leader/greet()
	to_chat(owner, span_danger("I'm the leader of the siege party. I must conquer the city at all costs and with all the tools and men at my disposal."))
	owner.announce_objectives()

