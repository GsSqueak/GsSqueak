querying
fetchArrayOfSymbols: queryCode

	^ self fetch: #Array -> {#Symbol} query: queryCode