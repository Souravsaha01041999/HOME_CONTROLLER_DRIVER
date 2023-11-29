VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BackColor       =   &H00808080&
   ClientHeight    =   3360
   ClientLeft      =   3225
   ClientTop       =   4080
   ClientWidth     =   15225
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3360
   ScaleWidth      =   15225
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2040
      Top             =   480
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   480
      Top             =   2280
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   300
      Left            =   1080
      Top             =   600
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackColor       =   &H00808080&
      Caption         =   "READY"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   435
      Left            =   11280
      TabIndex        =   1
      Top             =   480
      Width           =   1305
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00808080&
      FillColor       =   &H000000FF&
      FillStyle       =   0  'Solid
      Height          =   615
      Left            =   12720
      Shape           =   3  'Circle
      Top             =   360
      Width           =   975
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackColor       =   &H00808080&
      Caption         =   "HOME CONTROLLER DRIVER MADE BY SOURAV"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   30
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   690
      Left            =   360
      TabIndex        =   0
      Top             =   1440
      Width           =   14640
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim l1 As String, l2 As String, l3 As String, f As String, x As Integer, ll1 As String, ll2 As String, ll3 As String, ff As String
Private Sub Form_KeyPress(KeyAscii As Integer)
If KeyAscii = 27 Then
MSComm1.PortOpen = False
End
End If
End Sub
Private Sub Form_Load()              'A-D ON /m a-d OFF
On Error Resume Next
x = 0
MSComm1.CommPort = 3
MSComm1.PortOpen = True
If Err.Number = 8002 Then
MsgBox "PORT NOT FOUND", vbCritical, "ERROR"
End
End If
Open "C:\wamp64\www\HELLO_FRIENDS\light1.txt" For Input As #1
Open "C:\wamp64\www\HELLO_FRIENDS\light2.txt" For Input As #2
Open "C:\wamp64\www\HELLO_FRIENDS\light3.txt" For Input As #3
Open "C:\wamp64\www\HELLO_FRIENDS\fan.txt" For Input As #4
Input #1, l1
Input #2, l2
Input #3, l3
Input #4, f
Close #1
Close #2
Close #3
Close #4
Timer1.Enabled = True
End Sub
Private Sub Form_Unload(Cancel As Integer)
MSComm1.PortOpen = False
End Sub
Private Sub Timer1_Timer()
If x = 0 Then
If l1 = "light1 on" Then
MSComm1.Output = "A"
ElseIf l1 = "light1 off" Then
MSComm1.Output = "a"
End If
x = x + 1
ElseIf x = 1 Then
If l2 = "light2 on" Then
MSComm1.Output = "B"
ElseIf l2 = "light2 off" Then
MSComm1.Output = "b"
End If
x = x + 1
ElseIf x = 2 Then
If l3 = "light3 on" Then
MSComm1.Output = "C"
ElseIf l3 = "light3 off" Then
MSComm1.Output = "c"
End If
x = x + 1
ElseIf x = 3 Then
If f = "fan on" Then
MSComm1.Output = "D"
ElseIf f = "fan off" Then
MSComm1.Output = "d"
End If
x = x + 1
Else
Timer2.Enabled = True
Timer1.Enabled = False
Shape1.FillColor = &HFF00&
Beep
End If
End Sub
Private Sub Timer2_Timer()
Open "C:\wamp64\www\HELLO_FRIENDS\light1.txt" For Input As #1
Open "C:\wamp64\www\HELLO_FRIENDS\light2.txt" For Input As #2
Open "C:\wamp64\www\HELLO_FRIENDS\light3.txt" For Input As #3
Open "C:\wamp64\www\HELLO_FRIENDS\fan.txt" For Input As #4
Input #1, ll1
Input #2, ll2
Input #3, ll3
Input #4, ff
Close #1
Close #2
Close #3
Close #4
If l1 <> ll1 Then
l1 = ll1
If l1 = "light1 on" Then
MSComm1.Output = "A"
ElseIf l1 = "light1 off" Then
MSComm1.Output = "a"
End If
ElseIf l2 <> ll2 Then
l2 = ll2
If l2 = "light2 on" Then
MSComm1.Output = "B"
ElseIf l2 = "light2 off" Then
MSComm1.Output = "b"
End If
ElseIf l3 <> ll3 Then
l3 = ll3
If l3 = "light3 on" Then
MSComm1.Output = "C"
ElseIf l3 = "light3 off" Then
MSComm1.Output = "c"
End If
ElseIf f <> ff Then
f = ff
If f = "fan on" Then
MSComm1.Output = "D"
ElseIf f = "fan off" Then
MSComm1.Output = "d"
End If
End If
End Sub
