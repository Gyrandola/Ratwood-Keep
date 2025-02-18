/datum/objective/siege
	name = "Conquer Rockhill"
	explanation_text = "Follow your Leader and ensure the city falls."
	team_explanation_text = "Follow your Leader and ensure the city falls."
	triumph_count = 5

/datum/objective/siege/check_completion()
	var/datum/game_mode/chaosmode/C = SSticker.mode
	if(C.cultascended)
		return TRUE

/datum/antagonist/sieger/roundend_report()
	var/traitorwin = TRUE
	var/count = 0
	var/special_role_text = lowertext(name)

	printplayer(owner)

	if(objectives.len)
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(objective.check_completion())
				to_chat(owner, "<B>Goal #[count]</B>: [objective.explanation_text] " + span_green("TRIUMPH!"))
			else
				to_chat(owner, "<B>Goal #[count]</B>: [objective.explanation_text] " + span_red("Failure."))

				traitorwin = FALSE
			count += objective.triumph_count

	if(traitorwin)
		if(count)
			if(owner)
				owner.adjust_triumphs(count)
		to_chat(world, span_green("The [special_role_text] has TRIUMPHED!"))
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
		else
			to_chat(world, span_red("The [special_role_text] has FAILED!"))

		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)
