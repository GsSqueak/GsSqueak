initialization
initializePreferences
	"initialize the receiver's Preferences"
	retractableScrollBar := self class useRetractableScrollBars.
	scrollBarOnLeft := (Preferences valueOfFlag: #scrollBarsOnRight) not.
	scrollBarThickness := self class scrollBarThickness.
	Preferences alwaysShowVScrollbar
		ifTrue: [self vScrollBarPolicy: #always]
		ifFalse: [self vScrollBarPolicy: #whenNeeded].
	Preferences alwaysHideHScrollbar
		ifTrue: [self hScrollBarPolicy: #never]
		ifFalse: [Preferences alwaysShowHScrollbar
				ifTrue: [self hScrollBarPolicy: #always]
				ifFalse: [self hScrollBarPolicy: #whenNeeded]]