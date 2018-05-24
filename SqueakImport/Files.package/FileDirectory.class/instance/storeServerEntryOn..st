private
storeServerEntryOn: stream
	
	stream
		nextPutAll: 'name:'; tab; nextPutAll: self localName; cr;
		nextPutAll: 'directory:'; tab; nextPutAll: self pathName; cr;
		nextPutAll: 'type:'; tab; nextPutAll: 'file'; cr