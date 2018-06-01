actions
completeTheMessage

	| newText strm |
	textFields do: [ :each | each hasUnacceptedEdits ifTrue: [ each accept ] ].

	newText := String new: 200.
	strm := WriteStream on: newText.
	strm 
		nextPutAll: 'Content-Type: text/html'; cr;
		nextPutAll: 'From: ', MailSender userName; cr;
		nextPutAll: 'To: ',to; cr;
		nextPutAll: 'Subject: ',subject; cr;

		cr;
		nextPutAll: '<HTML><BODY><BR>';
		nextPutAll: messageText asString asHtml;
		nextPutAll: '<BR><BR>',theLinkToInclude,'<BR></BODY></HTML>'.
	^strm contents




