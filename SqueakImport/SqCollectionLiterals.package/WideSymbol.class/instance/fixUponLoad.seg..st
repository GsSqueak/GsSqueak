private
fixUponLoad: aProject seg: anImageSegment
	"We are in an old project that is being loaded from disk. 
	Fix up conventions that have changed."
	| ms |
	"Yoshiki did not put MultiSymbols into outPointers in older 
images!
	When all old images are gone, remove this method."
	ms := Symbol intern: self asString.
	self == ms ifFalse: [
		"For a project from older m17n image, this is necessary."
		self becomeForward: ms.
		aProject projectParameters at: #MultiSymbolInWrongPlace put: true
	].

	"MultiString>>capitalized was not implemented 
correctly. 
	Fix eventual accessors and mutators here."
	((self beginsWith: 'get')
		and:[(self at: 4) asInteger < 256
		and:[(self at: 4) isLowercase]]) ifTrue:[
			ms := self asString.
			ms at: 4 put: (ms at: 4) asUppercase.
			ms := ms asSymbol.
			self becomeForward: ms.
			aProject projectParameters at: #MultiSymbolInWrongPlace put: true.
		].
	((self beginsWith: 'set')
		and:[(self at: 4) asInteger < 256
		and:[(self at: 4) isLowercase
		and:[self last = $:
		and:[(self occurrencesOf: $:) = 1]]]]) ifTrue:[
			ms := self asString.
			ms at: 4 put: (ms at: 4) asUppercase.
			ms := ms asSymbol.
			self becomeForward: ms.
			aProject projectParameters at: #MultiSymbolInWrongPlace put: true.
		].
	^ super fixUponLoad: aProject seg: anImageSegment	"me, 
not the label"
