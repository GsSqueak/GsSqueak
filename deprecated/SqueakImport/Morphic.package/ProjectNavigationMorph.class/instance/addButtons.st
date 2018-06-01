as yet unclassified
addButtons

	self orientedVertically ifTrue: [
		self addAColumn: (
			self makeTheButtons collect: [ :x | self inAColumn: {x}]
		)
	] ifFalse: [
		self addARow: (
			self makeTheButtons collect: [ :x | self inAColumn: {x}]
		)
	].
