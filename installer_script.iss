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
; Shows the Atom MIT License
LicenseFile={#ZIPLocation}\LICENSE
OutputBaseFilename=setup_{#AppVersion}
; This is the icon used for files to be opened by default with Atom
SetupIconFile={#ZIPLocation}\resources\cli\file.ico
; Simplest compression method, but also the fastest to decompress
; This is useful because the installation of the many tiny files included with Atom takes quite a while
Compression=zip/1
; Disabled because not recommended for installs >100MiB
SolidCompression=no
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "contextmenu"; Description: "Add Atom to the Windows explorer context menu"
; Checkboxes for the registry keys of the file extensions for a few languages
Name: "pythonreg"; Description: "Register Python file extensions"; Flags: unchecked
Name: "creg"; Description: "Register C/C++ file extensions"; Flags: unchecked
Name: "javareg"; Description: "Register Java file extensions"; Flags: unchecked

[Files]
Source: "{#ZIPLocation}\atom.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#ZIPLocation}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{commonprograms}\{#AppName}"; Filename: "{app}\{#AppExeName}"
Name: "{commondesktop}\{#AppName}"; Filename: "{app}\{#AppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#AppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(AppName, '&', '&&')}}"; \
  Flags: nowait postinstall skipifsilent

[Registry]
; These are the registry entries required to add Atom to the Windows explorer context menu
; These are only created when the user does not uncheck the Task (see [Tasks]) "contextmenu"
Root: HKCR; Subkey: "*\shell\Atom"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom\command"; Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom"; ValueName: ""; ValueType: string; ValueData: "Open with Atom"; \
  Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom"; ValueName: "Icon"; ValueType: string; ValueData: "{app}\{#AppExeName}"; \
  Flags: uninsdeletekey; Tasks: contextmenu
Root: HKCR; Subkey: "*\shell\Atom\command"; ValueName: ""; ValueType: string; ValueData: "{app}\{#AppExeName} '%1'"; \
  Flags: uninsdeletekey; Tasks: contextmenu
; Registry keys for each language file extensions
Root: HKCR; Subkey: ".py"; ValueName: ""; ValueType: string; ValueData: "{app}\{#AppExeName}}"; \
  Flags: uninsdeletevalue; Tasks: pythonreg
Root: HKCR; Subkey: ".c"; ValueName: ""; ValueType: string; ValueData: "{app}\{#AppExeName}}"; \
  Flags: uninsdeletevalue; Tasks: creg
Root: HKCR; Subkey: ".h"; ValueName: ""; ValueType: string; ValueData: "{app}\{#AppExeName}}"; \
  Flags: uninsdeletevalue; Tasks: creg
Root: HKCR; Subkey: ".cpp"; ValueName: ""; ValueType: string; ValueData: "{app}\{#AppExeName}}"; \
  Flags: uninsdeletevalue; Tasks: creg
Root: HKCR; Subkey: ".java"; ValueName: ""; ValueType: string; ValueData: "{app}\{#AppExeName}}"; \
  Flags: uninsdeletevalue; Tasks: javareg
; Default registry keys for file extension associations
Root: HKCR; Subkey: "{#AppName}"; ValueName: ""; ValueType: string; ValueData: "Program {#AppName}"; \
  Flags: uninsdeletekey
Root: HKCR; Subkey: "{#AppName}\DefaultIcon"; ValueName: ""; ValueType: string; \
  ValueData: "{app}\resources\resources\cli\file.ico";  Flags: uninsdeletekey
Root: HKCR; Subkey: "{#AppName}\shell\open\command";  ValueName: ""; ValueType: string; \
  ValueData: """{app}\{#AppExeName}"" ""%1""";  Flags: uninsdeletekey
