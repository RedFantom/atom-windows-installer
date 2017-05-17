; Copyright (C) 2017 RedFantom
; Available under the license as described in LICENSE

; Define the location of your unpacked ZIP-file here
#define ZIPLocation "INSERT_PATH_HERE"
#define AppName "Atom"
; Update the version number when the Atom version is bumped
#define AppVersion "1.17.0"
#define AppPublisher "RedFantom"
; The links point to the normal Atom website
#define AppURL "https://atom.io"
#define SupportURL "https://discuss.atom.io"
#define UpdatesURL "https://www.github.com/atom/atom/releases"
#define AppExeName "atom.exe"

[Setup]
; This AppId is the same for all files, which means the uninstaller will be run before installation
; This is useful when updating the version using a new version of this very installer
AppId={{3D3FE6F6-C883-43EE-92B8-F723FF50406E}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#SupportURL}
AppUpdatesURL={#UpdatesURL}
DefaultDirName={pf64}\{#AppName}
DisableProgramGroupPage=yes
LicenseFile={#ZIPLocation}\LICENSE
OutputBaseFilename=setup_{#AppVersion}
SetupIconFile={#ZIPLocation}\resources\cli\file.ico
Compression=zip/1
; Disabled because not recommended for installs >100MiB
SolidCompression=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "contextmenu"; description: "Add Atom to the Windows explorer context menu"

[Files]
Source: "{#ZIPLocation}\atom.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#ZIPLocation}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{commonprograms}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{commondesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
; These are the registry entries required to add Atom to the Windows explorer context menu
; These are only created when the user does not uncheck the Task (see [Tasks]) "contextmenu"
Root: HKCR; Subkey: "*\shell\Atom"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom\command"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom"; ValueName: ""; ValueType: string; ValueData: "Open with Atom"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom"; ValueName: "Icon"; ValueType: string; ValueData: "{app}\atom.exe"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom\command"; ValueName: ""; ValueType: string; ValueData: "{app}\atom.exe %1"; Flags: uninsdeletekey; Tasks: contextmenu
