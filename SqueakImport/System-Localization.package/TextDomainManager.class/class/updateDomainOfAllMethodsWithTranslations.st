private
updateDomainOfAllMethodsWithTranslations
	self allMethodsWithTranslations do: [:each |
		self updateDomainOfMethod: each]