indenting
indentEverything

	messageList do: [ :each | each stringVersion: (self indentionPrefixOfSize: 1), each asString ]
