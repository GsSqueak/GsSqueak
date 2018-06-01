drawing
expandFullBoundsForDropShadow: aRectangle
	"Return an expanded rectangle for an eventual drop shadow"
	| delta box |

	self shadowOffset isRectangle
		ifTrue: [^ aRectangle outsetBy: self shadowOffset].

	box := aRectangle.
	delta := self shadowOffset.
	box := delta x >= 0 
		ifTrue:[box right: aRectangle right + delta x]
		ifFalse:[box left: aRectangle left + delta x].
	box := delta y >= 0
		ifTrue:[box bottom: aRectangle bottom + delta y]
		ifFalse:[box top: aRectangle top + delta y].
	^box