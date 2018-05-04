debug printing
printMemField: memField name: name size: length
	<var: #memField type: #usqInt>
	<var: #name type: #'char *'>
	self print: name; tab; printHexPtr: (self cCoerce: memField to: 'char *');
		printChar: $/;
		printNum: memField - (self cCode: '(usqInt) sqMemoryBase');
		print: ' sz: '; printHex: length.
	length ~= 0 ifTrue:
		[self printChar: $/; printNum: length].
	self cr