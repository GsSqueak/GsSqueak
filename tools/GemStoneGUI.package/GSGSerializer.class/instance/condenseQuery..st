query construction
condenseQuery: query

	| parseTree |
	parseTree := [Parser new parse: query class: Object]
					on: Error
					do: [^ query].
	^ parseTree generate decompile decompileString