world state
optimumExtentFromAuthor
	^ self
		valueOfProperty: #optimumExtentFromAuthor
		ifAbsent: [| opt |
			opt := bounds extent.
			self setProperty: #optimumExtentFromAuthor toValue: opt.
			^ opt]