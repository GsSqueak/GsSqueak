i/o
objectFromStreamedRepresentation: someBytes

	| file |

	file := RWBinaryOrTextStream with: someBytes.
	file reset.
	^file fileInObjectAndCode