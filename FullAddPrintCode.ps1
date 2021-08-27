 <#


Simple Add-Printer


#>



#Hide Console
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$consolePtr = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($consolePtr, 0)

#Function for Button click
Function Action-Item { 

    $Printername = ""
    $Printername = $textBox1.Text
    #Show Console and hide form 
    $consolePtr = [Console.Window]::GetConsoleWindow()
    [Console.Window]::ShowWindow($consolePtr, 4)
    $Form.hide()
    Invoke-Command  -Scriptblock {RUNDLL32 PRINTUI.DLL,PrintUIEntry /ga /n\\$Printername} -Verbose
    Start-sleep -s 5
    write-host "Printer added. Please log off and log back in to finish the install"

    }


#
[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$Form = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$button2 = $null
[System.Windows.Forms.TextBox]$textBox1 = $null
[System.Windows.Forms.ProgressBar]$progressBar1 = $null
[System.Windows.Forms.Label]$label1 = $null
[System.Windows.Forms.Button]$button1 = $null

$button2 = (New-Object -TypeName System.Windows.Forms.Button)
$textBox1 = (New-Object -TypeName System.Windows.Forms.TextBox)
$progressBar1 = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$label1 = (New-Object -TypeName System.Windows.Forms.Label)
$Form.SuspendLayout()
#
#button2
#
$button2.BackColor = [System.Drawing.Color]::DarkOrange
$button2.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]20,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$button2.ForeColor = [System.Drawing.SystemColors]::ButtonHighlight
$button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]334,[System.Int32]33))
$button2.Name = [System.String]'button2'
$button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]255,[System.Int32]133))
$button2.TabIndex = [System.Int32]3
$button2.Text = [System.String]'Add Printer'
$button2.UseVisualStyleBackColor = $false
$button2.add_Click({Action-Item})
#
#textBox1
#
$textBox1.ForeColor = [System.Drawing.SystemColors]::MenuHighlight
$textBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]44,[System.Int32]70))
$textBox1.Name = [System.String]'textBox1'
$textBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]212,[System.Int32]29))
$textBox1.TabIndex = [System.Int32]4
$textBox1.add_TextChanged($textBox1_TextChanged)
#
#label1
#
$label1.AutoSize = $true
$label1.ForeColor = [System.Drawing.SystemColors]::ButtonFace
$label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]56,[System.Int32]33))
$label1.Name = [System.String]'label1'
$label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]182,[System.Int32]25))
$label1.TabIndex = [System.Int32]7
$label1.Text = [System.String]'Enter Printer Name:'
#
#Form
#
$Form.BackColor = [System.Drawing.SystemColors]::ActiveCaptionText
$Form.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]615,[System.Int32]270))
$Form.Controls.Add($label1)
$Form.Controls.Add($textBox1)
$Form.Controls.Add($button2)
$Form.Name = [System.String]'PowerShellFormProject3'
$Form.ResumeLayout($false)
$Form.PerformLayout()
Add-Member -InputObject $Form -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Form -Name button2 -Value $button2 -MemberType NoteProperty
Add-Member -InputObject $Form -Name textBox1 -Value $textBox1 -MemberType NoteProperty
Add-Member -InputObject $Form -Name label1 -Value $label1 -MemberType NoteProperty
Add-Member -InputObject $Form -Name button1 -Value $button1 -MemberType NoteProperty





$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog()

