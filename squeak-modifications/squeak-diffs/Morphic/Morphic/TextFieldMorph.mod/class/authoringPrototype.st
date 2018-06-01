scripting
authoringPrototype 
	"Answer an instance of the receiver that can serve as a prototype for authoring"

	| proto |
	proto := super authoringPrototype.
	proto setProperty: #shared toValue: true.
	proto extent: 170 @ 30.
	proto color: Color veryLightGray lighter.
	proto contents: 'on a clear day you can...'.
	^ proto
