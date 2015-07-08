@echo off

set /p filename="What do you want to call this file? " %=%

curl -o %filename%.xls -O -J -L "http://electionresults.sos.ne.gov/ResultsExport.aspx?rid=766&pty=&name=For%20United%20States%20Senator&cat=CTY"

in2csv %filename%.xls | head -n 100 | tail -n +8 > %filename%.csv