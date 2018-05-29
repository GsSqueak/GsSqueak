class initialization
initialize
"
	self initialize
"

	| tt |
	"self allSubInstancesDo:[:fnt| fnt flushCache]."
	"during GsSquek bootstrap, no instances exist"
	
	
	GlyphCacheSize := 512.
	GlyphCacheData := Array new: GlyphCacheSize.
	GlyphCacheIndex := 0.
	GlyphCacheReady := true.
	
	tt := TTFontDescription default.
	tt ifNotNil: [self newTextStyleFromTT: tt].
	FileServices registerFileReader: self.

	Smalltalk addToShutDownList: self.
