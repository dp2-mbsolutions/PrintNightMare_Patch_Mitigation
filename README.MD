Migrate User
Printing to Software
Center
A mitigation strategy to help Sysads
that implemented the Print
Nightmare fix (Microsoft KB5005652).
Summary
THE PROBLEM: The "fix" ( Microsoft KB5005652) to

Print Nightmare removes a standard user's ability to

add a printer.

This will likely result in an uptick of "help desk

tickets" because 'admin rights' are now needed to map

a printer.

THE CURRENT WORKAROUND: The KB article

suggests disabling the new registry setting

temporarily to allow users to add printers, but this

creates a cybersecurity vulnerability.

A NEW SOLUTION: In a Windows Enterprise

Network, System Administrators can package

software in SCCM and make it available to users in

Software Center. This step-by-step guide outlines a

method of using Software Center to give users back

this functionality while the Print Nightmare fix is

enabled!

Wrapping PowerShell inside of Winforms creates a better user
experience than just using a "Read-host -Prompt". This script is set to
hide the PowerShell console when the GUI is running--this allows for
a simpler command line when running from SCCM/MECM.
SCRIPT
BREAKDOWN
01

This script is built around this command line that adds a printer for all users of a computer. The
simplicity should allow you to rewrite this work flow in the language of your choice!

CREATE A PACKAGE, NOT AN APPLICATION
SET THE PROGRAM TO RUN NORMAL, CHECK THE CHECK BOX
FOR 'Allow users to view and interact with the program
installation'
RUNS WITH ADMINISTRATIVE RIGHTS
If you do not know the difference, please do a little research. This
will eliminate the need for a detection method and allows the user to
run this app multiple times.

This will allow the user to see and interact with the program.
This will give the user the rights to add the printer since the registry
key fix for PrintNightmare removed this ability from non-admin
users.
SCCM/MECM
SETTINGS
02

Sample command line to run a .ps

This is a method to test this script before placing it in
SCCM/MECM. I have downloaded PSEXEC from the PSTOOLs,
placed PSEXEC in my System32 folder, and ran an interactive
command prompt in the SYSTEM context. SCCM/MECM uses the
SYSTEM context to install as admin. * NOTE: To verify that I am
running in SYSTEM, I ran a "WHOAMI" in the screenshot above.
Also, the last screenshot displays a different directory. Make sure
you are in the directory where the script is located AND don't
forget to set your execution policy!

PROOF OF
CONCEPT
03
Run the Script.
Type the printer name in the textbox.
Click the Add Printer Button.
RUN THE APP
04

Once you see this screen, follow the instructions and log off. *NOTE:
When placing this in your environment, feel free to force a restart if
you want a fully automated solution--just make sure to warn the
users!
WATCH THE
MAGIC!
05

In this step, I brought the console back and used a write-host. This can

easily be replaced with a message box from the .Net Framework.

When you log back in, navigate to "Printers and Scanners", and
you will see the Printer! (Give it a moment--it may take a few
minutes to finish up). This will add the printer for any user on the
computer!

LOG ON AND
VIEW THE
PRINTER!
06

Before logoff/logon After logoff/logon

Darius Peterson II
No.

Information Technology Research and Development
Key Skills: PowerShell Scripting and Automation, Endpoint Management, Windows OS and Server
Administration, Application Packaging (InstallShield, Windows Installer XML, and App Deployment
Toolkit), C# (novice)

Developed By
This is a offline tool, your data stays locally and is not send to any server!
