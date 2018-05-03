primitive table
hasClosures
	"True if the current image requires full closure support."

	^self imageFormatVersion ~= 6502 and: [self imageFormatVersion ~= 68000].