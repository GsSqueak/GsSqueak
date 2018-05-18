ui creation
createDialogBoxMorphicView
	| m |
	m := MorphicModel new
		layoutPolicy: ProportionalLayout new;
		color: (Color r: 0.9 g: 0.9 b: 0.9);
		borderColor: Color gray;
		borderWidth: 1;
		layoutInset: 0;
		extent: 600@400.
	self setMorphicView: m.
	^m