private
drawPostscriptContext: subCanvas
	| contents |
	(contents := subCanvas contents) ifNil: [^ self].
	^ target comment: ' sub-canvas start';
		preserveStateDuring: [:inner | inner print: contents];
		comment: ' sub-canvas stop'.	

