# This is a fork of the original Debloat Windows 10.
# It is designed for a lighter debloat for gaming and general use.

Also, note that gaming-related apps and services will remain intact or will be reinstalled.

**There is no undo**, I recommend only using these scripts on a fresh
installation (including Windows Updates). Test everything after running them
before doing anything else. Also, there is no guarantee that everything will
work after future updates since I cannot predict what Microsoft will do next.

## Interactivity

The scripts are designed to run without any user interaction. Modify them
beforehand. If you want a more interactive approach check out
[DisableWinTracking](https://github.com/10se1ucgo/DisableWinTracking) from
[10se1ucgo](https://github.com/10se1ucgo).

## Download Latest Version

Code located in the `master` branch is always considered under development, but
you'll probably want the most recent version anyway.

- [Download [zip]](https://github.com/W4RH4WK/Debloat-Windows-10/archive/master.zip)

## Execution

Enable execution of PowerShell scripts:

    PS> Set-ExecutionPolicy Unrestricted -Scope CurrentUser

Unblock PowerShell scripts and modules within this directory:

    PS> ls -Recurse *.ps*1 | Unblock-File

## Usage

Scripts can be run individually, pick what you need.

1. Install all available updates for your system.
2. Edit the scripts to fit your need.
3. Run the scripts you want to apply from a PowerShell with administrator privileges (Explorer
   `Files > Open Windows PowerShell > Open Windows PowerShell as
   administrator`)
4. `PS > Restart-Computer`
5. Run `disable-windows-defender.ps1` one more time if you ran it in step 3
6. `PS > Restart-Computer`

## Liability

**All scripts are provided as-is and you use them at your own risk.**

## Contribute

I would be happy to extend the collection of scripts. Just open an issue or
send me a pull request.

### Thanks To

- [10se1ucgo](https://github.com/10se1ucgo)
- [Plumebit](https://github.com/Plumebit)
- [aramboi](https://github.com/aramboi)
- [maci0](https://github.com/maci0)
- [narutards](https://github.com/narutards)
- [tumpio](https://github.com/tumpio)

## License

    "THE BEER-WARE LICENSE" (Revision 42):

    As long as you retain this notice you can do whatever you want with this
    stuff. If we meet someday, and you think this stuff is worth it, you can
    buy us a beer in return.

    This project is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.
