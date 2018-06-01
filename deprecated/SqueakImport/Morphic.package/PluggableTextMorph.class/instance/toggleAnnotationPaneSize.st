menu commands
toggleAnnotationPaneSize

	| handle origin aHand siblings |

	self flag: #bob.		"CRUDE HACK to enable changing the size of the annotations pane"

	owner ifNil: [^self].
	siblings := owner submorphs.
	siblings size > 3 ifTrue: [^self].
	siblings size < 2 ifTrue: [^self].

	aHand := self primaryHand.
	origin := aHand position.
	(handle := HandleMorph new)
		forEachPointDo: [:newPoint | | lf ht prevBottom newHeight m |
			handle removeAllMorphs.
			newHeight := (newPoint - origin) y asInteger min: owner height - 50 max: 16.
			lf := siblings last layoutFrame.
			lf bottomOffset: newHeight.
			prevBottom := newHeight.
			siblings size - 1 to: 1 by: -1 do: [ :index |
				m := siblings at: index.
				lf := m layoutFrame.
				ht := lf bottomOffset - lf topOffset.
				lf topOffset: prevBottom.
				lf bottomOffset = 0 ifFalse: [
					lf bottomOffset: (prevBottom + ht).
				].
				prevBottom := prevBottom + ht.
			].
			owner layoutChanged.

		]
		lastPointDo:
			[:newPoint | handle deleteBalloon.
			self halo ifNotNil: [:halo | halo addHandles].
		].
	aHand attachMorph: handle.
	handle setProperty: #helpAtCenter toValue: true.
	handle showBalloon:
'Move cursor farther from
this point to increase pane.
Click when done.' hand: aHand.
	handle startStepping

