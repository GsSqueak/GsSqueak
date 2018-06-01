enumeration
valuesAndCountsWithIndexDo: aBlock

	1 to: self values size do: [:index |
		aBlock
			value: (self values at: index)
			value: (self counts at: index)
			value: index].	