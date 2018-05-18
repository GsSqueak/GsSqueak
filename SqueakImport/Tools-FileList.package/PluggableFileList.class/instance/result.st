accepting/cancelling
result

	accepted ifFalse: [^nil].
	^resultBlock value: directory value: fileName