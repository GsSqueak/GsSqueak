toolbuilder
buildDevkitPathInputWith: builder

	| textSpec |
	textSpec := builder pluggableInputFieldSpec new.
	textSpec
		model: self;
		help: 'Path of your GsDevKit_home folder (e.g. ''/home/stlutz/BP/GsDevKit_home'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #devkitPath;
		editText: #devkitPath:;
		setText: #devkitPath:.
	^ textSpec