private
fetchISOCountry
	"Locale current fetchISOCountry"
	| countryCode |
	countryCode := self primCountry
				ifNil: [^ nil].
	^ countryCode copyUpTo: 0 asCharacter