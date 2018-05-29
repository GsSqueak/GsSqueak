tool builder
buildWith: builder

	| window fieldSpec valueSpec msgSpec codeSpec |
	
	window := builder pluggableWindowSpec new
		model: self;
		children: OrderedCollection new;
		yourself.
		
	fieldSpec := builder pluggableListSpec new
		model: self;
		list: #fieldList;
		getIndex: #selectionIndex;
		setIndex: #toggleIndex:;
		menu: #fieldListMenu:;
		frame: (0@0 corner: 0.3@0.5).
	
	valueSpec := builder pluggableTextSpec new
		model: self;
		getText: #contents;
		setText: #accept:;
		menu: #codePaneMenu:shifted:;
		frame: (0.3@0 corner: 1.0@0.5).

	msgSpec := builder pluggableListSpec new
		model: self;
		list: #msgList;
		getIndex: #msgListIndex;
		setIndex: #msgListIndex:;
		menu: #msgListMenu;
		frame: (0@0.5 corner: 0.3@1.0).
		
	codeSpec := builder pluggableTextSpec new
		model: self;
		getText: #msgText;
		setText: #msgAccept:from:;
		menu: #msgPaneMenu:shifted:;
		frame: (0.3@0.5 corner: 1.0@1.0).
	
	window children addAll: {fieldSpec. valueSpec. msgSpec. codeSpec}.
	^ builder build: window