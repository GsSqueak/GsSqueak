testing
endsWithReturn
	"Answer true if the last statement of this lock is a return."

	^ statements isEmpty not
		and: [statements last isReturn
				or: [statements last isReturningIf]]