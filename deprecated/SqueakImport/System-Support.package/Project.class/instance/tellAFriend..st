SuperSwiki
tellAFriend: emailAddressOrNil
	| urlForLoading |
"
Project current tellAFriend
"

	(urlForLoading := self urlForLoading) ifNil: [
		urlForLoading := self url		"fallback for dtp servers"
	].
	urlForLoading isEmptyOrNil ifTrue: [
		^self inform: 'Since this project has not been saved yet,
I cannot tell someone where it is.' translated
	].
	HTTPClient tellAFriend: emailAddressOrNil url: urlForLoading name: self name