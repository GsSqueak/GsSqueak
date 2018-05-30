fields
reportField: aString to: aBlock
	"Evaluate the given block with the field name a value in the given field. Do nothing if the field is malformed.
	Duplicate of code in MailMessage"

	| s fieldName fieldValue |
	(aString includes: $:) ifFalse: [^self].
	s := ReadStream on: aString.
	fieldName := (s upTo: $:) asLowercase.	"fieldname must be lowercase"
	fieldValue := s upToEnd withBlanksTrimmed.
	fieldValue isEmpty ifFalse: [aBlock value: fieldName value: fieldValue].
