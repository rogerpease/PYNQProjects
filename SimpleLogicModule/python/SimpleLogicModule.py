#!/usr/bin/python3 


def Test(): 
    aAddress         = 0x00
    bAddress         = 0x04
    sumAddress       = 0x08
    diffAddress      = 0x0C
    andAddress       = 0x10
    orAddress        = 0x14
    XorAddress       = 0x18
    XNorAddress      = 0x1C

    # Remember this is hookup verification. We don't need to exhaustively test our module. 

    for a,b in ((10,0),(277,1),(2**20,2**19),(2**25+2**23, 2**20)):
        overlay.SimpleLogicModuleAXI_0.write(aAddress,a)
        overlay.SimpleLogicModuleAXI_0.write(bAddress,b)
        actualSum        = overlay.SimpleLogicModuleAXI_0.read(sumAddress)
        actualDiff       = overlay.SimpleLogicModuleAXI_0.read(diffAddress)
        actualAnd        = overlay.SimpleLogicModuleAXI_0.read(andAddress)
        actualOr         = overlay.SimpleLogicModuleAXI_0.read(orAddress)
        actualXor        = overlay.SimpleLogicModuleAXI_0.read(XorAddress)
        actualXNor       = overlay.SimpleLogicModuleAXI_0.read(XNorAddress)
        if (actualSum != (a+b)):
           print ("FAILED ON sum A+B ",a,'+',b, ' expected ',a+b, ' actual ',actualSum)
           sys.exit(1); 

        if (actualDiff != (a-b)):
           print ("FAILED ON diff A-B ",a,'-',b, ' expected ',a-b, ' actual ',actualDiff)
           sys.exit(1); 

        if (actualAnd != (a&b)):
           print ("FAILED ON          ",a,'&',b, ' expected ',a&b, ' actual ',actualAnd)

        if (actualOr  != (a|b)):
           print ("FAILED ON          ",a,'|',b, ' expected ',a|b, ' actual ',actualOr)

        if (int(actualXor)  != (a^b)):
           print ("FAILED ON          ",a,'^',b, ' expected ',a^b, ' actual ',actualXor)
        expectedXNor = ~(a^b)
        if (expectedXNor < 0): 
          expectedXNor = 4294967296+expectedXNor
        if (actualXNor != expectedXNor):
           print ("FAILED ON          ",a,'~^',b, ' expected ',expectedXNor,' actual ',actualXNor)



#
# Test the module 
#
if __name__== "__main__":
 try: 
    from pynq import Overlay 
    # Make sure this is in    pynq/overlays/SimpleLogicModule/SimpleLogicModule.bit 
    # and the hwh file is in  pynq/overlays/SimpleLogicModule/SimpleLogicModule.hwh
    overlay = Overlay('SimpleLogicModule.bit');
    Test()
    print ("PASS!")
 except KeyboardInterrupt: 
    print ("Closing Overlay")
    overlay.close()
 except:     
    print ("\n\nYou may need to run this script as root\n\n") 
