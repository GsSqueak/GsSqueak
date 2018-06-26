gs
executeString: aString
    ^ self _env0 executeString: 'Workspace evaluate: ''' , aString , ''''.
