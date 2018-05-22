accessing
baseUrl: aString
	baseUrl := aString.
	baseUrl isEmpty ifFalse:[
		baseUrl last = $/ ifFalse:[baseUrl := baseUrl copyWith: $/].
	].