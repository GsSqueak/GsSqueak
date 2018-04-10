events
tabSelected
	"Called when the receiver is hit. First, bulletproof against someone
	having taken the structure apart. My own action basically requires
	that my grand-owner be a TabbedPalette. Note that the 'opening'
	script concept has been left behind here."
	| _gsSqueakTemp_gramps |
	(owner isKindOf: IndexTabs)
		ifFalse: [^ Beeper beep].
	((_gsSqueakTemp_gramps := owner owner) isKindOf: TabbedPalette)
		ifTrue: [_gsSqueakTemp_gramps selectTab: self]