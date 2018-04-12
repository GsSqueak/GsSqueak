contents
contents

	self editSelection == #none ifTrue: [^ ''].
	self editSelection == #classComment ifTrue: [
		^ self classComment].
	self editSelection == #classDefinition ifTrue: [
		^ self classDefinition].
	self editSelection == #newClass ifTrue: [
		^ self newClassContents].
	self editSelection == #classHierarchy ifTrue: [
		^ self classHierarchy].
	self editSelection == #newMessage ifTrue: [
		^ self sourceCodeTemplate].
	self editSelection == #editMessage ifTrue: [
		^ self methodSource].
	^ 'Woah. What happened?'