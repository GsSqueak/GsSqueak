initialization
createBody
	| _gsSqueakTemp_body |
	_gsSqueakTemp_body := Morph new changeTableLayout; hResizing: #shrinkWrap; vResizing: #shrinkWrap; listDirection: #topToBottom; cellPositioning: #leftCenter;
				layoutInset: (10 @ 5 corner: 10 @ 10); cellInset: 5; color: Color transparent; yourself.
	_gsSqueakTemp_body addAllMorphs: {self createMessage: ''. self createPane. self createButtonRow. self createFilter}.
	self addMorphBack: _gsSqueakTemp_body