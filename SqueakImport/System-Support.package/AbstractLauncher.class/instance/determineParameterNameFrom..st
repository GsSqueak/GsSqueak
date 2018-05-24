private
determineParameterNameFrom: alternateParameterNames
	"Determine which of the given alternate parameter names is actually used."

	^alternateParameterNames detect: [:each | self includesParameter: each asUppercase] ifNone: [nil] 