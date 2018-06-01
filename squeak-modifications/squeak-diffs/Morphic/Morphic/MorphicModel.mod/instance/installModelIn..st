debug and other
installModelIn: aWorld

	self wantsSlot ifFalse: [^ self].  "No real need to install"
	slotName := aWorld model addPartNameLike: self class name withValue: self.
	slotName ifNil: [^ self].  "user chose bad slot name"
	self model: aWorld model slotName: slotName.
	self compilePropagationMethods.
	aWorld model compileAccessForSlot: slotName.
