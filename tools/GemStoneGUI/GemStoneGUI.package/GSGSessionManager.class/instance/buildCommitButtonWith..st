toolbuilder
buildCommitButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Commit';
			help: 'Commit the current transaction.';
			action: #commitTransaction.
	^ buttonSpec