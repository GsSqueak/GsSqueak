testing
allSketchMorphClasses	"Morph allSketchMorphClasses"	^ Array		streamContents: [:s | self				withAllSubclassesDo: [:cls | cls isSketchMorphClass						ifTrue: [s nextPut: cls]]]