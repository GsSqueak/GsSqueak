as yet unclassified
transformMethod: aMethodString
| ramschBegin stylefreeMethod |
stylefreeMethod := aMethodString.
ramschBegin := aMethodString indexOfSubCollection: ']style['.
ramschBegin = 0 ifFalse: [
	stylefreeMethod := stylefreeMethod first: ramschBegin - 1.
	].

stylefreeMethod := stylefreeMethod first: ((stylefreeMethod lastIndexOf: ('!' asCharacter)) - 1).
^ ((Parser new parse: stylefreeMethod class: (self class)) preen printString), '!'.