public
transfer

	| diffOrder |
	diffOrder := self diffs groupBy: [:diff | self phaseOf: diff].
	