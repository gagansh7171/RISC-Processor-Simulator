::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFA5HSRa+E2W/IqcV/u3Hy++UqVkSRN4MfYLeyaCLMqBA1mT2dp5t13Re2O8JHxJfcFKIXSF0+zwTileAOoesoQDrT0ud2nkZKEY5tV/FmCI3c+9rksoT2ySBrR2pz/JFn3H8Uck=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFA5HSRa+E2W/IqcV/u3Hy++UqVkSRN4MfYLeyaCLMqBA1mT2dp5t13Re2O8JHxJfcFKIXSF0+zwTileAOoesoQDrT0ud2nkZKEY5tV/jgy0vd9J6n40B0jTw+VX6/w==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
REM
@echo off
start utils/logisim-win-2.7.1.exe utils/processor.circ
call :setWindowProperty 9f
call :new
goto :main
:setWindowProperty
 title RISC-R
  mode con: cols=100 lines=22
  color %~1
goto :eof
:new
 set messageCode=welcome
 set feedbackURL="mailto:gajanan_s@cs.iitr.ac.in"
 set setupPath="C:\Users\%username%\Desktop\tests"
 IF NOT EXIST %setupPath% (
  cd "C:\Users\%username%\Desktop"
  mkdir tests
  cd %setupPath%
 )
goto :eof
:main
 cls
 if "%messageCode%"=="welcome" (
  call :welcomeMesssage
 ) else if "%messageCode%"=="pathnotfounderror" (
  call :pathnotfounderror
 ) else if "%messageCode%"=="help" (
  call :help
 ) else if "%messageCode%"=="theme" (
  call :theme
 ) else if "%messageCode%"=="success" (
  call :success
 ) else if "%messageCode%"=="error" (
  call :error
 ) else if "%messageCode%"=="contact" (
  call :contact
 ) else if "%messageCode%"=="tsuccess" (
  call :tsuccess
 ) else if "%messageCode%"=="terror" (
  call :terror
 ) else (
  call :error
 )
 echo [1] Run the Python Assembler to Generate Disc Image
 echo [2] Important: How to Test
 echo [3] Test
 echo [4] Contact Us
 echo [5] Send Feedback
 echo [6] Change Themes
 echo [7] Exit
 call :line
 set /p option="Enter your Choice: "

 call :operation %option%

goto :main
:welcomeMesssage
 cls
 call :line
 call :line
 echo ******************             Welcome to RISC-Roorkee...!!!       *********************************
 echo ******************  You Run and Test our Project on this Dashboard *********************************
 echo ******************             Choose option below                 *********************************
 call :line
 call :line
 echo _
goto :eof
:error  
 cls
 call :line
 echo *       Sorry...!!                                                                                 *
 echo *       Choice is Incorrect..!!                                                                    *
 echo *       Please Choose option below                                                                 *  
 call :line
goto :eof 
:success
 cls
 call :line
 echo *       Congratulations...!!                                                                       *
 echo *       Operation Done Successfully..!!                                                            *
 echo *       Please Choose option below                                                                 *  
 call :line
goto :eof
:pathnotfounderror
 cls
 call :line
 echo *       Sorry...!!                                                                                 *
 echo *       File/Folder Does not Exists..!!                                                            *
 echo *       Please Choose option below                                                                 *  
 call :line
goto :eof
:feedback
 if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
  start firefox.exe "%feedbackURL%"
 ) else (
  start iexplore "%feedbackURL%"
 )
 set messageCode=welcome
goto :eof
:tsuccess
 cls
 call :line
 echo *       Congratulations...!!                                                                       *
 echo *       Test Passed..!!                                                                            *
 call :line
goto :eof
:terror
 cls
 call :line
 echo *       Sorry...!!                                                                                 *
 echo *       Test Case Failed..!!                                                                       *
 echo *       Check your register log and the asm program                                                *  
 call :line
goto :eof
:exit
exit

:operation
 if %~1==1 (
  call :runASM
 ) else if %~1==2 (
  set messageCode=help
 ) else if %~1==3 (
  call :test
 ) else if %~1==4 (
  set messageCode=contact
 ) else if %~1==5 (
  call :feedback
 ) else if %~1==6 (
  call :themes
 ) else if %~1==7 (
  call :exit
 ) else (
  set messageCode=error
 )
goto :eof

:testop
 if %~2==1 (
   fc /b %~1 "tests/sum.txt" > nul
   if errorlevel 1 (
     set messageCode=terror
   ) else (
     set messageCode=tsuccess
   )
 ) else if %~2==2 (
  fc /b %~1 "tests/factorial.txt" > nul
   if errorlevel 1 (
     set messageCode=terror
   ) else (
     set messageCode=tsuccess
   )
 ) else if %~2==3 (
  fc /b %~1 "tests/divide.txt" > nul
   if errorlevel 1 (
     set messageCode=terror
   ) else (
     set messageCode=tsuccess
   )
 ) else (
   set messageCode=error
 )
goto :eof

:themeop
 if %~1==1 (
   call :setWindowProperty 0a
 ) else if %~1==2 (
   call :setWindowProperty fa
 ) else if %~1==3 (
   call :setWindowProperty 9f
 ) else if %~1==4 (
   call :setWindowProperty f0
 ) else (
   set messageCode=error
 )
goto :eof

:runASM
 cls
  if exist "utils/assembler.py" (
   python utils/assembler.py programFilesIO/program.asm programFilesIO/out.img 
   set messageCode=success
  ) else (
   set messageCode=pathnotfounderror
  )
goto :eof
:help
 cls
 call :line
 echo *                          HELP                                                                    *
 echo *       1. Check and make ready the assembler script and disc image of program.asm for Logisim     *
 echo *       2. Load the disc image into the RAM                                                        *
 echo *       3. Enter Logging Simulation mode under Simulation Section in Logisim                       *
 echo *       4. Select all the 32 Registers for logging purpose                                         *
 echo *       5. Select a '*.txt' for logging the output                                                 *
 echo *       6. Run tests option number [3]                                                             *
 call :line
goto :eof
:test
  cls
  call :line
  echo *                          TEST OPTIONS  (Check our example programs)                              *
  echo *       1. Add first 10 natural number                                                             *
  echo *       2. To calculate the n! (n factorial)                                                       *
  echo *       3. Program to divide two numbers (integers)                                                *
  call :line
  echo _
 set /p testpath="Enter path of your log to Test your Program: "
 set /p toption="Select a program to test (Enter 1/2/3) "
 if exist %testpath% (
  call :testop %testpath% %toption%
 ) else (
  messageCode=pathnotfounderror
 ) 
goto :eof
:themes
 cls
 call :line
 echo *       Choose your Themes                                                                         *
 echo *       [1]. Matrix [Black-Green]                                                                  *
 echo *       [2]. Pied Piper [White-Green]                                                              *
 echo *       [3]. Micro Gates [Blue-White]                                                              *
 echo *       [4]. Negative [Black White]                                                                *  
 call :line
 echo _
 set /p optheme="Select a theme (Enter 1/2/3/4) "
 call :themeop %optheme%
goto :eof
:contact
 cls
 call :line
 echo *       If you face any problem in testing or running our software                                 *
 echo *       You can Contact Team RISC-Roorkee by below EmailID or Phone Number                         *
 echo *       E-mail : gajanan_s@cs.iitr.ac.in                                                           *
 echo *       Phone Number: +91-7974271162                                                               *
 call :line
goto :eof
:error  
 cls
 call :line
 echo *       Sorry...!!                                              *
 echo *       Choice is Incorrect..!!                                 *
 echo *       Please Choose option below                              *  
 call :line
goto :eof 
:line
  echo ****************************************************************************************************
goto :eof

REM