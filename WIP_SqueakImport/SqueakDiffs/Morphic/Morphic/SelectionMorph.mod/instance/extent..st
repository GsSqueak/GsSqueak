geometry
extent: newExtent
	"Set the receiver's extent   Extend or contract the receiver's selection to encompass morphs within the new extent."

	super extent: newExtent.
	self selectSubmorphsOf: (self pasteUpMorph ifNil: [^ self])