halo handling
removeHalo
	"remove the receiver's halo (if any)"

	self halo ifNotNil: [ :halo |
		halo delete.
		self removeProperty: #halo ]