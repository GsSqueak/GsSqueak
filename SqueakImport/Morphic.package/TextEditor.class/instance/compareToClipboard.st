menu messages
compareToClipboard
	"If any text is selected, present the modifications that would be made to it if the clipboard contents were pasted over it.  If no text is selected, present the differences betwen the entire pane's contents and the clipboard text."
	| subjectText proposedText |
	subjectText := self selection string ifEmpty: [ paragraph text string ].
	proposedText := self clipboardText string.
	subjectText = proposedText ifTrue: [^ self inform: 'Exact match'].
	(StringHolder new 
		textContents:
			(TextDiffBuilder
				buildDisplayPatchFrom: subjectText 
				to: proposedText)) openLabel: 'Differences with Clipboard Text'