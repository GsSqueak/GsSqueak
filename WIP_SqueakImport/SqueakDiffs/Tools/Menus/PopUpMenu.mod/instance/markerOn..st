marker adjustment
markerOn: aPoint 
	"The item whose bounding area contains aPoint should be marked as 
	selected. Highlight its area and set the selection to its index."

	selection = 0 | (marker containsPoint: aPoint) not 
		ifTrue: [selection = 0 & (marker containsPoint: aPoint)
					ifTrue: [Display reverse: marker]
					ifFalse: 
						[selection > 0 ifTrue: [Display reverse: marker].
						marker := 
							marker 
								align: marker topLeft 
								with: marker left @ (self markerTop: aPoint).
						Display reverse: marker]].
	selection := marker top - frame top // marker height + 1