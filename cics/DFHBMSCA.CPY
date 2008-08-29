* Standard BMS equates
*
* Attributes
DFHBMUNP EQU   X'40'              UNPROT  ALPHA
DFHBMFSE EQU   X'C1'              UNPROT  ALPHA            MDT
DFHBMBRY EQU   X'C8'              UNPROT  ALPHA  BRT
DFHUNIMD EQU   X'C9'              UNPROT  ALPHA  BRT       MDT
DFHBMDAR EQU   X'4C'              UNPROT  ALPHA       DRK
DFHUNNOD EQU   X'4D'              UNPROT  ALPHA       DRK  MDT
DFHBMUNN EQU   X'50'              UNPROT  NUM
DFHUNNUM EQU   X'D1'              UNPROT  NUM              MDT
DFHUNNUB EQU   X'D8'              UNPROT  NUM    BRT
DFHUNINT EQU   X'D9'              UNPROT  NUM    BRT       MDT
*        EQU   X'5C'              UNPROT  NUM         DRK
DFHUNNON EQU   X'5D'              UNPROT  NUM         DRK  MDT
DFHBMPRO EQU   X'60'              PROT    ALPHA
DFHBMPRF EQU   X'61'              PROT    ALPHA            MDT
DFHPROTI EQU   X'E8'              PROT    ALPHA  BRT
*        EQU   X'E9'              PROT    ALPHA  BRT       MDT
DFHPROTN EQU   X'6C'              PROT    ALPHA       DRK
*        EQU   X'6D'              PROT    ALPHA       DRK  MDT
DFHBMASK EQU   X'F0'              PROT    NUM
DFHBMASF EQU   X'F1'              PROT    NUM              MDT
DFHBMASB EQU   X'F8'              PROT    NUM    BRT
*        EQU   X'F9'              PROT    NUM    BRT       MDT
*        EQU   X'7C'              PROT    NUM         DRK
*        EQU   X'7D'              PROT    NUM         DRK  MDT
*
* Mapping
DFHBMEOF EQU   X'80'              FIELD ERASED
DFHBMCUR EQU   X'02'              FIELD CONTAINING CURSOR
DFHBMEF  EQU   X'82'              FIELD ERASED AND CONTAINING CURSOR
