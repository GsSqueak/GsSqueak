class initialization
initialize
"Set up the legal chars map for filenames. May need extending for unicode etc.
Basic rule is that any char legal for use in filenames will have a non-nil entry in this array; except for space, this is the same character. Space is transcoded to a char 160 to be a 'hard space' "
"AcornFileDirectory initialize"
	LegalCharMap := Array new: 256.
	Character alphabet do:[:c|
		| aVal |
		LegalCharMap at: c asciiValue +1  put: c.
		LegalCharMap at: (aVal := c asUppercase) asciiValue +1 put: aVal].
	'`!()-_=+[{]};~,./1234567890' do:[:c|
			LegalCharMap at: c asciiValue + 1 put: c].
	LegalCharMap at: Character space asciiValue +1 put: (Character value:160 "hardspace").
	LegalCharMap at: 161 put: (Character value:160 "hardspace")."secondary mapping to keep it in strings"