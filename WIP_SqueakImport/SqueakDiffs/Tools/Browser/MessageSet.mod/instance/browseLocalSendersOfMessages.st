message functions
browseLocalSendersOfMessages
	"Override so that if no method is selected it searches for senders local to the current list."

	self selectedClass ifNotNil:
		[^super browseLocalSendersOfMessages].

	self getSelectorAndSendQuery: #value:value:
		to: [:literal :label|
			self systemNavigation browseAllCallsOn: literal fromMethodReferences: messageList labelled: label]
		with: { 'messages' }