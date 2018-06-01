menu
changeColor
	self isCurrentlyGraphical
		ifTrue:
			[^ self inform: 'Color only pertains to a flap tab when the 
tab is textual or "solid".  This tab is
currently graphical, so color-choice
does not apply.' translated].
	super changeColor
	
