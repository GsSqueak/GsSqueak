positioning
fitOnScreen
	| constrainer |
	super fitOnScreen.
	"We want to leave a margin for the flaps on the side and for the global flaps at the top (like the Sugar navbar) so we reduce the referents top and its width. We undo this before hiding the flap in ViewerFlapTab>>adjustPositionAfterHidingFlap"
	self flag: #todo.
	constrainer := (owner ifNil: [self]) clearArea.
	self flapShowing ifTrue: [
		Flaps globalFlapTabsIfAny
			do: [:each |
				(each edgeToAdhereTo = #top and: [each bottom > self referent top])
					ifTrue: [self referent top: each bottom].
				(each edgeToAdhereTo = #top and: [each bottom > self top])
					ifTrue: [self top: each bottom]].
		self referent width: constrainer right - self width -  self right].