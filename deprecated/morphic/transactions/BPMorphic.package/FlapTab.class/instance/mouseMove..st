event handling
mouseMove: evt 
	"Handle a mouse-move event. The event, a MorphicEvent, is passed in."
	| _gsSqueakTemp_aPosition _gsSqueakTemp_newReferentThickness _gsSqueakTemp_adjustedPosition _gsSqueakTemp_thick |
	dragged
		ifFalse: [(_gsSqueakTemp_thick := self referentThickness) > 0
				ifTrue: [lastReferentThickness := _gsSqueakTemp_thick]].
	((self containsPoint: (_gsSqueakTemp_aPosition := evt cursorPoint))
			and: [dragged not])
		ifFalse: [flapShowing
				ifFalse: [self showFlap].
			_gsSqueakTemp_adjustedPosition := _gsSqueakTemp_aPosition - evt hand targetOffset.
			edgeToAdhereTo == #bottom
				ifTrue: [_gsSqueakTemp_newReferentThickness := inboard
								ifTrue: [self world height - _gsSqueakTemp_adjustedPosition y]
								ifFalse: [self world height - _gsSqueakTemp_adjustedPosition y - self height]].
			edgeToAdhereTo == #left
				ifTrue: [_gsSqueakTemp_newReferentThickness := inboard
								ifTrue: [_gsSqueakTemp_adjustedPosition x + self width]
								ifFalse: [_gsSqueakTemp_adjustedPosition x]].
			edgeToAdhereTo == #right
				ifTrue: [_gsSqueakTemp_newReferentThickness := inboard
								ifTrue: [self world width - _gsSqueakTemp_adjustedPosition x]
								ifFalse: [self world width - _gsSqueakTemp_adjustedPosition x - self width]].
			edgeToAdhereTo == #top
				ifTrue: [_gsSqueakTemp_newReferentThickness := inboard
								ifTrue: [_gsSqueakTemp_adjustedPosition y + self height]
								ifFalse: [_gsSqueakTemp_adjustedPosition y]].
			self isCurrentlySolid
				ifFalse: [(#(#left #right) includes: edgeToAdhereTo)
						ifTrue: [self top: _gsSqueakTemp_adjustedPosition y]
						ifFalse: [self left: _gsSqueakTemp_adjustedPosition x]].
			(edgeToAdhereTo == #left
					and: [(self valueOfProperty: #rigidThickness) notNil])
				ifTrue: [_gsSqueakTemp_newReferentThickness := referent width].
			self applyThickness: _gsSqueakTemp_newReferentThickness.
			dragged := true.
			self fitOnScreen.
			self computeEdgeFraction]