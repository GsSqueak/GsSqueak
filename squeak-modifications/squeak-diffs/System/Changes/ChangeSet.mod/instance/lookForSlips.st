fileIn/Out
lookForSlips
	"Scan the receiver for changes that the user may regard as slips to be remedied"

	| slips nameLine msg |
	nameLine := '
"', self name, '"
'.
	(slips := self checkForSlips) size = 0 ifTrue:
		[^ self inform: ('No slips detected in change set\"{1}".' translated withCRs format: {self name})].

	msg := slips size = 1
		ifTrue:
			[ 'One method in change set "{1}"\has a halt, reference to the Transcript,
and/or some other ''slip'' in it.\Would you like to browse it?' translated withCRs format: {self name}]
		ifFalse:
			[ '{1} methods in change set "{2}"\have halts or references to the
Transcript or other ''slips'' in them.\Would you like to browse them?' translated withCRs format: {slips size. self name}].

	(UIManager default confirm: msg title: 'Browse Slips?')
		ifTrue: [self systemNavigation
			browseMessageList: slips
			name: 'Possible slips in ', self name]