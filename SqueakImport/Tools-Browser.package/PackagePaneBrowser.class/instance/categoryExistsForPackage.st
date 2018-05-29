package list
categoryExistsForPackage
	^ self hasPackageSelected
		and: [(systemOrganizer categories indexOf: self package asSymbol) ~= 0]
