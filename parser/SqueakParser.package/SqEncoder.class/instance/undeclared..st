encoding
undeclared: name
  | sym |
  (requestor notNil and: [ requestor interactive ])
    ifTrue: [ 
      requestor requestor == #'error:'
        ifTrue: [ requestor error: 'Undeclared' ].
      ^ self notify: 'Undeclared' ].	"Allow knowlegeable clients to squash the undeclared warning if they
	want (e.g.
	Diffing pretty printers that are simply formatting text). As this breaks
	compilation it should only be used by clients that want to discard the
	result of the compilation. To squash the warning use e.g.
	[Compiler format: code in: class notifying: nil decorated: false]
	on: UndeclaredVariableWarning
	do: [:ex| ex resume: false]"
  sym := name asSymbol	"^ (UndeclaredVariableWarning new
			name: name
			selector: selector
			class: cue getClass) signal
		ifTrue: [| undeclared |
			undeclared := cue environment undeclared.
			[undeclared at: sym put: nil]
				on: AttemptToWriteReadOnlyGlobal
				do: [:noti | noti resume: true].
			self
				global: (undeclared associationAt: sym)
				name: sym]
		ifFalse: [self
				global: (Association key: sym)
				name: sym]"	"Hackedy Hack hack
"