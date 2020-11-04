unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, WordXP, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    W: TWordApplication;
    procedure Button1Click(Sender: TObject);
  private
   WordApp: Variant;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses
  ComObj;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//  W.Selection.Tables.Item(1)
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;
  WordApp.Documents.Add;

    WordApp.Selection.TypeText('DC SYSTEM');
    WordApp.Selection.HomeKey(wdLine, wdExtend);
    WordApp.Selection.Font.Bold := wdToggle ;
    WordApp.Selection.Font.BoldBi := wdToggle ;
    WordApp.Selection.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    WordApp.Selection.EndKey(wdLine);
    WordApp.Selection.TypeParagraph;
    WordApp.Selection.TypeParagraph ;
    WordApp.Selection.Font.Bold := wdToggle ;
    WordApp.Selection.Font.BoldBi := wdToggle;
    WordApp.Selection.TypeText('THIS IS A TEST FOR LVDC');
    WordApp.Selection.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    WordApp.Selection.TypeParagraph;
    WordApp.Selection.TypeParagraph;
    WordApp.ActiveDocument.Tables.Add(WordApp.Selection.Range, 2, 5, wdWord9TableBehavior,  wdAutoFitFixed );

       // If WordApp.Selection.Table(1).Style <> 'Table Grid' Then
      //      WordApp.Selection.Table(1).Style := 'Table Grid';

           SHOWMESSAGE('A');
        WordApp.Selection.Tables.Item(1).ApplyStyleHeadingRows := True ;
        WordApp.Selection.Tables.Item(1).ApplyStyleLastRow := True  ;
        WordApp.Selection.Tables.Item(1).ApplyStyleFirstColumn := True ;
        WordApp.Selection.Tables.Item(1).ApplyStyleLastColumn := True ;
           SHOWMESSAGE('b');
    WordApp.Selection.TypeText('EQUIPMENT');
    WordApp.Selection.MoveRight(wdCell);
    WordApp.Selection.TypeText('CURRENT(A)');
    WordApp.Selection.MoveDown(wdLine,1);
    WordApp.Selection.TypeText('12');
    WordApp.Selection.MoveLeft(wdCharacter, 3);
    WordApp.Selection.TypeText('C.B MOTOR');
    WordApp.Selection.MoveUp (wdLine,2);
    WordApp.Selection.MoveDown (wdLine, 1);
    WordApp.Selection.EndKey (wdLine);
    WordApp.Selection.HomeKey (wdLine, wdExtend);
    WordApp.Selection.Font.Bold := wdToggle;
    WordApp.Selection.Font.BoldBi := wdToggle;
    WordApp.Selection.MoveRight (wdCharacter, 1);
    WordApp.Selection.EndKey(wdLine);
    WordApp.Selection.MoveRight(wdCell);
    WordApp.Selection.Font.Bold := wdToggle;
    WordApp.Selection.Font.BoldBi := wdToggle;

end;

end.
