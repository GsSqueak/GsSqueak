accessing
done: amountDone
	self progress value contents: ((amountDone min: 1.0) max: 0.0).
	self currentWorld displayWorld