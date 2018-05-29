page controls
shortControlSpecs
	"Answer  specs defining the widgets in the short form of the control panel."

^ {
		#spacer.
		#variableSpacer.
		{'<'. 		#previousPage.			'Previous page' translated}.
		#spacer.
		{#MenuIcon.		#invokeShortBookMenu. 		'Click here to get a menu of options for this book.' translated}.
		#spacer.
		{'>'.		#nextPage.				'Next page' translated}.
		#spacer.
		#variableSpacer.
		{#RightCaret.		#showMoreControls.		'More controls' translated}
}
