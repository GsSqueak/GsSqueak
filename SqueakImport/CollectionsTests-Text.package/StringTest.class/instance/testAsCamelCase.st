tests - converting
testAsCamelCase
	self assert: 'CamelCase' equals: 'camel case' asCamelCase.
	self assert: 'CamelCase' equals: 'Camel Case' asCamelCase.
	self assert: 'CamelCase' equals: 'CamelCase' asCamelCase.
	self assert: 'CamelCase' equals: 'camelCase' asCamelCase.
	self assert:  'AMan,APlan,ACanal,Panama' equals: 'A man, a plan, a canal, panama' asCamelCase.
	self assert:  'Here123should%Be6TheName6OfTheMethod' equals: 'Here 123should % be 6 the name6 of the method' asCamelCase.