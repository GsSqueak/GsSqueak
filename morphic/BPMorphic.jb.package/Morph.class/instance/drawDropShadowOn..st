drawing
drawDropShadowOn: aCanvas 
	"Rectangular shadow with support for rounded corners."
	| shadowBounds |
	shadowBounds := self shadowOffset isRectangle
				ifTrue: [self bounds outsetBy: self shadowOffset]
				ifFalse: [self bounds
						translateBy: (self shadowOffset negated max: 0 @ 0)].
	"Only redraw the shadow if the shadow area is affected."
	((aCanvas clipRect intersects: shadowBounds)
			and: [((self bounds
					insetBy: (self wantsRoundedCorners
							ifTrue: [self cornerRadius]
							ifFalse: [0]))
					containsRect: aCanvas clipRect) not])
		ifTrue: [(self hasProperty: #dropShadow)
				ifFalse: [self updateDropShadowCache].
			aCanvas
				translucentImage: (self valueOfProperty: #dropShadow)
				at: shadowBounds topLeft]