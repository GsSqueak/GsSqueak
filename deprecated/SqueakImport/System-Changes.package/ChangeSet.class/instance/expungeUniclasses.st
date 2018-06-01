moving changes
expungeUniclasses

	changeRecords keysAndValuesRemove:
		[:className :classRecord | className endsWithDigit]