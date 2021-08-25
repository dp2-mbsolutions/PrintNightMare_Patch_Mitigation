# PrintNightMare_Patch_Mitigation


THE PROBLEM: The
"fix" ( Microsoft KB5005652) to
Print Nightmare removes a standard user's
ability to add a printer.
This will likely result in an uptick of "help desk

THE CURRENT WORKAROUND: The KB article
suggests disabling the new registry setting
temporarily to allow users to add printers, but this
creates a cybersecurity vulnerability.


SOLUTION: In a Windows Enterprise
Network, System Administrators can package
software in SCCM and make it available to users in
Software Center. This script (deployed via Software Center) will give users back
this functionality while the Print Nightmare fix is
enabled!
