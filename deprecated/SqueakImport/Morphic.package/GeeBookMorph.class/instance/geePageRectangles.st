as yet unclassified
geePageRectangles

	| pageBounds allPageRects |

	pageBounds := geeMail topLeft 
			extent: geeMail width @ (geeMail height min: Display height - 50).
	allPageRects := OrderedCollection new.
	[pageBounds top <= geeMail bottom] whileTrue: [
		allPageRects add: pageBounds.
		pageBounds := pageBounds translateBy: 0 @ pageBounds height.
	].
	^allPageRects
