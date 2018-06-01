toolbuilder
buildAbortButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Abort';
		help: 'Abort the current transaction.';
		action: #abortTransaction;
		yourself