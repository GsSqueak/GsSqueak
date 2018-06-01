menu
addCustomMenuItems: aCustomMenu hand: aHandMorph
	"Add toggles for showing-seconds and display-24-hrs to the halo menu"

	"NB:  intentionallyi no super call here!"

	aCustomMenu add: 'change font' translated action: #changeFont.

	aCustomMenu addUpdating: #showingSecondsString action: #toggleShowingSeconds.
	aCustomMenu addUpdating: #displaying24HourString action: #toggleShowing24hr