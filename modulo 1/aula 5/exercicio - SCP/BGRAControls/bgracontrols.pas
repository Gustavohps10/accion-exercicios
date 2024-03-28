{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit bgracontrols;

{$warn 5023 off : no warning about unused units}
interface

uses
  atshapelinebgra, BCButton, BCButtonFocus, BCCheckComboBox, BCComboBox, 
  BCEffect, bcfilters, BCFluentProgressRing, BCGameGrid, BCGradientButton, 
  BCImageButton, BCLabel, BCListBox, BCListBoxEx, BCMaterialDesignButton, 
  BCMaterialEdit, BCMaterialFloatSpinEdit, BCMaterialProgressBarMarquee, 
  BCMaterialSpinEdit, BCMDButton, BCMDButtonFocus, BCPanel, 
  BCRadialProgressBar, BCRoundedImage, BCRTTI, BCSamples, BCStylesForm, 
  BCSVGButton, BCSVGViewer, BCToolBar, BCTrackbarUpdown, BGRAColorTheme, 
  bgracontrolsinfo, BGRACustomDrawn, BGRADrawerFlashProgressBar, 
  BGRAFlashProgressBar, BGRAGraphicControl, BGRAImageList, 
  BGRAImageManipulation, BGRAImageTheme, BGRAKnob, BGRAResizeSpeedButton, 
  BGRAShape, BGRASpeedButton, BGRASpriteAnimation, BGRASVGImageList, 
  BGRASVGTheme, BGRATheme, BGRAThemeButton, BGRAThemeCheckBox, 
  BGRAThemeRadioButton, BGRAVirtualScreen, ColorSpeedButton, DTAnalogClock, 
  DTAnalogCommon, DTAnalogGauge, dtthemedclock, dtthemedgauge, MaterialColors, 
  bgrasvgimagelistform, BCExpandPanels, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('atshapelinebgra', @atshapelinebgra.Register);
  RegisterUnit('BCButton', @BCButton.Register);
  RegisterUnit('BCButtonFocus', @BCButtonFocus.Register);
  RegisterUnit('BCCheckComboBox', @BCCheckComboBox.Register);
  RegisterUnit('BCComboBox', @BCComboBox.Register);
  RegisterUnit('BCFluentProgressRing', @BCFluentProgressRing.Register);
  RegisterUnit('BCGameGrid', @BCGameGrid.Register);
  RegisterUnit('BCGradientButton', @BCGradientButton.Register);
  RegisterUnit('BCImageButton', @BCImageButton.Register);
  RegisterUnit('BCLabel', @BCLabel.Register);
  RegisterUnit('BCListBox', @BCListBox.Register);
  RegisterUnit('BCMaterialDesignButton', @BCMaterialDesignButton.Register);
  RegisterUnit('BCMaterialEdit', @BCMaterialEdit.Register);
  RegisterUnit('BCMaterialFloatSpinEdit', @BCMaterialFloatSpinEdit.Register);
  RegisterUnit('BCMaterialProgressBarMarquee', 
    @BCMaterialProgressBarMarquee.Register);
  RegisterUnit('BCMaterialSpinEdit', @BCMaterialSpinEdit.Register);
  RegisterUnit('BCMDButton', @BCMDButton.Register);
  RegisterUnit('BCMDButtonFocus', @BCMDButtonFocus.Register);
  RegisterUnit('BCPanel', @BCPanel.Register);
  RegisterUnit('BCRadialProgressBar', @BCRadialProgressBar.Register);
  RegisterUnit('BCRoundedImage', @BCRoundedImage.Register);
  RegisterUnit('BCSVGButton', @BCSVGButton.Register);
  RegisterUnit('BCSVGViewer', @BCSVGViewer.Register);
  RegisterUnit('BCToolBar', @BCToolBar.Register);
  RegisterUnit('BCTrackbarUpdown', @BCTrackbarUpdown.Register);
  RegisterUnit('BGRAColorTheme', @BGRAColorTheme.Register);
  RegisterUnit('BGRACustomDrawn', @BGRACustomDrawn.Register);
  RegisterUnit('BGRAFlashProgressBar', @BGRAFlashProgressBar.Register);
  RegisterUnit('BGRAGraphicControl', @BGRAGraphicControl.Register);
  RegisterUnit('BGRAImageList', @BGRAImageList.Register);
  RegisterUnit('BGRAImageManipulation', @BGRAImageManipulation.Register);
  RegisterUnit('BGRAImageTheme', @BGRAImageTheme.Register);
  RegisterUnit('BGRAKnob', @BGRAKnob.Register);
  RegisterUnit('BGRAResizeSpeedButton', @BGRAResizeSpeedButton.Register);
  RegisterUnit('BGRAShape', @BGRAShape.Register);
  RegisterUnit('BGRASpeedButton', @BGRASpeedButton.Register);
  RegisterUnit('BGRASpriteAnimation', @BGRASpriteAnimation.Register);
  RegisterUnit('BGRASVGImageList', @BGRASVGImageList.Register);
  RegisterUnit('BGRASVGTheme', @BGRASVGTheme.Register);
  RegisterUnit('BGRATheme', @BGRATheme.Register);
  RegisterUnit('BGRAThemeButton', @BGRAThemeButton.Register);
  RegisterUnit('BGRAThemeCheckBox', @BGRAThemeCheckBox.Register);
  RegisterUnit('BGRAThemeRadioButton', @BGRAThemeRadioButton.Register);
  RegisterUnit('BGRAVirtualScreen', @BGRAVirtualScreen.Register);
  RegisterUnit('ColorSpeedButton', @ColorSpeedButton.Register);
  RegisterUnit('DTAnalogClock', @DTAnalogClock.Register);
  RegisterUnit('DTAnalogGauge', @DTAnalogGauge.Register);
  RegisterUnit('dtthemedclock', @dtthemedclock.Register);
  RegisterUnit('dtthemedgauge', @dtthemedgauge.Register);
  RegisterUnit('BCExpandPanels', @BCExpandPanels.Register);
end;

initialization
  RegisterPackage('bgracontrols', @Register);
end.
