halo commands
duplicate
	"Make a duplicate of the receiver and havbe the hand grab it"

	selectedItems := self duplicateMorphCollection: selectedItems.
	selectedItems reverseDo: [:m | (owner ifNil: [ActiveWorld]) addMorph: m].
	dupLoc := self position.
	ActiveHand grabMorph: self.
	ActiveWorld presenter flushPlayerListCache