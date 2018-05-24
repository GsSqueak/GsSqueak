initialization
createPane

	^ paneMorph := BorderedMorph new
		name: 'Content';
		changeProportionalLayout;
		hResizing: #rigid;
		vResizing: #rigid;
		layoutInset: 0;
		color: Color transparent;
		borderWidth: 0;
		yourself.