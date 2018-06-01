all
at: char put: form

	| ind triplet |
	triplet := Array with: char asciiValue with: foregroundColor with: form.
	GlyphCacheData at: (GlyphCacheIndex := GlyphCacheIndex \\ GlyphCacheSize + 1) put: triplet.

	ind := self indexFor: char.
	map at: char asciiValue put: ind.
	self cache at: ind put: triplet.
