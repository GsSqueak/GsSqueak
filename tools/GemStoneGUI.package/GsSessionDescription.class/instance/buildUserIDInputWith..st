toolbuilder
buildUserIDInputWith: builder

	^ builder pluggableInputFieldSpec new
		model: self;
		help: 'Name of the user you want to login as (e.g. ''DataCurator'')';
		askBeforeDiscardingEdits: false;
		indicateUnacceptedChanges: false;
		getText: #userID;
		setText: #userID:;
		yourself