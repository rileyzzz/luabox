using System;
using Sandbox;
using Sandbox.UI;


public partial class CodeEditor : TextEntry
{
	public bool SyntaxHighlight { get; init; } = false;

	public CodeEditor()
	{
		this.Multiline = true;

		if ( SyntaxHighlight )
		{
			//this.Label.Style.Display = DisplayMode.None;
			// This is stupid.
			this.Label.Style.Opacity = 0.00001f;
			//this.Label.Style.Opacity = 0.5f;
		}

	}

	public override void DrawContent( ref RenderState state )
	{
		if ( SyntaxHighlight )
		{
			DrawText();
			//DrawCaret();
		}

		base.DrawContent( ref state );
	}

	protected void DrawText()
	{
		//Label.Text
		//Label.ScrollVelocity
		Graphics.DrawText( Label.Box.Rect.Shrink( 4 * ScaleFromScreen ), Label.Text, Color.White, Label.ComputedStyle.FontFamily, Label.ComputedStyle.FontSize?.Value ?? 0, 450, TextFlag.LeftTop );
	}

	protected void DrawCaret()
	{
		Label.ShouldDrawSelection = HasFocus;

		var blinkRate = 0.8f;

		if ( HasFocus && !Label.HasSelection() )
		{
			var blink = (TimeSinceNotInFocus * blinkRate) % blinkRate < (blinkRate * 0.5f);
			var caret = Label.GetCaretRect( CaretPosition );
			caret.Left = MathX.FloorToInt( caret.Left ); // avoid subpixel positions (blurry and ass)
			caret.Width = 1;

			var color = Color.White;
			//color.a *= blink ? 1.0f : 0f;

			Graphics.DrawRoundedRectangle( caret, color );
		}
	}
}
