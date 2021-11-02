#!/usr/bin/env nextflow
   echo true
    

//  splits a string into files containing chunks of 6 characters. 
process queueChannel {
 
    // Queue Channel
    ch = Channel.from(1,2,3)
    println("-------")     
    println(ch)     // print the variable 
    println("-------")     
    ch.view()

    '''
    '''

}

process valueChannel {

    // Value Channel
    ch = Channel.value('Hello')
    ch.view()
    ch.view()
    ch.view()

    """
    """

}

process channelFactoriesValue {

    // Channel factories - value
    ch1 = Channel.value()                 
    ch2 = Channel.value( 'Hello there' )  
    ch2 = Channel.value( [1,2,3,4,5] ) 

    """
    """

}

process channelFactoriesFrom {

    // Channel factories  - from
    ch = Channel.from( 1, 3, 5, 7 )
    ch.view{ "value: $it" }

    """
    """

}

process channelFactoriesOf {

    // Channel factories  - of
    Channel
        .of(1..23, 'X', 'Y')
        .view()

    """
    """

}

process channelFactoriesFromList {

    println "=== Start channelFactoriesFromList ===" 
    list = ['hello', 'world']

    Channel
        .fromList(list)
        .view()

    println "===  End channelFactoriesFromList ==="
    
    """
    """

}

process channelFactoriesFromPath {

    script:
        params.path = 'data/ggal/*.fq'
        Channel.fromPath(params.path)
            .println { file -> "$file.name \tdirectory: $file.parent" }

        """
        """

}

process channelFactoriesFromFromFilePairs {
    
    Channel
        .fromFilePairs('data/reads/110101_I315_FC816RLABXX_L1_HUMrutRGXDIAAPE_{1,2}.fq.gz')
        .view()

    """
    """

}


process channelFactoriesFromSRA {
    
    Channel
        .fromSRA('SRP043510')
        .view()

    """
    """

}