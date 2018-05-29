fileIn/Out
buildMessageForMailOutWithUser: userName

	| message compressBuffer compressStream data compressedStream compressTarget |

	"prepare the message"
	message := MailMessage empty.
	message setField: 'from' toString: userName.
	message setField: 'to' toString: 'squeak-dev@lists.squeakfoundation.org'.
	message setField: 'subject' toString: (self chooseSubjectPrefixForEmail, name). 

	message body: (MIMEDocument contentType: 'text/plain' content: (String streamContents: [ :str |
		str nextPutAll: 'from preamble:'; cr; cr.
		self fileOutPreambleOn: str ])).

	"Prepare the gzipped data"
	data := WriteStream on: String new.
	data header; timeStamp.
	self fileOutPreambleOn: data.
	self fileOutOn: data.
	self fileOutPostscriptOn: data.
	data trailer.
	data := ReadStream on: data contents.
	compressBuffer := ByteArray new: 1000.
	compressStream := GZipWriteStream on: (compressTarget := WriteStream on: (ByteArray new: 1000)).
	[data atEnd]
		whileFalse: [compressStream nextPutAll: (data nextInto: compressBuffer)].
	compressStream close.
	compressedStream := ReadStream on: compressTarget contents asString.

	message addAttachmentFrom: compressedStream withName: (name, '.cs.gz').

	^ message