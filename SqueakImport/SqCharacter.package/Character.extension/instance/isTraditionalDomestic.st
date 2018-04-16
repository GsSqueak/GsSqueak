*SqCharacter-testing
isTraditionalDomestic
	"Yoshiki's note about #isUnicode says:
		[This method] is for the backward compatibility when we had domestic
		traditional encodings for CJK languages.  To support loading the
		projects in traditional domestic encodings (From Nihongo4), and load
		some changesets.  Once we decided to get rid of classes like JISX0208
		from the EncodedCharSet table, the need for isUnicode will not be
		necessary.
	I (Andreas) decided to change the name from isUnicode to #isTraditionalDomestic
	since I found isUnicode to be horribly confusing (how could the character *not*
	be Unicode after all?). But still, we should remove this method in due time."
	^ (self encodedCharSet isKindOf: LanguageEnvironment class) not
