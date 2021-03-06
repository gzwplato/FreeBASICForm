#Define UNICODE
#Define _WIN32_WINNT &h0602
#Include Once "windows.bi"
#Include Once "Afx\CWindow.inc"
#define CODEGEN_FORM
#define CODEGEN_PROGRESSBAR
#define CODEGEN_PICTUREBOX
#define CODEGEN_LABEL
#define CODEGEN_MAINMENU
#define CODEGEN_TOOLBAR
#define CODEGEN_STATUSBAR
#Include once "WinFormsX\WinFormsX.bi"
Using Afx

' WINFBE_CODEGEN_START

Declare Function frmMain_MainMenu_Click( ByRef sender As wfxMenuItem, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_MainMenu_Popup( ByRef sender As wfxMenuItem, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_ToolBar_Click( ByRef sender As wfxToolBar, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_StatusBar_Click( ByRef sender As wfxStatusBar, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_Load( ByRef sender As wfxForm, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_Resize( ByRef sender As wfxForm, ByRef e As EventArgs ) As LRESULT
Declare Function frmMain_FormClosing( ByRef sender As wfxForm, ByRef e As EventArgs ) As LRESULT

type frmMainType extends wfxForm
    private:
        temp as byte
    public:
        declare static function FormInitializeComponent( byval pForm as frmMainType ptr ) as LRESULT
        declare constructor
        ' Controls
        prgProgress As wfxProgressBar
        picAction As wfxPictureBox
        picDirty As wfxPictureBox
        lblStatus As wfxLabel
        lblError As wfxLabel
end type


function frmMainType.FormInitializeComponent( byval pForm as frmMainType ptr ) as LRESULT
    dim as long nClientOffset

    dim ncm As NONCLIENTMETRICS
    ncm.cbSize = SizeOf(ncm)
    SystemParametersInfo(SPI_GETNONCLIENTMETRICS, SizeOf(ncm), @ncm, 0)
    nClientOffset = AfxUnScaleY(ncm.iMenuHeight)  ' holds the height of the mainmenu

    pForm->MainMenu.MenuItems.Clear
    pForm->MainMenu.Parent = pForm
    dim mnuFile as wfxMenuItem = wfxMenuItem("&File", "mnuFile", "", 0, 0)
    dim mnuFileNew as wfxMenuItem = wfxMenuItem("&New", "mnuFileNew", "Ctrl+N", 1, 0)
    dim mnuFileOpen as wfxMenuItem = wfxMenuItem("&Open...", "mnuFileOpen", "Ctrl+O", 0, 0)
    dim mnuFileSave as wfxMenuItem = wfxMenuItem("&Save", "mnuFileSave", "Ctrl+S", 0, 0)
    dim mnuFileSaveAs as wfxMenuItem = wfxMenuItem("Save &As...", "mnuFileSaveAs", "", 0, 0)
    dim mnuFileSep1 as wfxMenuItem = wfxMenuItem("-", "mnuFileSep1", "", 0, 0)
    dim mnuFilePrint as wfxMenuItem = wfxMenuItem("&Print", "mnuFilePrint", "Ctrl+P", 0, 0)
    dim mnuFilePrintSetup as wfxMenuItem = wfxMenuItem("P&rint Setup...", "mnuFilePrintSetup", "", 0, 0)
    dim mnuFileSep2 as wfxMenuItem = wfxMenuItem("-", "mnuFileSep2", "", 0, 0)
    dim mnuFileExit as wfxMenuItem = wfxMenuItem("E&xit", "mnuFileExit", "Ctrl+Q", 0, 0)
    dim mnuEdit as wfxMenuItem = wfxMenuItem("&Edit", "mnuEdit", "", 0, 0)
    dim mnuEditUndo as wfxMenuItem = wfxMenuItem("&Undo", "mnuEditUndo", "Ctrl+Z", 0, 0)
    dim mnuEditRedo as wfxMenuItem = wfxMenuItem("&Redo", "mnuEditRedo", "Ctrl+Y", 0, 0)
    dim mnuEditSep1 as wfxMenuItem = wfxMenuItem("-", "mnuEditSep1", "", 0, 0)
    dim mnuEditSelectAll as wfxMenuItem = wfxMenuItem("Select &All", "mnuEditSelectAll", "Ctrl+A", 0, 0)
    dim mnuEditCut as wfxMenuItem = wfxMenuItem("Cu&t", "mnuEditCut", "Ctrl+X", 0, 0)
    dim mnuEditCopy as wfxMenuItem = wfxMenuItem("&Copy", "mnuEditCopy", "Ctrl+C", 0, 0)
    dim mnuEditPaste as wfxMenuItem = wfxMenuItem("&Paste", "mnuEditPaste", "Ctrl+V", 0, 0)
    dim mnuEditPasteSpecial as wfxMenuItem = wfxMenuItem("Paste &Special...", "mnuEditPasteSpecial", "", 0, 0)
    dim mnuEditDelete as wfxMenuItem = wfxMenuItem("&Delete", "mnuEditDelete", "Del", 0, 0)
    dim mnuEditSep2 as wfxMenuItem = wfxMenuItem("-", "mnuEditSep2", "", 0, 0)
    dim mnuEditFind as wfxMenuItem = wfxMenuItem("&Find...", "mnuEditFind", "Ctrl+F", 0, 0)
    dim mnuEditReplace as wfxMenuItem = wfxMenuItem("Rep&lace...", "mnuEditReplace", "Ctrl+H", 0, 0)
    dim mnuEditGoTo as wfxMenuItem = wfxMenuItem("&Go To...", "mnuEditGoTo", "", 0, 0)
    dim mnuEditSep3 as wfxMenuItem = wfxMenuItem("-", "mnuEditSep3", "", 0, 0)
    dim mnuEditRefresh as wfxMenuItem = wfxMenuItem("&Refresh", "mnuEditRefresh", "F5", 0, 0)
    dim mnuEditSep4 as wfxMenuItem = wfxMenuItem("-", "mnuEditSep4", "", 0, 0)
    dim mnuEditProperties as wfxMenuItem = wfxMenuItem("Pr&operties...", "mnuEditProperties", "", 0, 0)
    dim mnuEditPreferences as wfxMenuItem = wfxMenuItem("Pr&eferences...", "mnuEditPreferences", "", 0, 0)
    dim mnuWindow as wfxMenuItem = wfxMenuItem("&Window", "mnuWindow", "", 0, 0)
    dim mnuWindowNewWindow as wfxMenuItem = wfxMenuItem("&New Window", "mnuWindowNewWindow", "", 0, 0)
    dim mnuWindowTile as wfxMenuItem = wfxMenuItem("&Tile", "mnuWindowTile", "", 0, 0)
    dim mnuWindowCascade as wfxMenuItem = wfxMenuItem("&Cascade", "mnuWindowCascade", "", 0, 0)
    dim mnuWindowArrangeAll as wfxMenuItem = wfxMenuItem("&Arrange All", "mnuWindowArrangeAll", "", 0, 0)
    dim mnuWindowSep1 as wfxMenuItem = wfxMenuItem("-", "mnuWindowSep1", "", 0, 0)
    dim mnuWindowHide as wfxMenuItem = wfxMenuItem("&Hide", "mnuWindowHide", "", 0, 0)
    dim mnuWindowShow as wfxMenuItem = wfxMenuItem("&Show", "mnuWindowShow", "", 0, 0)
    dim mnuHelp as wfxMenuItem = wfxMenuItem("&Help", "mnuHelp", "", 0, 0)
    dim mnuHelpHelpContents as wfxMenuItem = wfxMenuItem("Help &Contents", "mnuHelpHelpContents", "F1", 0, 0)
    dim mnuHelpHelpIndex as wfxMenuItem = wfxMenuItem("Help &Index", "mnuHelpHelpIndex", "", 0, 0)
    dim mnuHelpHelpOnHelp as wfxMenuItem = wfxMenuItem("Help &On Help", "mnuHelpHelpOnHelp", "", 0, 0)
    dim mnuHelpSep1 as wfxMenuItem = wfxMenuItem("-", "mnuHelpSep1", "", 0, 0)
    dim mnuHelpLicenceInformation as wfxMenuItem = wfxMenuItem("&Licence Information", "mnuHelpLicenceInformation", "", 0, 0)
    dim mnuHelpCheckforUpdates as wfxMenuItem = wfxMenuItem("&Check for Updates", "mnuHelpCheckforUpdates", "", 0, 0)
    dim mnuHelpSep2 as wfxMenuItem = wfxMenuItem("-", "mnuHelpSep2", "", 0, 0)
    dim mnuHelpAbout as wfxMenuItem = wfxMenuItem("&About TemplateApplication...", "mnuHelpAbout", "", 0, 0)
    mnuFile.MenuItems.Add(mnuFileNew)
    mnuFile.MenuItems.Add(mnuFileOpen)
    mnuFile.MenuItems.Add(mnuFileSave)
    mnuFile.MenuItems.Add(mnuFileSaveAs)
    mnuFile.MenuItems.Add(mnuFileSep1)
    mnuFile.MenuItems.Add(mnuFilePrint)
    mnuFile.MenuItems.Add(mnuFilePrintSetup)
    mnuFile.MenuItems.Add(mnuFileSep2)
    mnuFile.MenuItems.Add(mnuFileExit)
    pForm->MainMenu.MenuItems.Add(mnuFile)
    mnuEdit.MenuItems.Add(mnuEditUndo)
    mnuEdit.MenuItems.Add(mnuEditRedo)
    mnuEdit.MenuItems.Add(mnuEditSep1)
    mnuEdit.MenuItems.Add(mnuEditSelectAll)
    mnuEdit.MenuItems.Add(mnuEditCut)
    mnuEdit.MenuItems.Add(mnuEditCopy)
    mnuEdit.MenuItems.Add(mnuEditPaste)
    mnuEdit.MenuItems.Add(mnuEditPasteSpecial)
    mnuEdit.MenuItems.Add(mnuEditDelete)
    mnuEdit.MenuItems.Add(mnuEditSep2)
    mnuEdit.MenuItems.Add(mnuEditFind)
    mnuEdit.MenuItems.Add(mnuEditReplace)
    mnuEdit.MenuItems.Add(mnuEditGoTo)
    mnuEdit.MenuItems.Add(mnuEditSep3)
    mnuEdit.MenuItems.Add(mnuEditRefresh)
    mnuEdit.MenuItems.Add(mnuEditSep4)
    mnuEdit.MenuItems.Add(mnuEditProperties)
    mnuEdit.MenuItems.Add(mnuEditPreferences)
    pForm->MainMenu.MenuItems.Add(mnuEdit)
    mnuWindow.MenuItems.Add(mnuWindowNewWindow)
    mnuWindow.MenuItems.Add(mnuWindowTile)
    mnuWindow.MenuItems.Add(mnuWindowCascade)
    mnuWindow.MenuItems.Add(mnuWindowArrangeAll)
    mnuWindow.MenuItems.Add(mnuWindowSep1)
    mnuWindow.MenuItems.Add(mnuWindowHide)
    mnuWindow.MenuItems.Add(mnuWindowShow)
    pForm->MainMenu.MenuItems.Add(mnuWindow)
    mnuHelp.MenuItems.Add(mnuHelpHelpContents)
    mnuHelp.MenuItems.Add(mnuHelpHelpIndex)
    mnuHelp.MenuItems.Add(mnuHelpHelpOnHelp)
    mnuHelp.MenuItems.Add(mnuHelpSep1)
    mnuHelp.MenuItems.Add(mnuHelpLicenceInformation)
    mnuHelp.MenuItems.Add(mnuHelpCheckforUpdates)
    mnuHelp.MenuItems.Add(mnuHelpSep2)
    mnuHelp.MenuItems.Add(mnuHelpAbout)
    pForm->MainMenu.MenuItems.Add(mnuHelp)

    pForm->MainMenu.OnPopup = @frmMain_MainMenu_Popup
    pForm->MainMenu.OnClick = @frmMain_MainMenu_Click
    pForm->Controls.Add(ControlType.MainMenu, @(pForm->MainMenu))

    dim as long idxButton
    pForm->ToolBar.Buttons.Clear
    pForm->ToolBar.Parent = pForm
    pForm->ToolBar.ButtonSize = 16
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :New"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_NEW"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_NEW"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_NEW"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Open"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_OPEN"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_OPEN"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_OPEN"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Save"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_SAVE"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_SAVE"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_SAVE"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Print"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_PRINT"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_PRINT"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_PRINT"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Separator
    pForm->ToolBar.Button(idxButton).ToolTip = ""
    pForm->ToolBar.Button(idxButton).NormalImage = ""
    pForm->ToolBar.Button(idxButton).HotImage = ""
    pForm->ToolBar.Button(idxButton).DisabledImage = ""
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Undo"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_UNDO"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_UNDO"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_UNDO"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Redo"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_REDO"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_REDO"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_REDO"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Cut"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_CUT"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_CUT"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_CUT"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Copy"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_COPY"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_COPY"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_COPY"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Paste"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_PASTE"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_PASTE"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_PASTE"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Find"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_FIND"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_FIND"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_FIND"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Replace"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_REPLACE"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_REPLACE"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_REPLACE"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Refresh"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_REFRESH"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_REFRESH"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_REFRESH"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Preferences"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_PREFERENCES"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_PREFERENCES"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_PREFERENCES"
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Separator
    pForm->ToolBar.Button(idxButton).ToolTip = ""
    pForm->ToolBar.Button(idxButton).NormalImage = ""
    pForm->ToolBar.Button(idxButton).HotImage = ""
    pForm->ToolBar.Button(idxButton).DisabledImage = ""
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " :Help"
    pForm->ToolBar.Button(idxButton).NormalImage = "IMAGE_HELP"
    pForm->ToolBar.Button(idxButton).HotImage = "IMAGE_HELP"
    pForm->ToolBar.Button(idxButton).DisabledImage = "IMAGE_HELP"
    pForm->ToolBar.OnClick = @frmMain_ToolBar_Click
    pForm->Controls.Add(controltype.ToolBar, @(pForm->ToolBar))

    dim as long idxPanel
    pForm->StatusBar.Panels.Clear
    pForm->StatusBar.Parent = pForm
    pForm->StatusBar.SizingGrip = false
    idxPanel = pForm->StatusBar.Panels.Add
    pForm->StatusBar.Panel(idxPanel).Text = ""
    pForm->StatusBar.Panel(idxPanel).Icon = ""
    pForm->StatusBar.Panel(idxPanel).ToolTip = ""
    pForm->StatusBar.Panel(idxPanel).Width = 100
    pForm->StatusBar.Panel(idxPanel).MinWidth = 100
    pForm->StatusBar.Panel(idxPanel).Alignment = StatusBarPanelAlignment.Left
    pForm->StatusBar.Panel(idxPanel).AutoSize = StatusBarPanelAutoSize.None
    pForm->StatusBar.Panel(idxPanel).BackColor = Colors.SystemControl
    pForm->StatusBar.Panel(idxPanel).BackColorHot = Colors.SystemControl
    pForm->StatusBar.Panel(idxPanel).ForeColor = Colors.SystemControlText
    pForm->StatusBar.Panel(idxPanel).ForeColorHot = Colors.SystemControlText
    pForm->StatusBar.OnClick = @frmMain_StatusBar_Click
    pForm->Controls.Add(controltype.StatusBar, @(pForm->StatusBar))

    pForm->Name = "frmMain"
    pForm->Text = "(new) - FreeBASIC Generic GUI w/ WinFBE"
    pForm->Icon = "IMAGE_FBLOGO32"
    pForm->SetBounds(10,10,640,480)
    pForm->OnLoad = @frmMain_Load
    pForm->OnResize = @frmMain_Resize
    pForm->OnFormClosing = @frmMain_FormClosing
    pForm->prgProgress.Parent = pForm
    pForm->prgProgress.Name = "prgProgress"
    pForm->prgProgress.Value = 33
    pForm->prgProgress.ToolTip = "Progress"
    pForm->prgProgress.Visible = False
    pForm->prgProgress.SetBounds(444,393-nClientOffset,125,19)
    pForm->picAction.Parent = pForm
    pForm->picAction.Name = "picAction"
    pForm->picAction.BackColor = Colors.SystemControl
    pForm->picAction.BackColorHot = Colors.SystemControl
    pForm->picAction.Visible = False
    pForm->picAction.ToolTip = "Action"
    pForm->picAction.SetBounds(575,393-nClientOffset,16,16)
    pForm->picDirty.Parent = pForm
    pForm->picDirty.Name = "picDirty"
    pForm->picDirty.BackColor = Colors.SystemControl
    pForm->picDirty.BackColorHot = Colors.SystemControl
    pForm->picDirty.Visible = False
    pForm->picDirty.Image = "IMAGE_SAVE"
    pForm->picDirty.ToolTip = "Dirty"
    pForm->picDirty.SetBounds(599,393-nClientOffset,16,16)
    pForm->lblStatus.Parent = pForm
    pForm->lblStatus.Name = "lblStatus"
    pForm->lblStatus.Text = "Status"
    pForm->lblStatus.ForeColor = Colors.Green
    pForm->lblStatus.ToolTip = "Status"
    pForm->lblStatus.SetBounds(8,393-nClientOffset,218,20)
    pForm->lblError.Parent = pForm
    pForm->lblError.Name = "lblError"
    pForm->lblError.Text = "Error"
    pForm->lblError.ForeColor = Colors.Red
    pForm->lblError.ToolTip = "Error"
    pForm->lblError.SetBounds(234,393-nClientOffset,202,20)
    pForm->Controls.Add(ControlType.ProgressBar, @(pForm->prgProgress))
    pForm->Controls.Add(ControlType.PictureBox, @(pForm->picAction))
    pForm->Controls.Add(ControlType.PictureBox, @(pForm->picDirty))
    pForm->Controls.Add(ControlType.Label, @(pForm->lblStatus))
    pForm->Controls.Add(ControlType.Label, @(pForm->lblError))
    Application.Forms.Add(ControlType.Form, pForm)
    function = 0
end function

constructor frmMainType
    InitializeComponent = cast( any ptr, @FormInitializeComponent )
    this.FormInitializeComponent( @this )
end constructor

dim shared frmMain as frmMainType

' WINFBE_CODEGEN_END

' ========================================================================================
' WinFBE - FreeBASIC Editor (Windows 32/64 bit)
' Visual Designer auto generated project
' ========================================================================================

' Main application entry point.
' Place any additional global variables or #include files here.

' For your convenience, below are some of the most commonly used WinFBX library
' include files. Uncomment the files that you wish to use in the project or add
' additional ones. Refer to the WinFBX Framework Help documentation for information
' on how to use the various functions.

' #Include Once "Afx\AfxFile.inc"
' #Include Once "Afx\AfxStr.inc"
' #Include Once "Afx\AfxTime.inc"
' #Include Once "Afx\CIniFile.inc"
' #Include Once "Afx\CMoney.inc"
' #Include Once "Afx\CPrint.inc"


Application.Run(frmMain)

#include once "F:\Projects\FreeBASIC\FreeBASICForm\frmMain.inc"

