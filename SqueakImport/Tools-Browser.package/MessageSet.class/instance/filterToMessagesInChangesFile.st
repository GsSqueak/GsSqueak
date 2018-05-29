filtering
filterToMessagesInChangesFile
	"Filter down only to messages whose source code risides in the Changes file.  This allows one to ignore long-standing methods that live in the .sources file."

	
	self filterFrom:
		[:aClass :aSelector | | cm |
			aClass notNil and: [aSelector notNil and:
				[(self class isPseudoSelector: aSelector) not and:
					[(cm := aClass compiledMethodAt: aSelector ifAbsent: [nil]) notNil and:
					[cm fileIndex ~= 1]]]]]