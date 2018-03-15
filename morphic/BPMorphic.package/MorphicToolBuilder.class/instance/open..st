opening
open: anObject 
	"Build and open the object. Answer the widget opened."
	| _gsSqueakTemp_morph |
	anObject isMorph
		ifTrue: [_gsSqueakTemp_morph := anObject]
		ifFalse: [_gsSqueakTemp_morph := self build: anObject].
	(_gsSqueakTemp_morph isKindOf: MenuMorph)
		ifTrue: [_gsSqueakTemp_morph popUpInWorld: World].
	(_gsSqueakTemp_morph isKindOf: DialogWindow)
		ifTrue: [^ _gsSqueakTemp_morph moveToHand; getUserResponse].
	(_gsSqueakTemp_morph isKindOf: SystemWindow)
		ifTrue: [_gsSqueakTemp_morph := _gsSqueakTemp_morph openInWorldExtent: _gsSqueakTemp_morph extent.
			(Project uiManager openToolsAttachedToMouseCursor
					and: [self currentEvent isMouse
							and: [self currentEvent isMouseUp]])
				ifTrue: [_gsSqueakTemp_morph setProperty: #initialDrop toValue: true.
					_gsSqueakTemp_morph hasDropShadow: false.
					self currentHand attachMorph: _gsSqueakTemp_morph]]
		ifFalse: [_gsSqueakTemp_morph openInWorld].
	^ _gsSqueakTemp_morph