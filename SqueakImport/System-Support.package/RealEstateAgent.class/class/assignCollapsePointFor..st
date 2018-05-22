utilities
assignCollapsePointFor: aSSView
	"Offer up a location along the left edge of the screen for a collapsed SSView.
	Make sure it doesn't overlap any other collapsed frames."

	| grid otherFrames y free topLeft viewBox |
	grid := 24.  "should be mult of 8, since manual move is gridded by 8"
	aSSView isMorph
		ifTrue: [otherFrames := (SystemWindow windowsIn: aSSView world satisfying: [:w | true])
					collect: [:w | w collapsedFrame]
					thenSelect: [:rect | rect notNil].
				viewBox := self maximumUsableAreaInWorld: aSSView world]
		ifFalse: [otherFrames := ScheduledControllers scheduledWindowControllers
					collect: [:aController | aController view collapsedFrame]
					thenSelect: [:rect | rect notNil].
				viewBox := Display boundingBox].
	y := viewBox top.
	[(y := y + grid) <= (viewBox height - grid)]
		whileTrue:
		[topLeft := viewBox left@y.
		free := true.
		otherFrames do: [:w | free := free & (topLeft ~= w topLeft)].
		free ifTrue: [^ topLeft]].
	"If all else fails..."
	^ 0 @ 0