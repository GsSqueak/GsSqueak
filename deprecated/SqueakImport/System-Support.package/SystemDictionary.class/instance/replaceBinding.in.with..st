classes and traits
replaceBinding: oldBinding in: aClass with: newBinding
	"Replace oldBinding with newBinding in aClass. This method is expected to be used during the removal of aClass."

	aClass methodsDo: [ :method |
		1 to: method numLiterals do: [ :index |
			(method literalAt: index) == oldBinding ifTrue: [
				method literalAt: index put: newBinding ] ] ]