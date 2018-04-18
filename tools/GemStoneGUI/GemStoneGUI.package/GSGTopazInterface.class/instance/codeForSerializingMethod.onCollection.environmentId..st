helpers
codeForSerializingMethod: methodCreationCode onCollection: collectionName environmentId: envId

	^ '[:col :meth |
		col add: meth inClass name.
		col add: meth selector.
		col add: ', envId, '.
		col add: (meth inClass categoryOfSelector: meth selector environmentId: meth environmentId)] value: (' , collectionName , ') value: (' , methodCreationCode , ')'