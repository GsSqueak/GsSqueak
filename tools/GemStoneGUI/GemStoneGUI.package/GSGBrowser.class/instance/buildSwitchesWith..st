toolbuilder
buildSwitchesWith: builder
	"Build the instance/comment/class switch"

	| panelSpec i q c e |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.
		
	e := builder pluggableInputFieldSpec new
		model: self;
		help: '      Change the environment for looking up selectors & class hierarchies';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		horizontalResizing: #shrinkWrap;
		minimumWidth: 30;
		getText: #envIdText;
		setText: #envIdText:;
		editText: #envIdText:;
		yourself.		

	i := builder pluggableButtonSpec new
			model: self;
			label: 'instance';
			help: 'Show instance-side methods' translated;
			state: #instanceMessagesIndicated; 
			action: #indicateInstanceMessages;
			yourself.

	q := builder pluggableButtonSpec new
			model: self;
			horizontalResizing: #shrinkWrap;
			label: '?';
			help: 'Cycle between definition and comment' translated; 
			state: #classCommentIndicated; 
			action: #plusButtonHit;
			yourself.

	c := builder pluggableButtonSpec new
			model: self;
			label: 'class';
			help: 'Show class-side methods' translated;
			state: #classMessagesIndicated; 
			action: #indicateClassMessages;
			yourself.
			
	panelSpec children addAll: {
		i. c.
		builder pluggableSpacerSpec new.
		q .
		builder pluggableSpacerSpec new.
		e
	}.

	^ panelSpec