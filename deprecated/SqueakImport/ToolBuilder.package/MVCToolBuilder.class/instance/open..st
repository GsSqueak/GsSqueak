opening
open: anObject
	"Build and open the object. Answer the widget opened."
	| window |
	window := (anObject isKindOf: View)
		ifTrue: [anObject]
		ifFalse: [self build: anObject].
	(window isKindOf: PopUpMenu)
		ifTrue: [window invokeOn: nil].
	(window isKindOf: View)
		ifTrue: [window controller open].
	^window