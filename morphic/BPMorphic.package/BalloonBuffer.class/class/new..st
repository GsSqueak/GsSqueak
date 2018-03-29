instance creation
new: size
  | buffer |
  buffer := super new: size.
  (1 to: size) do: [ :i | buffer at: i put: 0 ].
  ^ buffer