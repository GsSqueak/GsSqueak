formatting
textArea
	^(self offsetRect origin + (0.0@self headerHeight)) corner:
		(self realPaperSize - self offsetRect corner - (0.0@self footerHeight))