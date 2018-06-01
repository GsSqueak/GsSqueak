testing
canBeEncroached
	"Answer whether my bottom edge can be encroached by horizontal smart-splitter.  If my list is larger than my outermost containing window, go ahead and report true since moving a splitter will never allow my entire list to be displayed.  In that case go ahead and be encroachable to allow lower truncated text-panes to be exposed, but leave a reasonable height (70) to ensure at least few items are displayed."
	^ self height > 24 and:
		[ | outermostContainer |
		outermostContainer := self outermostMorphThat:
			[ : e | e owner = self world ].
		listMorph height + 8 < self height or:
			[ outermostContainer notNil and: [ listMorph height > (outermostContainer height / 1.2) and: [ self height > 70 ] ] ] ]