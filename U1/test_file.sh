#!/bin/bash
ghdl -s test_file.vhdl
if [ $? -eq 0 ]; then  
    echo Syntax-check OK
    ghdl -a test_file.vhdl
    if [ $? -eq 0 ]; then  
        echo Analyse OK
        ghdl -e test_file
        if [ $? -eq 0 ]; then  
            echo Build OK
            ghdl -r test_file --vcd=testbench.vcd
            if [ $? -eq 0 ]; then  
                echo VCD-Dump OK
                gtkwave testbench.vcd
                if [ $? -eq 0 ]; then  
                    echo Starting GTKWave ...     
                else
                    echo Starting GTKWave Failed
                fi
            else
                echo VCD-Dump Failed
            fi
        else
            echo Build Failed
        fi
    else
        echo Analyse Failed
    fi
else
    echo Syntax-check FAIL
fi