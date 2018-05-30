fields
fieldsFrom: aStream do: aBlock
	"Invoke the given block with each of the header fields from the given stream. The block arguments are the field name and value. The streams position is left right after the empty line separating header and body.
	Duplicate of code in MailMessage"

	| savedLine line s |
	savedLine := aStream nextLine.
	[aStream atEnd] whileFalse: [
		line := savedLine.
		(line isEmpty) ifTrue: [^self].  "quit when we hit a blank line"
		[savedLine := aStream nextLine.
		 savedLine notNil and: [savedLine notEmpty] and: [savedLine first isSeparator]] whileTrue: [
			"lines starting with white space are continuation lines"
			s := ReadStream on: savedLine.
			s skipSeparators.
			line := line, ' ', s upToEnd].
		self reportField: line withBlanksTrimmed to: aBlock].

	"process final header line of a body-less message"
	(savedLine isEmpty) ifFalse: [self reportField: savedLine withBlanksTrimmed to: aBlock].
