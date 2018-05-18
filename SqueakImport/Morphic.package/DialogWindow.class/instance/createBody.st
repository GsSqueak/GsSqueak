initialization
createBody

	| body |
	body := Morph new
		name: 'Body';
		changeTableLayout;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		listDirection: #topToBottom;
		cellPositioning: #leftCenter;
		layoutInset: (10@5 corner: 10@10);
		cellInset: 5;
		color: Color transparent;
		yourself.
	body addAllMorphs: {self createMessage: ''. self createPane. self createButtonRow. self createFilter}.
	self addMorphBack: body.