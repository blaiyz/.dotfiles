
#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
Import-Module -Name Terminal-Icons
#f45873b3-b655-43a6-b217-97c00aa0db58

function Vmon {C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe startvm $args[0] --type headless}
function Vmoff {C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe controlvm $args[0] acpipowerbutton}
function ssh.UbuntuVM {ssh -p 3022 kali@127.0.0.1}
function UbuntuVM {
    $condition = C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe list runningvms | Select-String kali-linux-2024.2-virtualbox-amd64
    if ($null -ne $condition)
    {
        ssh.UbuntuVM
    }
    else
    {
        Vmon kali-linux-2024.2-virtualbox-amd64
        Do {
        $status = Test-NetConnection 127.0.0.1 -Port 3022 -InformationLevel Quiet
        Clear-Host
        } Until ($status -eq "True")
        Clear-Host
        ssh.UbuntuVM
        Clear-Host
    }
}
function lsVMS {C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe list vms}
function lsrVMS {C:\'Program Files'\Oracle\VirtualBox\VBoxManage.exe list runningvms}

oh-my-posh init pwsh --config "$env:UserProfile\.dotfiles\oh-my-posh\tau.omp.toml" | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })

fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
