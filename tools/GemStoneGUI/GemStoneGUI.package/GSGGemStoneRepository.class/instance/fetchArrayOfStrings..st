querying
fetchArrayOfStrings: queryCode

	^ self fetch: #Array -> {#String} query: queryCode