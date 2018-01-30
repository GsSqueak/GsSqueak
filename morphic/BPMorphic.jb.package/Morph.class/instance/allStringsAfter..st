debug and other
allStringsAfter: aSubmorph 
	"return an OrderedCollection of strings of text in my submorphs. If
	aSubmorph is non-nil, begin with that container."
	| list ok |
	list := OrderedCollection new.
	ok := aSubmorph isNil.
	self
		allMorphsDo: [:sub | 
			ok
				ifFalse: [ok := sub == aSubmorph].
			"and do this one too"
			ok
				ifTrue: [sub userString
						ifNotNil: [:string | string isString
								ifTrue: [list add: string]
								ifFalse: [list addAll: string]]]].
	^ list