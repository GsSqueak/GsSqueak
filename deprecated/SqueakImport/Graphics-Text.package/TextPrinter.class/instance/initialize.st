initialize
initialize
	self paperSize: self defaultPaperSize.
	self resolution: self defaultResolution.
	self blackAndWhite.
	self landscape: false.
	self offsetRect: (1.0@1.0 corner: 1.0@1.0).
	self columns: 1.
	self noHeader: false.
	self noFooter: false.
	self documentTitle: 'Squeak Document (from ', Date today printString,')'.