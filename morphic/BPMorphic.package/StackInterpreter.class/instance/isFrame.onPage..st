frame access
isFrame: aFrame onPage: aPage 
	| _gsSqueakTemp_theFP _gsSqueakTemp_prevFP |
	self
		deny: (stackPages isFree: aPage).
	"Walk the static chain making sure progress is being made,
	and in the right direction, looking for a match with aFrame."
	_gsSqueakTemp_theFP := aPage headFP.
	_gsSqueakTemp_prevFP := _gsSqueakTemp_theFP - objectMemory wordSize.
	[_gsSqueakTemp_theFP = aFrame
		ifTrue: [^ true].
	_gsSqueakTemp_theFP > _gsSqueakTemp_prevFP
		and: [_gsSqueakTemp_theFP < aPage baseFP]]
		whileTrue: [_gsSqueakTemp_prevFP := _gsSqueakTemp_theFP.
			_gsSqueakTemp_theFP := self frameCallerFP: _gsSqueakTemp_theFP].
	^ false