tests - internet
testDecodeMimeHeader

	self 
		assert: 'Schöne Grüße'
		equals: '=?utf-8?Q?Sch=C3=B6ne_Gr=C3=BC=C3=9Fe?=' decodeMimeHeader