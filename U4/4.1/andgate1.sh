#!/bin/bash
name="andgate1.vhdl"
nam="andgate1"
ghdl -s $name
if [ $? -eq 0 ]; then  
    echo Syntax-check OK
    ghdl -a $name
    if [ $? -eq 0 ]; then  
        echo Analyse OK
        ghdl -e $nam
        if [ $? -eq 0 ]; then  
            echo Build OK
            ghdl -r $nam --vcd=testbench.vcd
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
