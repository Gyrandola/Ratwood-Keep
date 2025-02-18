/*
*	These jobs are for latejoinable siege classes. Leader and Lieutenants are rolled directly on roundstart.
*/
/datum/job/roguetown/sieger
	title = "Sieger"
	flag = BANDIT
	department_flag = FOREIGNERS
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	antag_job = TRUE
	allowed_races = RACES_VERY_SHUNNED_UP
	outfit = null
	outfit_female = null
	display_order = JDO_BANDIT
	show_in_credits = FALSE
	announce_latejoin = FALSE
	subclass_cat_rolls = list(CTAG_BANDIT = 20)
	wanderer_examine = TRUE
	foreign_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = FALSE
	same_job_respawn_delay = 30 MINUTES
	family_blacklisted = TRUE
	cmode_music = 'sound/music/combat_bandit2.ogg'

/datum/job/roguetown/sieger/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		if(!H.mind)
			return
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		H.ambushable = FALSE

/datum/outfit/job/roguetown/sieger/post_equip(mob/living/carbon/human/H)
	..()
	var/datum/antagonist/new_antag = new /datum/antagonist/sieger()
	H.mind.add_antag_datum(new_antag)
	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, choose_name_popup), "SIEGER"), 5 SECONDS)
