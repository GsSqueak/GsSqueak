*Network-Url
asMailMessageString
	"According to RFC 822: https://tools.ietf.org/html/rfc822#section-5"
	
	| result |
	result := WriteStream on: (String new: 30).
	
	result 
		nextPutAll: self dayOfWeekAbbreviation;
		nextPut: $,;
		space;
		nextPutAll: (self dayOfMonth asString padded: #left to: 2 with: $0);
		space;
		nextPutAll: self monthAbbreviation;
		space;
		nextPutAll: self year asString;
		space.
		
	self printHMSOn: result.
	
	result space.
	
	result 
		nextPutAll: (self offset negative ifTrue: ['-'] ifFalse: ['+']);
		nextPutAll: (self offset abs hours asString padded: #left to: 2 with: $0);
		nextPutAll: (self offset abs minutes asString padded: #left to: 2 with: $0).
	
	^ result contents