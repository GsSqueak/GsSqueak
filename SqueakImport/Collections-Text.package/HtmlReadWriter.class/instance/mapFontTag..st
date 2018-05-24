mapping
mapFontTag: aTag

	| result colorStartIndex colorStopIndex attribute |
	result := OrderedCollection new.
	
	"<font color=""#00FFCC""> or <font color=""green"">"
	attribute := 'color'.
	colorStartIndex := aTag findString: attribute.
	colorStartIndex > 0 ifTrue: [
		colorStartIndex := aTag findString: '"' startingAt: colorStartIndex+attribute size.		
		colorStopIndex := aTag findString: '"' startingAt: colorStartIndex+1.
		result add: (TextColor color:
			(Color fromString: (aTag copyFrom: colorStartIndex+1 to: colorStopIndex-1)))].

	^ result