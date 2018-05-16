file in/out
decideAboutCreatingBlank: otherProjectName

	| resp |

	"20 Oct - just do it"
	true "version isNil" ifFalse: [	"if saved, then maybe don't create"
		resp := (UIManager default chooseFrom: #('Yes, make it up' 'No, skip it') 
			title: ('I cannot locate the project\',
				otherProjectName,
				'\Would you like me to create a new project\with that name?'
			) withCRs).
		resp = 1 ifFalse: [^ nil]
	].
	^Project current openBlankProjectNamed: otherProjectName