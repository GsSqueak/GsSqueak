miscellaneous
versions
	"Return a VersionsBrowser (containing a list of ChangeRecords) of older versions of this method."

	^ VersionsBrowser new scanVersionsOf: self compiledMethod
			class: self selectedClass 
			meta: methodClass isMeta 
			category: self selectedMessageCategoryName
				"(classOfMethod whichCategoryIncludesSelector: selectorOfMethod)"
			selector: methodSelector