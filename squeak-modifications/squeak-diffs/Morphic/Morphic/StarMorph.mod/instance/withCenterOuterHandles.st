editing
withCenterOuterHandles
	"Add to our handles the center positioning and outer resizing
	handles. Outer handle must not be blocked so it comes first. 
	The editing routine expects to find the center handle second.
	The side and shape changing handles follow these."
	| center v1 hExtent holder |
	center := vertices average rounded.
	hExtent := 8 @ 8.
	v1 := vertices first.
	holder := {(EllipseMorph
				newBounds: (Rectangle center: v1 extent: hExtent)
				color: Color yellow)
				setBalloonText: 'Move me to adjust size. Shift move to adjust pointiness'. (EllipseMorph
				newBounds: (Rectangle center: center extent: hExtent)
				color: Color yellow)
				setBalloonText: 'Move me to adjust position'}.
	holder
		with: {#outside. #center}
		do: [:handle :which | handle
				on: #mouseDown
				send: #dragVertex:event:fromHandle:
				to: self
				withValue: which;
				
				on: #mouseMove
				send: #dragVertex:event:fromHandle:
				to: self
				withValue: which].
	handles addAll: holder