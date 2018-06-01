events
ensureSelectedItem: evt
	
	self selectedItem ifNil: [
		self 
			selectItem: (
				self submorphs 
					detect: [ :each | each isKindOf: DockingBarItemMorph ] 
					ifNone: [ ^self ]) 
			event: evt ]