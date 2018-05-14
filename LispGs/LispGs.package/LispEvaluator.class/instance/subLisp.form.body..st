private
subLisp: aSymbol form: aForm body: aConsCell
  ^ self
    subLisp: aSymbol
    form: aForm
    body: aConsCell
    environment: environment newChild