utilities
assignCollapseFrameFor: aSSView 
	"Offer up a location along the left edge of the screen for a collapsed SSView. Make sure it doesn't overlap any other collapsed frames."

	| grid otherFrames topLeft viewBox collapsedFrame extent newFrame verticalBorderDistance top |
	grid := 8.
	verticalBorderDistance := 8.
	aSSView isMorph
		ifTrue: [otherFrames := (SystemWindow windowsIn: aSSView world satisfying: [:w | w ~= aSSView])
						collect: [:w | w collapsedFrame]
						thenSelect: [:rect | rect notNil].
				viewBox := self maximumUsableAreaInWorld: aSSView world]
		ifFalse: [otherFrames := ScheduledControllers scheduledWindowControllers
						collect: [:aController | aController view ~= aSSView ifTrue: [aController view collapsedFrame]]
						thenSelect: [:rect | rect notNil].
				viewBox := Display boundingBox].
	collapsedFrame := aSSView collapsedFrame.
	extent := collapsedFrame notNil
				ifTrue: [collapsedFrame extent]
				ifFalse: [aSSView isMorph
					ifTrue: [aSSView getRawLabel width + aSSView labelWidgetAllowance @ (aSSView labelHeight + 2)]
					ifFalse: [(aSSView labelText extent x + 70) @ aSSView labelHeight
							min: aSSView labelDisplayBox extent]].
	collapsedFrame notNil
		ifTrue: [(otherFrames anySatisfy: [:f | collapsedFrame intersects: f])
				ifFalse: ["non overlapping"
					^ collapsedFrame]].
	top := viewBox top + verticalBorderDistance.
	[topLeft := viewBox left @ top.
	newFrame := topLeft extent: extent.
	newFrame bottom <= (viewBox height - verticalBorderDistance)]
		whileTrue: 
			[(otherFrames anySatisfy: [:w | newFrame intersects: w])
				ifFalse: ["no overlap"
					^ newFrame].
			top := top + grid].
	"If all else fails... (really to many wins here)"
	aSSView isMorph
		ifTrue:[ Project current showWorldMainDockingBar ifTrue:[^ (0 @ Project current world mainDockingBars first height) extent: extent]].
	^ 0 @ 0 extent: extent