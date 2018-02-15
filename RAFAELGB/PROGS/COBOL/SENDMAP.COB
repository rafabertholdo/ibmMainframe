000100  IDENTIFICATION DIVISION.                         
000200    PROGRAM-ID. SENDMAP.                           
000300  DATA DIVISION.                                   
000400    WORKING-STORAGE SECTION.                       
000500    77 WS-NUM1  PIC 9(3).                          
000600    77 WS-NUM2  PIC 9(3).
000700    77 WS-RESU  PIC 9(4).
000800    77 WS-LEN   PIC S9(4) COMP.
000900    COPY DFHAID.
001000    COPY DFHBMSCA.
001100    COPY SCREEN1.
001200  PROCEDURE DIVISION.                              
001300      MOVE LOW-VALUES TO ADDMAPI.
001400      MOVE LOW-VALUES TO ADDMAPO.
001500      EXEC CICS SEND MAP('ADDMAP')
001600                     MAPSET('SCREEN1')
001610                     ERASE
001700      END-EXEC.                                     
002600      EXEC CICS RETURN                              
002700      END-EXEC.                                     
