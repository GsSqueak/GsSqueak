miscellaneous
balloonTextForFlapsMenu
	"Answer the balloon text to show on a menu item in the flaps menu
	that governs the visibility of the receiver in the current project"
	| _gsSqueakTemp_id |
	_gsSqueakTemp_id := self flapID.
	#(#('Squeak' 'Has a few generally-useful controls; it is also a place where you can "park" objects' #translatedNoop) #('Tools' 'A quick way to get browsers, change sorters, file lists, etc.' #translatedNoop) #('Widgets' 'A variety of controls and media tools' #translatedNoop) #('Supplies' 'Supplies' #translatedNoop) #('Help' 'A flap providing documentation, tutorials, and other help' #translatedNoop) #('Stack Tools' 'Tools for building stacks.  Caution!  Powerful but young and underdocumented' #translatedNoop) #('Scripting' 'Tools useful when doing tile scripting' #translatedNoop) #('Navigator' 'Project navigator:  includes controls for navigating through linked projects.  Also supports finding, loading and publishing projects in a shared environment' #translatedNoop) #('Painting' 'A flap housing the paint palette.  Click on the closed tab to make make a new painting' #translatedNoop))
		do: [:pair | (FlapTab givenID: _gsSqueakTemp_id matches: pair first translated)
				ifTrue: [^ pair second translated]].
	^ self balloonText