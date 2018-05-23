loading
categoriesMatching: aString

	^ SystemOrganization categories select: [:category |
			self category: aString matches: category]