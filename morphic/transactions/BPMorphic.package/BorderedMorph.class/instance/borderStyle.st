accessing
borderStyle
	"Work around the borderWidth/borderColor pair"
	| style |
	borderColor
		ifNil: [^ BorderStyle default].
	borderWidth isZero
		ifTrue: [^ BorderStyle default].
	style := self
				valueOfProperty: #borderStyle
				ifAbsent: [BorderStyle default].
	(borderWidth = style width
			and: ["Hah! Try understanding this..."
				borderColor == style style
					or: ["#raised/#inset etc"
						#simple == style style
							and: [borderColor = style color]]])
		ifFalse: [style := borderColor isColor
						ifTrue: [BorderStyle width: borderWidth color: borderColor]
						ifFalse: [(BorderStyle perform: borderColor)
								width: borderWidth
							"argh."].
			self setProperty: #borderStyle toValue: style].
	^ style trackColorFrom: self