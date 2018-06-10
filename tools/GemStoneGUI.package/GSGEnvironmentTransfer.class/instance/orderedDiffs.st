public
orderedDiffs

	| diffOrder |
	diffOrder := self diffs groupBy: [:diff | diff precedence].
	diffOrder keys sorted