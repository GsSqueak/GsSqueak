accessing
borderStyle
	^(self valueOfProperty: #borderStyle ifAbsent:[BorderStyle default]) trackColorFrom: self