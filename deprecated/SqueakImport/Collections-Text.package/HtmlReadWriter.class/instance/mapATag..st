mapping
mapATag: aTag

	| result startIndex stopIndex attribute |
	result := OrderedCollection new.
	
	"<a href=""http://google.de"">"
	attribute := 'href'.
	startIndex := aTag findString: attribute.
	startIndex > 0 ifTrue: [
		startIndex := aTag findString: '"' startingAt: startIndex+attribute size.
		stopIndex := aTag findString: '"' startingAt: startIndex+1.
		result add: (TextURL new url: (aTag copyFrom: startIndex+1 to: stopIndex-1))].
	
	^ result