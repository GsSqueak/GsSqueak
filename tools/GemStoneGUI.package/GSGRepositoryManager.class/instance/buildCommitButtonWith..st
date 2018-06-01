toolbuilder
buildCommitButtonWith: builder

	^ builder pluggableActionButtonSpec new
		model: self;
		label: 'Commit';
		help: 'Commit the current transaction.';
		action: #commitTransaction;
		yourself