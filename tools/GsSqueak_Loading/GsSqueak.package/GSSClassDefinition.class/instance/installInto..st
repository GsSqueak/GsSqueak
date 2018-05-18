installing
installInto: anEnvironment

	| class |
	class := anEnvironment
		createClass: self name
		type: self type
		superclass: self superclass
		instVars: self instVars
		classVars: self classVars
		classInstVars: self classInstVars
		poolDictionaries: self pools
		category: self category.
	self installMethodsInto: class