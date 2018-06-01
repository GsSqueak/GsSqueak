navigation
goToPageUrl: aUrl 
	| pp short |
	pp := pages detect: [:pg | pg url = aUrl] ifNone: [nil].
	pp ifNil: 
			[short := (aUrl findTokens: '/') last.
			pp := pages detect: 
							[:pg | 
							pg url ifNil: [false] ifNotNil: [(pg url findTokens: '/') last = short]	"it moved"]
						ifNone: [pages first]].
	self goToPageMorph: pp