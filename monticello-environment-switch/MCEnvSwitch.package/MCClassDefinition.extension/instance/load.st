*MCEnvSwitch
load
  | cl |
  (cl := ((MCEnv respondsTo: #'usesSqueakParser')
    and: [ MCEnv usesSqueakParser ])
    ifTrue: [ self createClassSqueak ]
    ifFalse: [ self createClass ]) ~~ nil
    ifTrue: [ 
      self hasComment
        ifTrue: [ 
          SystemChangeNotifier uniqueInstance
            doSilently: [ cl classComment: comment stamp: commentStamp ] ] ]
    ifFalse: [ 
      Error
        signal:
          'Could not create class ' , self className printString , 'as subclass of '
            , self superclassName printString ]