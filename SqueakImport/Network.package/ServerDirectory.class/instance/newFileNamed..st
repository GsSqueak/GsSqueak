file directory
newFileNamed: fullName
	"Create a RemoteFileStream.  If the file exists, and complain.  fullName is directory path, and does include name of the server.  Or it can just be a fileName.  Only write the data upon close."

	| file remoteStrm selection |

	file := self asServerFileNamed: fullName.
	file readWrite.
	file isTypeFile ifTrue: [
		^ FileStream newFileNamed: (file fileNameRelativeTo: self)].
	file exists 
		ifTrue: [
			selection := UIManager default 
				chooseFrom: #('overwrite that file' 'choose another name' 'cancel')
				title: (file fullNameFor: file fileName) , '
already exists.']
		ifFalse: [selection := 1].

	selection = 1 ifTrue:
		[remoteStrm := RemoteFileStream on: (String new: 2000).
		remoteStrm remoteFile: file.
		remoteStrm dataIsValid.	"empty stream is the real contents!"
		^ remoteStrm].	"no actual writing till close"
	selection = 2 ifTrue: [
		^ self newFileNamed:
			(UIManager default request: 'Enter a new file name'
				initialAnswer: file fileName)].
	^ nil	"cancel"