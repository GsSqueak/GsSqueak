Postscript Canvases
fullDrawPostscriptOn: aCanvas

	| s |
	s := TextMorph new 
		beAllFont: (TextStyle default fontOfSize: 30);
		contentsAsIs: '   Drawing page ',pageNumber printString,' of ',totalPages printString,'     '.
	s layoutChanged; fullBounds.
	s := AlignmentMorph newRow
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		addMorph: s;
		color: Color yellow.
	s position: Display center - (s width // 2 @ 0).
	Project current world addMorphFront: s;
		displayWorld.
	printSpecs drawAsBitmapFlag ifTrue: [
		aCanvas paintImage: self pageAsForm at: 0@0
	] ifFalse: [
		aCanvas 
			translateTo: bounds origin negated 
			clippingTo: (0@0 extent: bounds extent) 
			during: [ :c |
				pasteUp fullDrawForPrintingOn: c
			].
	].
	s delete.

