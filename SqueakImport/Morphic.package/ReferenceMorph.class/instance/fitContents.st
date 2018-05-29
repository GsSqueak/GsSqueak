misc
fitContents
	submorphs size = 1 ifTrue:
		[self extent: submorphs first extent + (2 * self borderWidth).
		submorphs first position: self position + self borderWidth]