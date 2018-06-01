installing
installInto: anEnvironment

	"Transcript showln: ('### Compiling {1} ###' format: {self fullPrintString})."
	^ anEnvironment
		createClass: self name
		type: self type
		superclass: self superclass
		instVars: self instVars
		classVars: self classVars
		classInstVars: self classInstVars
		poolDictionaries: self pools
		category: self category