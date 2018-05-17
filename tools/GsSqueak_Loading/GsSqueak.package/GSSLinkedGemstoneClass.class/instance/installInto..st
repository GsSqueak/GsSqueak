installing
installInto: anEnvironment

	| class |
	class := anEnvironment
		createLinkedClass: self name
		superclass: self superclass
		forGemstoneClass: self gemstoneName.
	self installMethodsInto: class