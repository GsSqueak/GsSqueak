initialization
list: listOfStrings
	scroller removeAllMorphs.
	list := listOfStrings ifNil: [Array new].
	list isEmpty ifTrue: [^ self selectedMorph: nil].
	super list: listOfStrings.

	"At this point first morph is sensitized, and all morphs share same handler."
	scroller firstSubmorph on: #mouseEnterDragging
						send: #mouseEnterDragging:onItem:
						to: self.
	scroller firstSubmorph on: #mouseUp
						send: #mouseUp:onItem:
						to: self.
	"This should add this behavior to the shared event handler thus affecting all items"