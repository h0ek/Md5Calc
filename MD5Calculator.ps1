function Show-Menu
{
     param (
           [string]$Title = 'MD5 Calculator'
     )
     cls
     Write-Host "===================== $Title ====================="

     Write-Host "1: Press '1' for single file, output in console"
     Write-Host "2: Press '2' for single file, output in text file"
     Write-Host "3: Press '3' for all files in folder, output in console"
     Write-Host "4: Press '4' for all files in folder, output in text file"
     Write-Host "Q: Press 'Q' to quit."
}
do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                'MD5 for single file, output in console'
                'Paste UNC path to file you want to calculate'
                $FilePath = Read-Host -Prompt 'Source file path'
                $Activity = "Calculating MD5 Hash Value"
                $Id       = 1
                $Task     = "Please wait"
                Write-Progress -Id $Id -Activity $Activity -Status $Task
                Get-FileHash $FilePath -Algorithm MD5 | Format-List
           } '2' {
                cls
                'MD5 for single file, output in text file'
                'Paste UNC path to file you want to calculate'
                $FilePath = Read-Host -Prompt 'Source file path'
                'Paste path for output report eg: C:\reports'
                $Output = Read-Host -Prompt 'Report location path'
                $Activity = "Calculating MD5 Hash Value"
                $Id       = 1
                $Task     = "Please wait"
                Write-Progress -Id $Id -Activity $Activity -Status $Task
                Get-FileHash $FilePath -Algorithm MD5 | Format-List > $Output\MD5.txt
                'Complete! Report saved to MD5.txt file'
           } '3' {
                cls
                'MD5 for all files in folder, output in console'
                'Paste UNC path to folder with files you want to calculate'
                $FolderPath = Read-Host -Prompt 'Source folder path'
                $Activity = "Calculating MD5 Hash Value"
                $Id       = 1
                $Task     = "Please wait"
                Write-Progress -Id $Id -Activity $Activity -Status $Task
                Get-ChildItem -Recurse $FolderPath | Get-FileHash -Algorithm MD5 | Format-List

           } '4' {
                cls
                'MD5 for all files in folder, output in text file'
                'Paste UNC path to folder with files you want to calculate'
                $FilePath = Read-Host -Prompt 'Source folder path'
                'Paste path for output report eg: C:\reports'
                $Output = Read-Host -Prompt 'Report location path'
                $Activity = "Calculating MD5 Hash Value"
                $Id       = 1
                $Task     = "Please wait"
                Write-Progress -Id $Id -Activity $Activity -Status $Task
                Get-ChildItem -Recurse $FolderPath | Get-FileHash -Algorithm MD5 |Format-List > $Output\MD5.txt
                'Complete! Report saved to MD5.txt file'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
