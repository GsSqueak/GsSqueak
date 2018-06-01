toolbuilder
buildWith: builder

	| dialogSpec choicesSpec |
	dialogSpec := builder pluggableDialogSpec new
		model: self;
		extent: self initialExtent;
		title: #title;
		children: OrderedCollection new;
		buttons: OrderedCollection new.
		
	choicesSpec := builder pluggableMultiSelectionListSpec new
		model: self;
		list: #labels;
		setIndex: #selectedIndex:;
		getIndex: #selectedIndex;
		setSelectionList: #selectionAt:put:;
		getSelectionList: #selectionAt:;
		frame: (0@0 corner: 1@1).
	dialogSpec children add: choicesSpec.
	
	"Buttons"
	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self;
			label: 'accept';
			color: (self userInterfaceTheme okColor ifNil: [Color r: 0.49 g: 0.749 b: 0.49]);
			action: #accept).
			
	dialogSpec buttons add: (
		builder pluggableButtonSpec new
			model: self;
			label: 'cancel';
			color: (self userInterfaceTheme cancelColor ifNil: [Color r: 1 g: 0.6 b: 0.588]);
			action: #cancel).
				
	^ builder build: dialogSpec