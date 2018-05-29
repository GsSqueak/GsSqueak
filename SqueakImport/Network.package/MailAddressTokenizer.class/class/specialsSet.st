class initialization
specialsSet

	^CSSpecials ifNil: [ CSSpecials := CharacterSet newFrom: '()<>@,;:\".[]' ]