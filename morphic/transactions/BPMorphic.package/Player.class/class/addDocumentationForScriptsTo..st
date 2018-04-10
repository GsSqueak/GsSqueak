user-scripted subclasses
addDocumentationForScriptsTo: aStream 
	"Add documentation for every script in the receiver to the stream"
	self scripts
		do: [:aScript | aScript selector
				ifNotNil: [aStream cr; cr.
					aStream nextPutAll: self typicalInstanceName , '.'.
					self
						printMethodChunk: aScript selector
						withPreamble: false
						on: aStream
						moveSource: false
						toFile: nil.
					aStream position: aStream position - 2]].
	self scripts size = 0
		ifTrue: [aStream cr; tab; nextPutAll: 'has no scripts']