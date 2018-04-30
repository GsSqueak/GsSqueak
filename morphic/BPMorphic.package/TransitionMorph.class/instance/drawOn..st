drawing
drawOn: aCanvas 
	"During the transition process, the reveal and obscure areas will be
	invalidated, so we should be drawing on a canvas that clips to only
	the changing region."
	(stepNumber between: 1 and: nSteps)
		ifFalse: [^ self].
	effect = #slideOver
		ifTrue: [^ self drawSlideOverOn: aCanvas].
	effect = #slideBoth
		ifTrue: [^ self drawSlideBothOn: aCanvas].
	effect = #slideAway
		ifTrue: [^ self drawSlideAwayOn: aCanvas].
	effect = #slideBorder
		ifTrue: [^ self drawSlideBorderOn: aCanvas].
	effect = #pageForward
		ifTrue: [^ self drawPageForwardOn: aCanvas].
	effect = #pageBack
		ifTrue: [^ self drawPageBackOn: aCanvas].
	effect = #frenchDoor
		ifTrue: [^ self drawFrenchDoorOn: aCanvas].
	effect = #zoomFrame
		ifTrue: [^ self drawZoomFrameOn: aCanvas].
	effect = #zoom
		ifTrue: [^ self drawZoomOn: aCanvas].
	effect = #dissolve
		ifTrue: [^ self drawDissolveOn: aCanvas]