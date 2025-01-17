  .bank 0
  .org $C000
  
  .include "prg_rom/init.asm"
  
  LDA #%10010000
  STA igPPUCTRL
  LDA #$00
  STA cameraX
  STA cameraY
  STA rotation
  STA scroll
  
  JSR enableNmi
  
  LDA #STATEPLAYING
  STA gamestate
  LDA #INITIALIZE
  STA substate
  LDA #$00
  STA time
	
Forever:
  JSR waitNextFrame
  JSR clearBuffer
  
  INC time
  
GameEngine:  
  LDA gamestate
  CMP #STATEPLAYING
  BNE notEngPlaying
  ;JMP playBlob		;playing
  JMP playBufferBarbeuk		;playing
notEngPlaying:

GameEngineDone:
  
  JMP Forever     ;jump back to Forever, infinite loop
  
  ;.include "prg_rom/blob.asm"
  ;.include "prg_rom/buffer_batch.asm"
  .include "prg_rom/barbeuk.asm"
  
  .include "prg_rom/interupts.asm"
  .include "prg_rom/lib/utils.asm"
  .include "prg_rom/lib/famitone2.asm"