program GdiPlus10;

// Disable extended RTTI
{$IF CompilerVersion >= 21.0} // >= Delphi 2010
  {$WEAKLINKRTTI ON}
  {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

{$SetPEFlags 1}   // IMAGE_FILE_RELOCS_STRIPPED
{$SetPEFlags $20} // IMAGE_FILE_LARGE_ADDRESS_AWARE

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  GdiPlus in '..\..\..\Lib\GdiPlus.pas',
  uDemo in 'uDemo.pas',
  uDemoDrawLine in 'Getting Started\uDemoDrawLine.pas',
  uDemoDrawString in 'Getting Started\uDemoDrawString.pas',
  uDemoDrawLinesAndRectangles in 'Using a Pen to Draw Lines and Shapes\uDemoDrawLinesAndRectangles.pas',
  uDemoPenWidthAndAlignment in 'Using a Pen to Draw Lines and Shapes\uDemoPenWidthAndAlignment.pas',
  uDemoDrawLineCaps in 'Using a Pen to Draw Lines and Shapes\uDemoDrawLineCaps.pas',
  uDemoJoiningLines in 'Using a Pen to Draw Lines and Shapes\uDemoJoiningLines.pas',
  uDemoCustomDashedLine in 'Using a Pen to Draw Lines and Shapes\uDemoCustomDashedLine.pas',
  uDemoLineTexture in 'Using a Pen to Draw Lines and Shapes\uDemoLineTexture.pas',
  uDemoFillSolidColor in 'Using a Brush to Fill Shapes\uDemoFillSolidColor.pas',
  uDemoFillHatchPattern in 'Using a Brush to Fill Shapes\uDemoFillHatchPattern.pas',
  uDemoFillImageTexture in 'Using a Brush to Fill Shapes\uDemoFillImageTexture.pas',
  uDemoTileImage in 'Using a Brush to Fill Shapes\uDemoTileImage.pas',
  uDemoLoadDisplayBitmap in 'Using Images, Bitmaps and Metafiles\uDemoLoadDisplayBitmap.pas',
  uDemoLoadDisplayMetafile in 'Using Images, Bitmaps and Metafiles\uDemoLoadDisplayMetafile.pas',
  uDemoRecordMetafiles in 'Using Images, Bitmaps and Metafiles\uDemoRecordMetafiles.pas',
  uDemoCropAndScaleImages in 'Using Images, Bitmaps and Metafiles\uDemoCropAndScaleImages.pas',
  uDemoRotateReflectSkew in 'Using Images, Bitmaps and Metafiles\uDemoRotateReflectSkew.pas',
  GdiPlusHelpers in '..\..\..\Lib\GdiPlusHelpers.pas',
  uSourceCodeConverter in 'uSourceCodeConverter.pas',
  uDemoInterpolationMode in 'Using Images, Bitmaps and Metafiles\uDemoInterpolationMode.pas',
  uDemoThumbnails in 'Using Images, Bitmaps and Metafiles\uDemoThumbnails.pas',
  uDemoCachedBitmap in 'Using Images, Bitmaps and Metafiles\uDemoCachedBitmap.pas',
  uDemoAvoidAutomaticScaling in 'Using Images, Bitmaps and Metafiles\uDemoAvoidAutomaticScaling.pas',
  uDemoReadWriteMetaData in 'Using Images, Bitmaps and Metafiles\uDemoReadWriteMetaData.pas',
  uDemoListInstalledEncoders in 'Using Image Encoders and Decoders\uDemoListInstalledEncoders.pas',
  uDemoListInstalledDecoders in 'Using Image Encoders and Decoders\uDemoListInstalledDecoders.pas',
  uDemoGetEncoderClsid in 'Using Image Encoders and Decoders\uDemoGetEncoderClsid.pas',
  uDemoEncoderParameters in 'Using Image Encoders and Decoders\Encoder Parameters\uDemoEncoderParameters.pas',
  uDemoEncoderValue in 'Using Image Encoders and Decoders\Encoder Parameters\uDemoEncoderValue.pas',
  uDemoAllEncoderParameters in 'Using Image Encoders and Decoders\Encoder Parameters\uDemoAllEncoderParameters.pas',
  uDemoBmpToPng in 'Using Image Encoders and Decoders\uDemoBmpToPng.pas',
  uDemoJpegCompression in 'Using Image Encoders and Decoders\uDemoJpegCompression.pas',
  uDemoTransformJpeg in 'Using Image Encoders and Decoders\uDemoTransformJpeg.pas',
  uDemoCreateMultiFrame in 'Using Image Encoders and Decoders\uDemoCreateMultiFrame.pas',
  uDemoSemitransparentLines in 'Alpha Blending Lines and Fills\uDemoSemitransparentLines.pas',
  uDemoSemitransparentBrushes in 'Alpha Blending Lines and Fills\uDemoSemitransparentBrushes.pas',
  uDemoCompositingMode in 'Alpha Blending Lines and Fills\uDemoCompositingMode.pas',
  uDemoColorMatrixAlpha in 'Alpha Blending Lines and Fills\uDemoColorMatrixAlpha.pas',
  uDemoIndividualAlpha in 'Alpha Blending Lines and Fills\uDemoIndividualAlpha.pas',
  uDemoConstructingFonts in 'Using Text and Fonts\uDemoConstructingFonts.pas',
  uDemoDrawingText in 'Using Text and Fonts\uDemoDrawingText.pas',
  uDemoFormattingText in 'Using Text and Fonts\uDemoFormattingText.pas',
  uDemoInstalledFonts in 'Using Text and Fonts\uDemoInstalledFonts.pas',
  uDemoPrivateFontCollection in 'Using Text and Fonts\uDemoPrivateFontCollection.pas',
  uDemoFontMetrics in 'Using Text and Fonts\uDemoFontMetrics.pas',
  uDemoAntialiasingText in 'Using Text and Fonts\uDemoAntialiasingText.pas',
  uDemoCardinalSplines in 'Constructing and Drawing Curves\uDemoCardinalSplines.pas',
  uDemoBezierSplines in 'Constructing and Drawing Curves\uDemoBezierSplines.pas',
  uDemoLinearGradient in 'Filling Shapes with a Gradient Brush\uDemoLinearGradient.pas',
  uDemoPathGradient in 'Filling Shapes with a Gradient Brush\uDemoPathGradient.pas',
  uDemoGradientGamma in 'Filling Shapes with a Gradient Brush\uDemoGradientGamma.pas',
  uDemoCreateFigures in 'Constructing and Drawing Paths\uDemoCreateFigures.pas',
  uDemoFillOpenFigures in 'Constructing and Drawing Paths\uDemoFillOpenFigures.pas',
  uDemoGraphicsState in 'Using Graphics Containers\uDemoGraphicsState.pas',
  uDemoNestedContainers in 'Using Graphics Containers\uDemoNestedContainers.pas',
  uDemoWorldTransformations in 'Transformations\uDemoWorldTransformations.pas',
  uDemoTransformationOrder in 'Transformations\uDemoTransformationOrder.pas',
  uDemoHitTestRegion in 'Using Regions\uDemoHitTestRegion.pas',
  uDemoClipRegion in 'Using Regions\uDemoClipRegion.pas',
  uDemoColorMatrixTransform in 'Recoloring\uDemoColorMatrixTransform.pas',
  uDemoTranslatingColors in 'Recoloring\uDemoTranslatingColors.pas',
  uDemoScalingColors in 'Recoloring\uDemoScalingColors.pas',
  uDemoRotatingColors in 'Recoloring\uDemoRotatingColors.pas',
  uDemoShearingColors in 'Recoloring\uDemoShearingColors.pas',
  uDemoColorRemapTable in 'Recoloring\uDemoColorRemapTable.pas',
  uDemoPrintGdiPlusOutput in 'Printing\uDemoPrintGdiPlusOutput.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
