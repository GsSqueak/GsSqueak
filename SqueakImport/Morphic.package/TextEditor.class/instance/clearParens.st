parenblinking
clearParens
	lastParenLocation ifNotNil: [
		self text string size >= lastParenLocation ifTrue: [
			self text
				removeAttribute: TextEmphasis bold
				from: lastParenLocation
				to: lastParenLocation]].
	lastParenLocation := nil