building
buildWith: builder

	| dialogSpec searchBarHeight listSpec fieldSpec |
	
	searchBarHeight := Preferences standardDefaultTextFont height * 1.75.
	
	dialogSpec := builder pluggableDialogSpec new
		model: self;
		title: #title;
		closeAction: #closed;
		extent: self initialExtent;
		autoCancel: true; "Behave like a pop-up menu. Historical reasons."
		children: OrderedCollection new;
		buttons: OrderedCollection new;
		yourself.
	
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #items; 
		getIndex: #selectedIndex; 
		setIndex: #selectedIndex:; 
		doubleClick: #accept;
		"keystrokePreview: #keyStrokeFromList:;"
		autoDeselect: false;
		filterableList: true;
		clearFilterAutomatically: false;
		name: #list;
		frame: (LayoutFrame fractions: (0@0 corner: 1@1) offsets: (0@searchBarHeight corner: 0@0)).
	dialogSpec children add: listSpec.
	
	fieldSpec := builder pluggableInputFieldSpec new.
	fieldSpec 
		model: self;
		getText: #searchText;
		editText: #searchText:;
		setText: #acceptText:;
		selection: #textSelection;
		menu: nil;
		indicateUnacceptedChanges: false;
		askBeforeDiscardingEdits: false;
		help: (self addAllowed ifTrue: ['Type new or filter existing...' translated] ifFalse: ['Type to filter existing...' translated]);
		frame: (LayoutFrame fractions: (0@0 corner: 1@0) offsets: (0@0 corner: 0@searchBarHeight)).
	dialogSpec children add: fieldSpec.
	
	"Buttons"
	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self; 
			label: #acceptLabel;
			action: #accept;
			enabled: #canAcceptOrAdd;
			color: #acceptColor).

	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self; 
			label: 'Cancel';
			action: #cancel;
			color: #cancelColor).
		
	dialogMorph := builder build: dialogSpec.
	dialogMorph addKeyboardCaptureFilter: self.
	listMorph := builder widgetAt: #list.
	listMorph allowEmptyFilterResult: true.
	
	^ dialogMorph