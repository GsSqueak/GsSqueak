contents
setMyText: someText
	"Set my text, as indicated"

	| toUse |
	toUse := someText ifNil: [''].
	myContents := toUse.
	self setText: toUse.
	^ true