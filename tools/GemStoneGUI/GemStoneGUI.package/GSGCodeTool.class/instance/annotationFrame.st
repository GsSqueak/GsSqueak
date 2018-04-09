toolbuilder
annotationFrame

	^ LayoutFrame new
		leftFraction: 0 offset: 0;
		topFraction: 1 offset: self annotationPaneHeight negated;
		rightFraction: 1 offset: 0;
		bottomFraction: 1 offset: 0