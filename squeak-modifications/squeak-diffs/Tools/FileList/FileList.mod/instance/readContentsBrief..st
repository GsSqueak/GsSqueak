private
readContentsBrief: brevityFlag
	"Read the contents of the receiver's selected file, unless it is too long, in which case show just the first 5000 characters. Don't create a file if it doesn't already exist."
	| f fileSize first5000 |

	brevityFlag ifTrue: [
		directory isRemoteDirectory ifTrue: [^ self readServerBrief]].
	f := directory oldFileOrNoneNamed: self fullName.
	f ifNil: [^ 'For some reason, this file cannot be read' translated].
	f converter: (self defaultEncoderFor: self fullName).
	(brevityFlag not or: [(fileSize := f size) <= 100000]) ifTrue:
		[contents := f contentsOfEntireFile.
		brevityState := #fullFile.   "don't change till actually read"
		^ contents].

	"if brevityFlag is true, don't display long files when first selected"
	first5000 := f next: 5000.
	f close.
	contents := 'File ''{1}'' is {2} bytes long.
You may use the ''get'' command to read the entire file.

Here are the first 5000 characters...
------------------------------------------
{3}
------------------------------------------
... end of the first 5000 characters.' translated format: {fileName. fileSize. first5000}.
	brevityState := #briefFile.   "don't change till actually read"
	^ contents.
