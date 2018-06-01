toolbuilder
buildExploreButtonWith: builder
	
	^ builder pluggableButtonSpec new
		model: self;
		label: 'explore';
		action: #exploreObject;
		help: 'Switch to an explorer tool'