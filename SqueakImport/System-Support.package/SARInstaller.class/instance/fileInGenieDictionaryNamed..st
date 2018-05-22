client services
fileInGenieDictionaryNamed: memberName 
	"This is to be used from preamble/postscript code to file in zip 
	members as Genie gesture dictionaries.
	Answers a dictionary."

	| member object crDictionary stream |

	crDictionary := Smalltalk at: #CRDictionary ifAbsent: [ ^self error: 'Genie not installed' ].
	"don't know how to recursively load"

	member := self memberNamed: memberName.
	member ifNil: [ ^self errorNoSuchMember: memberName ].

	stream := ReferenceStream on: member contentStream.

	object := [ stream next ]
		on: Error do: 
		[:ex |  stream close.
		self inform: 'Error on loading: ' , ex description. ^ nil ].
	stream close.

	(object notNil and: [object name isEmptyOrNil])
		ifTrue: [object := crDictionary name: object storedName].

	self installed: member.

	^ object
