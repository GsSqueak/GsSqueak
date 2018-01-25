accessing
actualGsProcess
  actualGsProcess ifNil: [ actualGsProcess := suspendedContext newProcess ].
  ^ actualGsProcess
