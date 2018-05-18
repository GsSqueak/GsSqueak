private
selectSubmorphsOf: aMorph
	"Given the receiver's current bounds, select submorphs of the indicated pasteup morph that fall entirely within those bounds.  If nobody is within the bounds, delete the receiver."

	| newItems removals |
	newItems := aMorph submorphs select:
		[:m | (bounds containsRect: m fullBounds) 
					and: [m~~self
					and: [(m isKindOf: HaloMorph) not]]].
	otherSelection ifNil: [^ selectedItems := newItems].

	removals := newItems intersection: itemsAlreadySelected.
	otherSelection setSelectedItems: (itemsAlreadySelected copyWithoutAll: removals).
	selectedItems := (newItems copyWithoutAll: removals).
	selectedItems ifEmpty: [self delete]
