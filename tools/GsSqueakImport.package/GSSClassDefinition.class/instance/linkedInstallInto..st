installing
linkedInstallInto: anEnvironment

	^ anEnvironment
		createLinkedClass: self name
		superclass: self superclass
		forGemstoneClass: self gemstoneName