user interface
mvcOpen
	| textView sendButton  |

	mvcWindow := StandardSystemView new
		label: 'Mister Postman';
		minimumSize: 400@250;
		model: self.

	textView := PluggableTextView
		on: self
		text: #messageText
		accept: #messageText:.
	textEditor := textView controller.

	sendButton := PluggableButtonView 
		on: self
		getState: nil
		action: #submit.
	sendButton label: 'Send'.
	sendButton borderWidth: 1.

	sendButton window: (1@1 extent: 398@38).
	mvcWindow addSubView: sendButton.

	textView window: (0@40 corner: 400@250).
	mvcWindow addSubView: textView below: sendButton.

	mvcWindow controller open.

		
