support
iconForClass: aBehavior selector: aSelector
	"Answer an icon to be shown for the selector aSymbol in aBehavior."
	(aBehavior respondsTo: #toolIconSelector:) ifTrue: [
		^ aBehavior toolIconSelector: aSelector].
	^ #blank
