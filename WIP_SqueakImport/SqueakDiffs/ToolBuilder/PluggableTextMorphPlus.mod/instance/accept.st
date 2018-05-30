updating
accept
	super accept.
	acceptAction ifNotNil:[acceptAction value: textMorph asText].