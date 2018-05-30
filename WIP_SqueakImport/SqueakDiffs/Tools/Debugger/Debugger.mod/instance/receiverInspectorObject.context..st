accessing
receiverInspectorObject: obj context: ctxt

	"set context before object so it can refer to context when building field list"
	receiverInspector context: ctxt.
	receiverInspector object: obj.
