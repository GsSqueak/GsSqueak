toolbuilder
createFieldInputNamed: fieldLabelGetter getter: fieldGetter setter: fieldSetter with: aBuilder

	^ aBuilder pluggableInputFieldSpec new
		model: self;
		indicateUnacceptedChanges: false;
		getText: fieldGetter;
		setText: fieldSetter;
		frame: (LayoutFrame new
			leftFraction: 0 offset: 0;
			topFraction: 0 offset: 0;
			rightFraction: 1 offset: 0;
			bottomFraction: 0 offset: self lineHeight);
		help: fieldLabelGetter;
		yourself