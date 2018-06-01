as yet unclassified
scrollSelectionIntoView: event alignTop: alignTop inTextMorph: tm
	"Scroll my text into view if necessary and return true, else return false"

	| selRects delta selRect rectToTest transform cpHere |

	selRects := tm paragraph selectionRects.
	selRects isEmpty ifTrue: [^ false].
	rectToTest := selRects first merge: selRects last.
	transform := scroller transformFrom: self.
	(event notNil and: [event isMouse and: [event anyButtonPressed]]) ifTrue:  "Check for autoscroll"
		[cpHere := transform localPointToGlobal: event cursorPoint.
		cpHere y <= self top
			ifTrue: [rectToTest := selRects first topLeft extent: 2@2]
			ifFalse: [cpHere y >= self bottom
					ifTrue: [rectToTest := selRects last bottomRight extent: 2@2]
					ifFalse: [^ false]]].
	selRect := transform localBoundsToGlobal: rectToTest.
	selRect height > bounds height
		ifTrue: [^ false].  "Would not fit, even if we tried to scroll"
	alignTop ifTrue: [
		self scrollBy: 0@(bounds top - selRect top).
		^ true
	].
	selRect bottom > bounds bottom ifTrue: [
		self scrollBy: 0@(bounds bottom - selRect bottom - 30).
		^ true
	].
	(delta := selRect amountToTranslateWithin: self bounds) y ~= 0 ifTrue: [
		"Scroll end of selection into view if necessary"
		self scrollBy: 0@delta y.
		^ true].
	^ false