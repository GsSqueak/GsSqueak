initialization
createInteriorTransform

	| innerPasteUp tm |
	innerPasteUp := PasteUpMorph new.
	innerPasteUp 
		borderWidth: 0;
		minHeight: 100;
		minWidth: 100;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		position: 0@0;
		extent: 100@100.
	tm := TransformationB2Morph new.
	tm setProperty: #rotationCenter toValue: 0@0.
	tm useRegularWarpBlt: usingBalloon not.
	self addMorph: tm.
	tm addMorph: innerPasteUp.
	tm beSticky.
	innerPasteUp beSticky.
	tm
		scale: 1.0;
		offset: 0@0.
	