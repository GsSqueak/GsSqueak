interface
messageCategoryDict

	| query |
	query := '{1} _unifiedCategorys: {2}'
				format: {
					self codeReferencingMe.
					self environmentId}.
	^ self repository fetch: #Dictionary -> {#Symbol . #Array -> {#Symbol}} query: query