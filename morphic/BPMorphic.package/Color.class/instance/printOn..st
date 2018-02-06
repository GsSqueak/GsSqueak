printing
printOn: aStream 
	self name
		ifNotNil: [:_gsSqueakTemp_name | ^ aStream nextPutAll: 'Color ';
				 nextPutAll: _gsSqueakTemp_name].
	self storeOn: aStream