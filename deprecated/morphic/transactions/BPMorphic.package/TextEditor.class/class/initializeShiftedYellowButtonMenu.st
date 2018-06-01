keyboard shortcut tables
initializeShiftedYellowButtonMenu
	"Initialize the yellow button pop-up menu and corresponding
	messages. "
	"TextEditor initialize"
	"
	shiftedYellowButtonMenu := {
	{'set font... (k)' translated.					#offerFontMenu}.
	{'set style... (K)' translated.				#changeStyle}.
	{'set alignment...' translated.				#chooseAlignment}.
	#-.
	{'more...' translated.						#yellowButtonActivity}.
	}
	"
	shiftedYellowButtonMenu := yellowButtonMenu