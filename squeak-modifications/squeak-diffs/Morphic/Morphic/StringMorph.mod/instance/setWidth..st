accessing
setWidth: width

	self extent: width @ (font ifNil: [TextStyle defaultFont]) height