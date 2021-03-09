Type StatusBarViewModel
    Declare Constructor()
    Declare Constructor( _
        ByRef ctlStatusMessageParam As wfxLabel, _
        ByRef ctlErrorMessageParam As wfxLabel, _
        ByRef ctlProgressBarParam As wfxProgressBar, _
        ByRef ctlActionIconParam As wfxPictureBox, _
        ByRef ctlDirtyIconParam As wfxPictureBox _
    )
    Destructor()
end type


Constructor( _
    ByRef ctlStatusMessageParam As wfxLabel, _
    ByRef ctlErrorMessageParam As wfxLabel, _
    ByRef ctlProgressBarParam As wfxProgressBar, _
    ByRef ctlActionIconParam As wfxPictureBox, _
    ByRef ctlDirtyIconParam As wfxPictureBox _
    )

    ctlStatusMessage = ctlStatusMessageParam
    ctlErrorMessage = ctlErrorMessageParam
    ctlProgressBar = ctlProgressBarParam
    ctlActionIcon = ctlActionIconParam
    ctlDirtyIcon = ctlDirtyIconParam

'Catch 'ex As Exception
    'Debug Log.FormatError(Error.Text, Error.Where, Error.BackTrace)

    'Error.Propagate 'Throw

End Constructor

Destructor()

    ctlStatusMessage = Null
    ctlErrorMessage = Null
    ctlProgressBar = Null
    ctlActionIcon = Null
    ctlDirtyIcon = Null

'Catch 'ex As Exception
    'Debug Log.FormatError(Error.Text, Error.Where, Error.BackTrace)

    'Error.Propagate 'Throw

End Destructor

'Fields
Private ctlStatusMessage As wfxLabel
Private ctlErrorMessage As wfxLabel
Private ctlProgressBar As wfxProgressBar
Private ctlActionIcon As wfxPictureBox
Private ctlDirtyIcon As wfxPictureBox


Public Sub StartProgressBarWithPicture( _
    sStatusMessage As String, _
    sErrorMessage As String, _
    objImage As Picture, _
    isMarqueeProgressBarStyle As Boolean, _
    fProgressBarValue As Float _
)

    ctlProgressBar.Pulse = isMarqueeProgressBarStyle
    'set to blocks if actual percentage was used.
    ctlProgressBar.Value = fProgressBarValue
    'set to value if percentage used.
    'if Style is not Marquee, then we are marking either a count or percentage
    If fProgressBarValue > 1 Then 'ctlProgressBar.Maximum
        'ctlProgressBar.Step = 1
        ctlProgressBar.Value = 1
    Endif

    ctlStatusMessage.Text = sStatusMessage
    ctlErrorMessage.Text = sErrorMessage
    ctlErrorMessage.ToolTip = sErrorMessage

    ctlProgressBar.Visible = True

    ctlActionIcon.Picture = objImage
    ctlActionIcon.Tooltip = sStatusMessage
    ctlActionIcon.Visible = True

    'give the app time to draw the eye-candy, even if its only for an instant
    'TODO:DoEvents
'Catch 'ex As Exception
    'Debug Log.FormatError(Error.Text, Error.Where, Error.BackTrace)

    'Error.Propagate 'Throw

End Sub

''' <summary>
''' Update percentage changes.
''' </summary>
''' <param name="sStatusMessage"></param>
''' <param name="fProgressBarValue"></param>
Public Sub UpdateProgressBar( _
    sStatusMessage As String, _
    fProgressBarValue As Float _
)
    'Try

    If Not IsNull(sStatusMessage) Then
        ctlStatusMessage.Text = sStatusMessage
    Endif

    'if Style is not Marquee, then we are marking either a count or percentage
    'if we are simply counting, the progress bar will periodically need to adjust the Maximum.
    If fProgressBarValue > 1 Then 'ctlProgressBar.Maximum
        'ctlProgressBar.Maximum = ctlProgressBar.Maximum * 2
        ctlProgressBar.Value = ctlProgressBar.Value / 2
    Endif

    ctlProgressBar.Value = fProgressBarValue

    'give the app time to draw the eye-candy, even if its only for an instant
    'TODO:DoEvents
'Catch 'ex As Exception
    'Debug Log.FormatError(Error.Text, Error.Where, Error.BackTrace)

    'Error.Propagate 'Throw

End Sub

''' <summary>
''' Update message(s) only, without changing progress bar.
''' Null parameter will leave a message unchanged;
''' "" will clear it.
''' Optional doEvents flag will determine if
''' messages are processed before continuing.
''' </summary>
''' <param name="sStatusMessage"></param>
''' <param name="errorMessage"></param>
Public Sub UpdateStatusBarMessages( _
    sStatusMessage As String, _
    sErrorMessage As String _
)

    If Not IsNull(sStatusMessage) Then
        ctlStatusMessage.Text = sStatusMessage
    Endif
    If Not IsNull(sErrorMessage) Then
        ctlErrorMessage.Text = sErrorMessage
        ctlErrorMessage.ToolTip = sErrorMessage
    Endif

    'give the app time to draw the eye-candy, even if its only for an instant
    'TODO:DoEvents
'Catch 'ex As Exception
    'Debug Log.FormatError(Error.Text, Error.Where, Error.BackTrace)

    'Error.Propagate 'Throw

End Sub

''' <summary>
''' Stop progress bar and display messages.
''' DoEvents will ensure messages are processed before continuing.
''' </summary>
''' <param name="sStatusMessage"></param>
''' <param name="sErrorMessage">Null parameter will leave a message unchanged; "" will clear it.</param>
Public Sub StopProgressBar( _
    sStatusMessage As String, _
    sErrorMessage As String = Null _
)

    ctlStatusMessage.Text = sStatusMessage
    'do not clear error at end of operation, clear it at start of operation
    If sErrorMessage <> Null Then
        'this.StatusBarErrorMessage.ToolTipText = errorMessage;
        ctlErrorMessage.Text = sErrorMessage
    Endif

    ctlProgressBar.Pulse = False
    'reset back to marquee (default) in case actual percentage was used
    'ctlProgressBar.Maximum = 100
    'ditto
    ' ctlProgressBar.Step = 10
    'ditto
    ctlProgressBar.Value = 0
    'ditto
    ctlProgressBar.Visible = False
    'false;
    ctlActionIcon.Visible = False
    ' false;

    ctlActionIcon.Image = Null
    ctlActionIcon.Tooltip = Null

    'give the app time to draw the eye-candy, even if its only for an instant
    'TODO:DoEvents
'Catch 'ex As Exception
    'Debug Log.FormatError(Error.Text, Error.Where, Error.BackTrace)

    'Error.Propagate 'Throw

End Sub

