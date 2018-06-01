private
register: widget id: id
	id ifNil:[^self].
	widgets ifNil:[widgets := Dictionary new].
	widgets at: id put: widget.
	widget setNameTo: id.