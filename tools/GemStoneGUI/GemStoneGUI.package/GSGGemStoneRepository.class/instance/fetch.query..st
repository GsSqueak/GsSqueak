querying
fetch: description query: queryCode

	| query result |
	query := GSGSerializer serialize: queryCode using: description.
	result := self executeString: query.
	^ GSGSerializer deserialize: result