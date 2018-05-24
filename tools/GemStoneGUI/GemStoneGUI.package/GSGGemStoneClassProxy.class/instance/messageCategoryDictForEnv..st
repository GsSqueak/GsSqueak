interface
messageCategoryDictForEnv: envId

	| query |
	query := '{1} _unifiedCategorys: {2}'
				format: {
					self codeReferencingMe.
					envId}.
	^ self repository fetch: #Dictionary -> {#Symbol . #Array -> {#Symbol}} query: query