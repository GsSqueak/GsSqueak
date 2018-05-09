utilities
strictUtf8Conversions
	"Preference setter for strict utf-8 conversions"

	<preference: 'Strict utf8 conversions'
		category: 'general' "should this be localization?"
		description: 'If true, invalid utf-8 input will raise errors. If false, invalid utf-8 input will be allowed to pass through the conversion unchanged'
		type: #Boolean>
	
	^StrictUtf8Conversions ifNil:[true]
