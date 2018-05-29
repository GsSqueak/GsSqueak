The Clipboard class implements a basic buffering scheme for text. The currently selected text is also exported to the OS so that text can be copied from and to other applications. Commonly only a single instance is used (the default clipboard) but applications are free to use other than the default clipboard if necessary.

If you'd like to be notified of the changes of the clipboard, you can subscribe to its #contentChanged event. For example:

subscriber := [ :newClipboardText :updateSource | 
	Transcript show: ('Clipboard was updated by {1}, the new content is: {2}'
		format: {
			updateSource.
			newClipboardText }); cr ].
Clipboard default
	when: #contentChanged
	send: #value:value:
	to: subscriber.

At this point if you open a Transcript and copy or cut some text, then the message will appear on the Transcript. Make sure that there's a reference kept to subscriber, otherwise it will be garbage collected and no messages will appear.
	
To unsubscribe from the clipboard changes, just evaluate:

Clipboard default removeActionsWithReceiver: subscriber