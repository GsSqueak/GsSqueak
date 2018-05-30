accessing
subBounds
	"calculate the submorph bounds"

	| subBounds |
	subBounds := (submorphs ifEmpty: [^nil]) anyOne fullBounds copy.
	self submorphsDo: 	[:m | subBounds swallow: m fullBounds].
	^subBounds