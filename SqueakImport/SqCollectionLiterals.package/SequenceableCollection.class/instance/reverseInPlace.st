*SqCollectionLiterals-*SqCollectionLiterals-converting
reverseInPlace
	"Reverse this collection in place."
	
	| start end |
	start := 1.
	end := self size.
	[ start < end ] whileTrue: [
		| temp |
		temp := self at: start.
		self
			at: start put: (self at: end);
			at: end put: temp.
		start := start + 1.
		end := end - 1 ]
