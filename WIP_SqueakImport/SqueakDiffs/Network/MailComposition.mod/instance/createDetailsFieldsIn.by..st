toolbuilder
createDetailsFieldsIn: detailsPanelSpec by: aBuilder
	
   #((senderLabel messageSender messageSender:)
	(recipientLabel messageRecipient messageRecipient:)
	(ccLabel messageCC messageCC:)
	(bccLabel messageBCC messageBCC:)
	(subjectLabel messageSubject messageSubject:)) 
		do: [:config | detailsPanelSpec children add: 
				(self createFieldInputNamed: config first 
					getter: config second 
					setter: config third 
					with: aBuilder)]
	