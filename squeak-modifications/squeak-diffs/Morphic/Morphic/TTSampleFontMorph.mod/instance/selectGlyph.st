connectors
selectGlyph
	| retval done |
	"Modal glyph selector"
	done := false.
	self on: #mouseDown send: #selectGlyphBlock:event:from: to: self withValue: [ :glyph | retval := glyph. done := true. ].
	self on: #keyStroke send: #value to: [ done := true ].
	[ done ] whileFalse: [ self world doOneCycle ].
	self on: #mouseDown send: nil to: nil.
	self on: #keyStroke send: nil to: nil.
	^retval