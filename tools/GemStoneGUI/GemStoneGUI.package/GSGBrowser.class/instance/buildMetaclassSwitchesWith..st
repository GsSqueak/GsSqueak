toolbuilder
buildMetaclassSwitchesWith: builder
	"Build the instance/class side switch"

	| panelSpec instanceSide classSide |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.
		
	instanceSide := builder pluggableButtonSpec new
			model: self;
			label: 'instance';
			help: 'Show instance-side methods' translated;
			state: #instanceMessagesIndicated; 
			action: #indicateInstanceMessages;
			yourself.

	classSide := builder pluggableButtonSpec new
			model: self;
			label: 'class';
			help: 'Show class-side methods' translated;
			state: #classMessagesIndicated; 
			action: #indicateClassMessages;
			yourself.
			
	panelSpec children addAll: {
		instanceSide. classSide
	}.

	^ panelSpec