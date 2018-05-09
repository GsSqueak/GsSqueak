private
specialFormSelectors
  ^ Array
    streamContents: [ :str | 
      (self allCategories
        select: [ :cat | cat includesSubString: 'LISP-special forms' ])
        do: [ :cat | str nextPutAll: (self selectorsIn: cat) ] ]