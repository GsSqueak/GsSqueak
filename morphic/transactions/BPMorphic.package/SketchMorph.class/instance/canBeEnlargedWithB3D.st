drawing
canBeEnlargedWithB3D
	^ self
		valueOfProperty: #canBeEnlargedWithB3D
		ifAbsent: [| answer |
			answer := self rotatedForm colorsUsed
						allSatisfy: [:c | c isTranslucent not].
			self setProperty: #canBeEnlargedWithB3D toValue: answer.
			answer]