000100  IDENTIFICATION DIVISION.                                        00010000
000200    PROGRAM-ID. SAMCICS.                                          00020000
000300  DATA DIVISION.                                                  00030000
000400    WORKING-STORAGE SECTION.                                      00040000
000500    01 WS-INPUT.                                                  00050000
000600      03 WS-TRAN-ID   PIC X(4).                                   00060000
000700      03 WS-MESSAGE-I PIC X(70).                                  00070000
000800    01 WS-OUTPUT.                                                 00080000
000900      03 WS-TEXT      PIC X(8).                                   00090000
001000      03 WS-MESSAGE-O PIC X(70).                                  00100000
001100    01 WS-MSG-LENGTH  PIC S9(4) COMP.                             00110000
001200  PROCEDURE DIVISION.                                             00120000
001300      MOVE 74 TO WS-MSG-LENGTH.                                   00130000
001400      EXEC CICS RECEIVE                                           00140000
001500                INTO(WS-INPUT)                                    00150000
001600                LENGTH(WS-MSG-LENGTH)                             00160000
001700      END-EXEC.                                                   00170000
001800      MOVE WS-MESSAGE-I TO WS-MESSAGE-O.                          00180000
001900      MOVE 'OUTPUT: '   TO WS-TEXT.                               00190000
002000      MOVE 78           TO WS-MSG-LENGTH.                         00200000
002100      EXEC CICS SEND                                              00210000
002200                FROM(WS-OUTPUT)                                   00220000
002300                LENGTH(WS-MSG-LENGTH)                             00230000
002400                ERASE                                             00240000
002500      END-EXEC.                                                   00250000
002600      EXEC CICS RETURN                                            00260000
002700      END-EXEC.                                                   00270000
002800      GOBACK.                                                     00280000
