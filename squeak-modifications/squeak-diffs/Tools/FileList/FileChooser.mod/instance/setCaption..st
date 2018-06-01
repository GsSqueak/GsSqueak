ui creation
setCaption: aString 
	| frame |
	caption ifNil: 
			[caption := StringMorph new.
			self captionPane addMorph: caption].
	caption contents: aString.
	frame := LayoutFrame new.
	frame
		leftFraction: 0.5;
		topFraction: 0.5;
		leftOffset: caption width negated // 2;
		topOffset: caption height negated // 2.
	caption layoutFrame: frame