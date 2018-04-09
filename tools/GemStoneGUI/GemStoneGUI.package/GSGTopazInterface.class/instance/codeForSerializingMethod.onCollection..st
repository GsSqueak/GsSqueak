helpers
codeForSerializingMethod: methodCreationCode onCollection: collectionName

	^ '[:col :meth |
		col add: meth inClass name.
		col add: meth selector.
		col add: meth environmentId.
		col add: (meth inClass categoryOfSelector: meth selector environmentId: meth environmentId)] value: (' , collectionName , ') value: (' , methodCreationCode , ')'