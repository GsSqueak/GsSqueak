tools
allThemePropertiesDo: block
	"Iterate over all classes that provide theme properties."
	
	Smalltalk allClassesDo: [:eachClass |
		(eachClass respondsTo: #themeProperties) ifTrue: [
			eachClass themeProperties do: [:eachProperty |
				block cull: eachClass cull: eachProperty]]].