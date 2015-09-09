unit ThreadAnimasi;

interface

uses
  Classes;

type
  AnimationView = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
uses preview;

{ Important: Methods and properties of objects in VCL or CLX can only be used
  in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure AnimationView.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ AnimationView }

procedure AnimationView.Execute;
begin
  { Place thread code here }
  form2.Timer1.Enabled:=true;
end;

end.
