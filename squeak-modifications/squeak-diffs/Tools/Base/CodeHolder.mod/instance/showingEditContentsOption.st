what to show
showingEditContentsOption
	"True if any of the optional EditContentsOptions modes is in effect. This
	includes bytecode display and possibly other display modes."

	^ EditContentsOptions includesKey: self contentsSymbol
