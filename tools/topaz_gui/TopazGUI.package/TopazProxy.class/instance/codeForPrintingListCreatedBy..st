helpers
codeForPrintingListCreatedBy: collectionCreationCode

	^ 'String streamContents: [:stream | (' , collectionCreationCode , ') asStringOn: stream delimiter: Character lf asString]'