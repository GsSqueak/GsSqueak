error handling
notify: string at: location
  ^ self error: string , ' (', location asString , ')'
