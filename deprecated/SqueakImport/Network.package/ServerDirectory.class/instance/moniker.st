accessing
moniker
	"a plain language name for this directory"

	moniker ifNotNil: [^ moniker].
	directory ifNotNil: [^ self server].
	urlObject ifNotNil: [^ urlObject asString].
	^ ''