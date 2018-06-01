dependents access
step 
	"Update the inspectors."

	receiverInspector ifNotNil: [receiverInspector step].
	contextVariablesInspector ifNotNil: [contextVariablesInspector step].
