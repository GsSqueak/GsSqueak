toolbuilder
buildClassContentSwitchesWith: builder
	"Build the class comment/hierarchy/definition switch"

	| panelSpec definition comment hierarchy |
	panelSpec := builder pluggablePanelSpec new
		layout: #horizontal;
		spacing: -1;
		children: OrderedCollection new;
		yourself.
		
	definition := builder pluggableButtonSpec new
			model: self;
			label: 'definition';
			help: 'Show class definition';
			state: #classDefinitionIndicated; 
			action: #indicateClassDefinition;
			yourself.

	comment := builder pluggableButtonSpec new
			model: self;
			label: 'comment';
			help: 'Show class comment';
			state: #classCommentIndicated; 
			action: #indicateClassComment;
			yourself.
	
	hierarchy := builder pluggableButtonSpec new
			model: self;
			label: 'hierarchy';
			help: 'Show class hierarchy';
			state: #classHierarchyIndicated; 
			action: #indicateClassHierarchy;
			yourself.
	
	panelSpec children addAll: {
		definition. comment. hierarchy
	}.

	^ panelSpec