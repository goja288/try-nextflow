#!/usr/bin/env nextflow

params.greeting  = 'Hello world!'
greeting_ch = Channel.from(params.greeting)

//  splits a string into files containing chunks of 6 characters. 
process splitLetters {

    input:
    val x from greeting_ch

    output:
    file 'chunk_*' into letters 

    
    """
    printf '$x' | split -b 6 - chunk_
    """
}

// accepts the files and transforms their contents to uppercase letters
process convertToUpper {

    input:
    file y from letters.flatten()

    output:
    stdout into result

    """
    rev $y | tr '[a-z]' '[A-Z]'
    """
}

result.view{ it.trim() }
