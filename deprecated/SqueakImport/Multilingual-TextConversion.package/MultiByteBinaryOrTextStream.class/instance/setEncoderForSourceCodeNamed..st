fileIn/Out
setEncoderForSourceCodeNamed: streamName

	| l |
	l := streamName asLowercase.
"	((l endsWith: FileStream multiCs) or: [
		(l endsWith: FileStream multiSt) or: [
			(l endsWith: (FileStream multiSt, '.gz')) or: [
				(l endsWith: (FileStream multiCs, '.gz'))]]]) ifTrue: [
					self converter: UTF8TextConverter new.
					^ self.
	].
"
	((l endsWith: FileStream cs) or: [
		(l endsWith: FileStream st) or: [
			(l endsWith: (FileStream st, '.gz')) or: [
				(l endsWith: (FileStream cs, '.gz'))]]]) ifTrue: [
					self converter: MacRomanTextConverter new.
					^ self.
	].

	self converter: UTF8TextConverter new.
