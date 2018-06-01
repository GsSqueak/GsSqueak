misc
indicateLocationOnScreen
	"Give momentary feedback on screen until mouse button is clicked"
	| _gsSqueakTemp_bds |
	_gsSqueakTemp_bds := self costume boundsInWorld.
	5
		timesRepeat: [Display reverse: _gsSqueakTemp_bds.
			(Delay forMilliseconds: 80) wait.
			Display reverse: _gsSqueakTemp_bds.
			(Delay forMilliseconds: 200) wait].
	costume changed