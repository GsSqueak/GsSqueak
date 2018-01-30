tabs and margins
nextTabXFrom: anX leftMargin: leftMargin rightMargin: rightMargin 
	"Tab stops are distances from the left margin. Set the distance into the
	argument, anX, normalized for the paragraph's left margin."
	| _gsSqueakTemp_normalizedX _gsSqueakTemp_tabX |
	_gsSqueakTemp_normalizedX := anX - leftMargin.
	1
		to: tabsArray size
		do: [:i | (_gsSqueakTemp_tabX := tabsArray at: i) > _gsSqueakTemp_normalizedX
				ifTrue: [^ leftMargin + _gsSqueakTemp_tabX min: rightMargin]].
	^ rightMargin