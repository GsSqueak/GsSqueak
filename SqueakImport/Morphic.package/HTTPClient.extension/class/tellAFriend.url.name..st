*Morphic-MorphicExtras-utilities
tellAFriend: emailAddressOrNil url: urlForLoading name: projectName
	| recipient subject body linkToInclude |
	recipient := emailAddressOrNil ifNil: ['RECIPIENT.GOESHERE'].
	subject := 'New/Updated Squeak project'.
	body := 'This is a link to the Squeak project ' , projectName , ': ' , String crlf.
	linkToInclude := urlForLoading.
	HTTPClient shouldUsePluginAPI
		ifTrue: [
			self composeMailTo: recipient subject: subject body: body , (linkToInclude copyReplaceAll: '%' with: '%25')]
		ifFalse: [FancyMailComposition new
				celeste: nil 
				to: recipient
				subject: subject
				initialText: body
				theLinkToInclude: linkToInclude;
				open].