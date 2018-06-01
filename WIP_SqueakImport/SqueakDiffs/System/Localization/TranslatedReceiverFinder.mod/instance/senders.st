as yet unclassified
senders

	| m o |
	m := SystemNavigation default allCallsOn: #translated.
	m := m collect: [:e |
		e classIsMeta ifTrue: [
			(Smalltalk at: e classSymbol) class decompile: e methodSymbol.
		] ifFalse: [
			(Smalltalk at: e classSymbol) decompile: e methodSymbol.
		]
	].

	o := OrderedCollection new.
	m do: [:e | self searchMethodNode: e addTo: o].
	^ o sort
