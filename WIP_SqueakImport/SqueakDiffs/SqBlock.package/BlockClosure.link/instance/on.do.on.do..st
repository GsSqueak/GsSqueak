exceptions
on: exception1 do: block1 on: exception2 do: block2

	^[
		self
			on: exception1
			do: block1 ]
		on: exception2
		do: block2

