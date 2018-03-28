toolbuilder
buildWorkspaceButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Open Workspace';
			help: 'Open a workspace capable of executing code for the current session';
			action: #openWorkspace.
	^ buttonSpec