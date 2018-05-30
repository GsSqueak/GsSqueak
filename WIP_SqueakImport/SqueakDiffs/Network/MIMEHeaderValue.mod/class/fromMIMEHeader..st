instance creation
fromMIMEHeader: aString
	"This is the value of a MIME header field and so is parsed to extract the various parts"

	| parts newValue parms |

	newValue := self new.

	parts := ReadStream on: (aString findTokens: ';').
	newValue mainValue: parts next.
	parms := Dictionary new.
	parts do: 
		[:e | | separatorPos parmName parmValue | 
		separatorPos := e findAnySubStr: '=' startingAt: 1. 
		separatorPos <= e size
			ifTrue: 
				[parmName := (e copyFrom: 1 to: separatorPos - 1) withBlanksTrimmed asLowercase.
				parmValue := (e copyFrom: separatorPos + 1 to: e size) withBlanksTrimmed withoutQuoting.
				parms at: parmName put: parmValue]].
	newValue parameters: parms.
	^ newValue
