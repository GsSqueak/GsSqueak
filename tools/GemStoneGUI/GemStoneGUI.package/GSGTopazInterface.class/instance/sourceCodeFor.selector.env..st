api
sourceCodeFor: classProxy selector: selector env: envId

	| code topazOutput |
	code := '[:class :selector :envId |
| code |
  code := [self sourceCodeAt: selector environmentId: envId]
    onException: Error
    do: [ :ex | ^ aBlock value ].
  code ifNil: [ ^ aBlock value ]] value: ' , classProxy codeReferencingMe , ' value: ' , selector , ' value: ' , envId.
	self setEnv: 0.
	topazOutput := self run: code.
	^ topazOutput at: 1