all
formOf: char

	| newForm |
	cache ifNil: [ self recreateCache ].
	foregroundColor ifNil: [ self foregroundColor: Color black ].

	self hasCached: char ifTrue: [:form |
		^ form.
	].

	newForm := self computeForm: char.
	self at: char put: newForm.
	^ newForm.
