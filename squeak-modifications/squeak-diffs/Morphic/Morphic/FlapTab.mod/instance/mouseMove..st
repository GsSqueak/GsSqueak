event handling
mouseMove: evt
	"Handle a mouse-move event.   The event, a MorphicEvent, is passed in."

	| aPosition newReferentThickness adjustedPosition thick |

	dragged ifFalse: [(thick := self referentThickness) > 0
			ifTrue: [lastReferentThickness := thick]].
	((self containsPoint: (aPosition := evt cursorPoint)) and: [dragged not])
		ifFalse:
			[flapShowing ifFalse: [self showFlap].
			adjustedPosition := aPosition - evt hand targetOffset.
			(edgeToAdhereTo == #bottom)
				ifTrue:
					[newReferentThickness := inboard
						ifTrue:
							[self world height - adjustedPosition y]
						ifFalse:
							[self world height - adjustedPosition y - self height]].

			(edgeToAdhereTo == #left)
					ifTrue:
						[newReferentThickness :=
							inboard
								ifTrue:
									[adjustedPosition x + self width]
								ifFalse:
									[adjustedPosition x]].

			(edgeToAdhereTo == #right)
					ifTrue:
						[newReferentThickness :=
							inboard
								ifTrue:
									[self world width - adjustedPosition x]
								ifFalse:
									[self world width - adjustedPosition x - self width]].

			(edgeToAdhereTo == #top)
					ifTrue:
						[newReferentThickness :=
							inboard
								ifTrue:
									[adjustedPosition y + self height]
								ifFalse:
									[adjustedPosition y]].
		
			self isCurrentlySolid ifFalse:
				[(#(left right) includes: edgeToAdhereTo)
					ifFalse:
						[self left: adjustedPosition x]
					ifTrue:
						[self top: adjustedPosition y]].

			((edgeToAdhereTo == #left) and: [(self  valueOfProperty: #rigidThickness) notNil]) ifTrue:
				[newReferentThickness := referent width].

			self applyThickness: newReferentThickness.
			dragged := true.
			self fitOnScreen.
			self computeEdgeFraction]