accessing
isSticky
	"answer whether the receiver is Sticky"
	^ Preferences noviceMode
		or: [super isSticky] 