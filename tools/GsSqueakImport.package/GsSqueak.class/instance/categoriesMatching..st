loading
categoriesMatching: prefix

	^ SystemOrganization categories select: [:category |
			self category: category matches: prefix]