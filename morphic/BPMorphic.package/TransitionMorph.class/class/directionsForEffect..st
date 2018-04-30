available effects
directionsForEffect: eff 
	"All these arrays are ordered so inverse is atWrap: size//2."
	#('right' 'down right' 'down' 'down left' 'left' 'up left' 'up' 'up right' 'in' 'in h' 'out' 'out h') translatedNoop.
	(#(#slideOver #slideBoth #slideAway #slideBorder) includes: eff)
		ifTrue: [^ #(#right #downRight #down #downLeft #left #upLeft #up #upRight)].
	(#(#pageForward #pageBack) includes: eff)
		ifTrue: [^ #(#right #down #left #up)].
	(#(#frenchDoor) includes: eff)
		ifTrue: [^ #(#in #inH #out #outH)].
	(#(#zoomFrame #zoom) includes: eff)
		ifTrue: [^ #(#in #out)].
	^ Array new