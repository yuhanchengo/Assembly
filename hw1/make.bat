@echo off
REM make
REM Assembles and links the 32-bit ASM program into .exe which can be used by WinDBG
REM Uses MicroSoft Macro Assembler version 6.11 and 32-bit Incremental Linker version 5.10.7303
REM Created by Huang 

REM delete related files
del homework.lst	REM homework可以替換成.asm檔的檔名
del homework.obj
del homework.ilk
del homework.pdb
del homework.exe

setlocal 
set INCLUDE=C:\Program\WINdbgFolder\;	REM 這裡要設成WINdbgFolder的路徑
set LIB=C:\Program\WINdbgFolder\;
set PATH=C:\Program\WINdbgFolder\;

REM /c          assemble without linking
REM /coff       generate object code to be linked into flat memory model 
REM /Zi         generate symbolic debugging information for WinDBG
REM /Fl		Generate a listing file
 

ML /c /coff /Zi   homework.asm
if errorlevel 1 goto terminate

REM /debug              generate symbolic debugging information
REM /subsystem:console  generate console application code
REM /entry:start        entry point from WinDBG to the program 
REM                           the entry point of the program must be _start

REM /out:%1.exe         output %1.exe code
REM %1.obj              input %1.obj
REM Kernel32.lib        library procedures to be invoked from the program
REM irvine32.lib
REM user32.lib

LINK /INCREMENTAL:no /debug /subsystem:console /entry:start /out:homework.exe homework.obj Kernel32.lib irvine32.lib user32.lib
if errorlevel 1 goto terminate

REM Display all files related to this program:
DIR homework.*

:terminate
pause
endlocal