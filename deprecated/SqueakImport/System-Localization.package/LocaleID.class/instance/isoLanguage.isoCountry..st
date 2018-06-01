initialize
isoLanguage: langString isoCountry: countryStringOrNil 
	isoLanguage := langString.
	isoCountry := countryStringOrNil ifNil: (self class countryFor: langString)