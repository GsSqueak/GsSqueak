experimental
loadHashTable: strm
	| entry |
	hashTable := IntegerArray  ofSize: hashTableSize.
	strm binary.
	strm position: hashTableOffset.
	1 to: hashTableSize do: [:index |
		entry := self nextInt32From: strm.
		hashTable at:  index put: entry.
	]