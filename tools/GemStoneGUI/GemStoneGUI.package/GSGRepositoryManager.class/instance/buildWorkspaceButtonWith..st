toolbuilder
buildWorkspaceButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Open Browser on SqueakEnvironment';
		help: 'Open a workspace capable of executing code for the current session';
		action: #openWorkspace;
		yourself