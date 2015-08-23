$ document
  .ready ->
    do $('.content__option-select').simpleSelect if $('.content__options-select').length
    do $ '.selectbox__dropdown'
      .jScrollPane