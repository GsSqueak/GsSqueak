toolbuilder
buildSwitchesWith: builder
	"Build the instance/comment/class switch"

	| panelSpec i q c |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.

	i := builder pluggableButtonSpec new.
	i 
			model: self;
			label: 'instance';
			help: 'Show instance-side methods' translated;
			state: #instanceMessagesIndicated; 
			action: #indicateInstanceMessages.

	q := builder pluggableButtonSpec new.
	q 
			model: self;
			horizontalResizing: #shrinkWrap;
			label: '?';
			help: 'Cycle between definition, comment, and hierarchy view' translated; 
			state: #classCommentIndicated; 
			action: #plusButtonHit.

	c := builder pluggableButtonSpec new.
	c 
			model: self;
			label: 'class';
			help: 'Show class-side methods' translated;
			state: #classMessagesIndicated; 
			action: #indicateClassMessages.
			
	panelSpec children addAll: {
		i. c.
		builder pluggableSpacerSpec new.
		q
	}.

	^panelSpec