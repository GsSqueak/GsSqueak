private
preference: prefName categoryList: categoryList description: helpString type: typeSymbol
	"Create a preference for a preference pragma in a method."
	
	^ PragmaPreference new
		 name: prefName
		 defaultValue: nil	"always nil"
		 helpString: helpString
		 localToProject: false "governed by the method"
		 categoryList: categoryList
		 changeInformee: nil
		 changeSelector: nil
		 type: typeSymbol