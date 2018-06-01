fileIn/Out
mailOut
	"Email a compressed version of this changeset to the squeak-dev list, so that it can be shared with everyone.  (You will be able to edit the email before it is sent.)"

	| userName message slips |

	userName := MailSender userName.

	self checkForConversionMethods.
	message := Cursor write showWhile: [self buildMessageForMailOutWithUser: userName].

	MailSender sendMessage: message.

	Preferences checkForSlips ifFalse: [^ self].
	slips := self checkForSlips.
	(slips size > 0 and: [self confirm: 'Methods in this fileOut have halts
or references to the Transcript
or other ''slips'' in them.
Would you like to browse them?'])
		ifTrue: [self systemNavigation browseMessageList: slips name: 'Possible slips in ' , name]
