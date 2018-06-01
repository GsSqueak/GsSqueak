unaccepted edits
promptForCancel
	"Ask if it is OK to cancel changes to text"
	(self confirm:
'Changes have not been saved.
Is it OK to cancel those changes?' translated)
		ifTrue: [model changed: #clearUserEdits].
