#Define UNICODE
#Define _WIN32_WINNT &h0602
#Include Once "windows.bi"
#Include Once "Afx\CWindow.inc"
#define CODEGEN_FORM
#define CODEGEN_PROGRESSBAR
#define CODEGEN_PICTUREBOX
#define CODEGEN_BUTTON
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

type frmMainType extends wfxForm
    private:
        temp as byte
    public:
        declare static function FormInitializeComponent( byval pForm as frmMainType ptr ) as LRESULT
        declare constructor
        ' Controls
        ProgressBar1 As wfxProgressBar
        Picture1 As wfxPictureBox
        Picture2 As wfxPictureBox
        Button1 As wfxButton
        Label1 As wfxLabel
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
    dim mnuFileNew as wfxMenuItem = wfxMenuItem("&New", "mnuFileNew", "Ctrl+N", 0, 0)
    mnuFile.MenuItems.Add(mnuFileNew)
    pForm->MainMenu.MenuItems.Add(mnuFile)

    pForm->MainMenu.OnPopup = @frmMain_MainMenu_Popup
    pForm->MainMenu.OnClick = @frmMain_MainMenu_Click
    pForm->Controls.Add(ControlType.MainMenu, @(pForm->MainMenu))

    dim as long idxButton
    pForm->ToolBar.Buttons.Clear
    pForm->ToolBar.Parent = pForm
    pForm->ToolBar.ButtonSize = 16
    idxButton = pForm->ToolBar.Buttons.Add
    pForm->ToolBar.Button(idxButton).ButtonType = ToolBarButton.Button
    pForm->ToolBar.Button(idxButton).ToolTip = " New"
    pForm->ToolBar.Button(idxButton).NormalImage = ""
    pForm->ToolBar.Button(idxButton).HotImage = ""
    pForm->ToolBar.Button(idxButton).DisabledImage = ""
    pForm->ToolBar.OnClick = @frmMain_ToolBar_Click
    pForm->Controls.Add(controltype.ToolBar, @(pForm->ToolBar))

    dim as long idxPanel
    pForm->StatusBar.Panels.Clear
    pForm->StatusBar.Parent = pForm
    pForm->StatusBar.SizingGrip = false
    idxPanel = pForm->StatusBar.Panels.Add
    pForm->StatusBar.Panel(idxPanel).Text = "Status"
    pForm->StatusBar.Panel(idxPanel).Icon = ""
    pForm->StatusBar.Panel(idxPanel).ToolTip = "Status"
    pForm->StatusBar.Panel(idxPanel).Width = 100
    pForm->StatusBar.Panel(idxPanel).MinWidth = 100
    pForm->StatusBar.Panel(idxPanel).Alignment = StatusBarPanelAlignment.Left
    pForm->StatusBar.Panel(idxPanel).AutoSize = StatusBarPanelAutoSize.None
    pForm->StatusBar.Panel(idxPanel).BackColor = Colors.SystemControl
    pForm->StatusBar.Panel(idxPanel).BackColorHot = Colors.SystemControl
    pForm->StatusBar.Panel(idxPanel).ForeColor = Colors.SystemControlText
    pForm->StatusBar.Panel(idxPanel).ForeColorHot = Colors.SystemControlText
    idxPanel = pForm->StatusBar.Panels.Add
    pForm->StatusBar.Panel(idxPanel).Text = "Error"
    pForm->StatusBar.Panel(idxPanel).Icon = ""
    pForm->StatusBar.Panel(idxPanel).ToolTip = "Error"
    pForm->StatusBar.Panel(idxPanel).Width = 100
    pForm->StatusBar.Panel(idxPanel).MinWidth = 100
    pForm->StatusBar.Panel(idxPanel).Alignment = StatusBarPanelAlignment.Left
    pForm->StatusBar.Panel(idxPanel).AutoSize = StatusBarPanelAutoSize.None
    pForm->StatusBar.Panel(idxPanel).BackColor = Colors.SystemControl
    pForm->StatusBar.Panel(idxPanel).BackColorHot = Colors.SystemControl
    pForm->StatusBar.Panel(idxPanel).ForeColor = Colors.SystemControlText
    pForm->StatusBar.Panel(idxPanel).ForeColorHot = Colors.SystemControlText
    idxPanel = pForm->StatusBar.Panels.Add
    pForm->StatusBar.Panel(idxPanel).Text = ""
    pForm->StatusBar.Panel(idxPanel).Icon = ""
    pForm->StatusBar.Panel(idxPanel).ToolTip = "Progress"
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
    pForm->Text = "Form1"
    pForm->SetBounds(10,10,500,300)
    pForm->ProgressBar1.Parent = pForm
    pForm->ProgressBar1.Name = "ProgressBar1"
    pForm->ProgressBar1.Value = 33
    pForm->ProgressBar1.ToolTip = "Progress"
    pForm->ProgressBar1.SetBounds(302,214-nClientOffset,125,19)
    pForm->Picture1.Parent = pForm
    pForm->Picture1.Name = "Picture1"
    pForm->Picture1.Text = "Picture1"
    pForm->Picture1.SetBounds(437,214-nClientOffset,17,16)
    pForm->Picture2.Parent = pForm
    pForm->Picture2.Name = "Picture2"
    pForm->Picture2.Text = "Picture2"
    pForm->Picture2.SetBounds(466,214-nClientOffset,18,15)
    pForm->Button1.Parent = pForm
    pForm->Button1.Name = "Button1"
    pForm->Button1.ImageHighDPI = False
    pForm->Button1.Text = "ClickMe"
    pForm->Button1.ThemeSupport = False
    pForm->Button1.ToolTip = "ClickMe"
    pForm->Button1.SetBounds(164,112-nClientOffset,59,26)
    pForm->Label1.Parent = pForm
    pForm->Label1.Name = "Label1"
    pForm->Label1.Text = "Label1"
    pForm->Label1.SetBounds(30,184-nClientOffset,132,20)
    pForm->Controls.Add(ControlType.Button, @(pForm->Button1))
    pForm->Controls.Add(ControlType.ProgressBar, @(pForm->ProgressBar1))
    pForm->Controls.Add(ControlType.PictureBox, @(pForm->Picture1))
    pForm->Controls.Add(ControlType.PictureBox, @(pForm->Picture2))
    pForm->Controls.Add(ControlType.Label, @(pForm->Label1))
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

