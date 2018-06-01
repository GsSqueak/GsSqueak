ui-building
buildWith: builder
	| listSpec windowSpec |
	windowSpec := builder pluggableWindowSpec new
		model: self;
		label: 'Pointer Finder'.

	listSpec := builder pluggableListSpec new
		model: self;
		frame: (0@0 corner: 1@1);
		list: #pointerList;
		getIndex: #pointerListIndex;
		setIndex: #pointerListIndex:;
		menu: #menu:shifted:;
		keyPress: #arrowKey:from:;
		doubleClick: #inspectObject;
		yourself.

	windowSpec children: {listSpec}.
		
	^ builder build: windowSpec.