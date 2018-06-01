label
getRawLabel
	| contentsFit |
	contentsFit := label duplicate fitContents.
	contentsFit extent: (label extent x min: contentsFit extent x) @ contentsFit extent y.
	
	^ contentsFit
