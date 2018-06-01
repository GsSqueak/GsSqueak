balloon compatibility
drawGeneralBezierShape: shapeArray color: color borderWidth: borderWidth borderColor: borderColor 
	"shapeArray is an array of: 
	arrays of points, each of which must have 
	a multiple of 3 points in it. 
	This method tries to sort the provided triplets so that curves that 
	start and end at the same point are together."
	| groups fillC where triplets |
	fillC := self shadowColor
				ifNil: [color].
	shapeArray isEmpty
		ifTrue: [^ self].
	where := nil.
	groups := OrderedCollection new.
	triplets := OrderedCollection new.
	shapeArray
		do: [:arr | arr
				groupsOf: 3
				atATimeDo: [:bez | 
					| rounded | 
					rounded := bez roundTo: 0.001.
					(where isNil
							or: [where = rounded first])
						ifFalse: [groups addLast: triplets.
							triplets := OrderedCollection new].
					triplets addLast: rounded.
					where := rounded last]].
	groups addLast: triplets.
	triplets := OrderedCollection new.
	"now try to merge stray groups"
	groups copy
		do: [:g1 | | g2 |
			g1 first first = g1 last last
				ifFalse: ["not closed"
					g2 := groups
								detect: [:g | g ~~ g1
										and: [g1 last last = g first first]]
								ifNone: [].
					g2
						ifNotNil: [groups remove: g2.
							groups add: g2 after: g1]]].
	groups
		do: [:g | triplets addAll: g].
	where := nil.
	self
		definePathProcIn: [ :cvs |
			triplets do: [:shape | 
					where ~= shape first
						ifTrue: [where
								ifNotNil: [cvs closepath].
							cvs moveto: shape first].
					where := cvs outlineQuadraticBezierShape: shape]]
		during: [ :cvs |
			cvs clip.
			cvs setLinewidth: borderWidth "*2";
				 fill: fillC andStroke: borderColor]