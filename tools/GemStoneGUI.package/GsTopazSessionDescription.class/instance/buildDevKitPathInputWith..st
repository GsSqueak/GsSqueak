toolbuilder
buildDevKitPathInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'Path of your GsDevKit_home folder (e.g. ''/home/stlutz/BP/GsDevKit_home'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #devKitPath;
		setText: #devKitPath:;
		yourself