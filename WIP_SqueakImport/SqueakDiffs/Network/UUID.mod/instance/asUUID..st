converting
asUUID: aString
	| stream token byte |
	stream := ReadStream on: (aString copyReplaceAll: '-' with: '') asUppercase.
	1 to: stream size/2 do: [:i | 
		token := stream next: 2.
		byte := Integer readFrom: (ReadStream on: token ) base: 16.
		self at: i put: byte].
	^self
