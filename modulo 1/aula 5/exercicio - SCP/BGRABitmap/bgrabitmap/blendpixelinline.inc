// SPDX-License-Identifier: LGPL-3.0-linking-exception
function ByteLinearMultiplyInline(a, b: byte): byte;
begin
  if b = 255 then exit(a) else
  begin
    if b >= 128 then inc(b);
    Result := (a * b) shr 8;
  end;
end;

procedure LinearMultiplyPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearMultiplyInline(dest^.red, c.red);
    dest^.green := ByteLinearMultiplyInline(dest^.green, c.green);
    dest^.blue  := ByteLinearMultiplyInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearMultiplyInline(dest^.red, c.red) *
      destalpha + c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearMultiplyInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearMultiplyInline(dest^.blue, c.blue) *
      destalpha + c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

{$hints off}
function ByteAddInline(a, b: byte): byte;
var
  temp: LongWord;
begin
  temp := LongWord(GammaExpansionTab[a]) + LongWord(GammaExpansionTab[b]);
  if temp > 65535 then
    temp := 65535;
  Result := GammaCompressionTab[temp];
end;
{$hints on}

function ByteLinearAddInline(a, b: byte): byte;
var
  temp: integer;
begin
  temp := integer(a) + integer(b);
  if temp > 255 then
    temp := 255;
  Result := temp;
end;

procedure AddPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteAddInline(dest^.red, c.red);
    dest^.green := ByteAddInline(dest^.green, c.green);
    dest^.blue  := ByteAddInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := ByteAddInline(dest^.red * destalpha shr 8, c.red);
    dest^.green := ByteAddInline(dest^.green * destalpha shr 8, c.green);
    dest^.blue  := ByteAddInline(dest^.blue * destalpha shr 8, c.blue);
    dest^.alpha := c.alpha;
  end;
end;

procedure LinearAddPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearAddInline(dest^.red, c.red);
    dest^.green := ByteLinearAddInline(dest^.green, c.green);
    dest^.blue  := ByteLinearAddInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := ByteLinearAddInline(dest^.red * destalpha shr 8, c.red);
    dest^.green := ByteLinearAddInline(dest^.green * destalpha shr 8, c.green);
    dest^.blue  := ByteLinearAddInline(dest^.blue * destalpha shr 8, c.blue);
    dest^.alpha := c.alpha;
  end;
end;

function ByteBurnInline(a, b: byte): byte; inline;
var
  temp: integer;
begin
  if b = 0 then
    Result := 0
  else
  begin
    temp := 255 - (((255 - a) shl 8) div b);
    if temp < 0 then
      Result := 0
    else
      Result := temp;
  end;
end;

procedure ColorBurnPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteBurnInline(dest^.red, c.red);
    dest^.green := ByteBurnInline(dest^.green, c.green);
    dest^.blue  := ByteBurnInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteBurnInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteBurnInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteBurnInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

{$hints off}
function ByteDodgeInline(a, b: byte): byte; inline;
var
  temp: integer;
begin
  if b = 255 then
    Result := 255
  else
  begin
    temp := (a shl 8) div (not b);
    if temp > 255 then
      Result := 255
    else
      Result := temp;
  end;
end;
{$hints on}

procedure ColorDodgePixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteDodgeInline(dest^.red, c.red);
    dest^.green := ByteDodgeInline(dest^.green, c.green);
    dest^.blue  := ByteDodgeInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteDodgeInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteDodgeInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteDodgeInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

{$hints off}
function ByteDivideInline(a, b: byte): byte; inline;
var
  temp: integer;
begin
  if b = 0 then
    Result := 255
  else if b = 255 then
    exit(a)
  else
  begin
    if b >= 128 then inc(b);
    temp := ((a shl 8) + (b shr 1)) div b;
    if temp > 255 then
      Result := 255
    else
      Result := temp;
  end;
end;
{$hints on}

procedure DividePixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteDivideInline(dest^.red, c.red);
    dest^.green := ByteDivideInline(dest^.green, c.green);
    dest^.blue  := ByteDivideInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteDivideInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteDivideInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteDivideInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

{$hints off}
function ByteNonLinearReflectInline(a, b: byte): byte; inline;
var
  temp: LongWord;
  wa,wb: word;
begin
  if b = 255 then
    Result := 255
  else
  begin
    wa := GammaExpansionTab[a];
    wb := GammaExpansionTab[b];
    temp := wa * wa div (not wb);
    if temp >= 65535 then
      Result := 255
    else
      Result := GammaCompressionTab[ temp ];
  end;
end;

function ByteReflectInline(a, b: byte): byte; inline;
var
  temp: integer;
begin
  if b = 255 then
    Result := 255
  else
  begin
    temp := a * a div (not b);
    if temp > 255 then
      Result := 255
    else
      Result := temp;
  end;
end;
{$hints on}

procedure ReflectPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteReflectInline(dest^.red, c.red);
    dest^.green := ByteReflectInline(dest^.green, c.green);
    dest^.blue  := ByteReflectInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteReflectInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteReflectInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteReflectInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure GlowPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteReflectInline(c.red, dest^.red);
    dest^.green := ByteReflectInline(c.green, dest^.green);
    dest^.blue  := ByteReflectInline(c.blue, dest^.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteReflectInline(c.red, dest^.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteReflectInline(c.green, dest^.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteReflectInline(c.blue, dest^.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure NiceGlowPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;

  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteReflectInline(c.red, dest^.red);
    dest^.green := ByteReflectInline(c.green, dest^.green);
    dest^.blue  := ByteReflectInline(c.blue, dest^.blue);
  end else
  begin
    dest^.red   := (ByteReflectInline(c.red, dest^.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteReflectInline(c.green, dest^.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteReflectInline(c.blue, dest^.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
  end;

  if (c.red > c.green) and (c.red > c.blue) then
    dest^.alpha := c.red else
  if (c.green > c.blue) then
    dest^.alpha := c.green else
    dest^.alpha := c.blue;
  dest^.alpha := ApplyOpacity(GammaExpansionTab[dest^.alpha] shr 8,c.alpha);
end;

procedure NonLinearReflectPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteNonLinearReflectInline(dest^.red, c.red);
    dest^.green := ByteNonLinearReflectInline(dest^.green, c.green);
    dest^.blue  := ByteNonLinearReflectInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteNonLinearReflectInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteNonLinearReflectInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteNonLinearReflectInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

{$hints off}
function ByteOverlayInline(a, b: byte): byte; inline;
var wa,wb: word;
begin
  wa := GammaExpansionTab[a];
  wb := GammaExpansionTab[b];
  if wa < 32768 then
    Result := GammaCompressionTab[ (wa * wb) shr 15 ]
  else
    Result := GammaCompressionTab[ 65535 - ((not wa) * (not wb) shr 15) ];
end;
{$hints on}

function ByteLinearOverlayInline(a, b: byte): byte; inline;
begin
  if a < 128 then
    Result := (a * b) shr 7
  else
    Result := 255 - ((not a) * (not b) shr 7);
end;

procedure OverlayPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteOverlayInline(dest^.red, c.red);
    dest^.green := ByteOverlayInline(dest^.green, c.green);
    dest^.blue  := ByteOverlayInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteOverlayInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteOverlayInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteOverlayInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure LinearOverlayPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearOverlayInline(dest^.red, c.red);
    dest^.green := ByteLinearOverlayInline(dest^.green, c.green);
    dest^.blue  := ByteLinearOverlayInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearOverlayInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearOverlayInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearOverlayInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteDifferenceInline(a, b: byte): byte; inline;
begin
  Result := GammaCompressionTab[abs(integer(GammaExpansionTab[a]) -
    integer(GammaExpansionTab[b]))];
end;

procedure DifferencePixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteDifferenceInline(dest^.red, c.red);
    dest^.green := ByteDifferenceInline(dest^.green, c.green);
    dest^.blue  := ByteDifferenceInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteDifferenceInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteDifferenceInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteDifferenceInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteLinearDifferenceInline(a, b: byte): byte; inline;
begin
  Result := abs(a - b);
end;

procedure LinearDifferencePixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearDifferenceInline(dest^.red, c.red);
    dest^.green := ByteLinearDifferenceInline(dest^.green, c.green);
    dest^.blue  := ByteLinearDifferenceInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearDifferenceInline(dest^.red, c.red) *
      destalpha + c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearDifferenceInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearDifferenceInline(dest^.blue, c.blue) *
      destalpha + c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteExclusionInline(a, b: byte): byte; inline;
var aw,bw: word;
begin
  aw := GammaExpansionTab[a];
  bw := GammaExpansionTab[b];
  {$HINTS OFF}
  Result := GammaCompressionTab[aw+bw-(LongWord(aw)*LongWord(bw) shr 15)];
  {$HINTS ON}
end;

procedure ExclusionPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteExclusionInline(dest^.red, c.red);
    dest^.green := ByteExclusionInline(dest^.green, c.green);
    dest^.blue  := ByteExclusionInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteExclusionInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteExclusionInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteExclusionInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteLinearExclusionInline(a, b: byte): byte; inline;
begin
  {$HINTS OFF}
  Result := a+b-(a*b shr 7);
  {$HINTS ON}
end;

procedure LinearExclusionPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearExclusionInline(dest^.red, c.red);
    dest^.green := ByteLinearExclusionInline(dest^.green, c.green);
    dest^.blue  := ByteLinearExclusionInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearExclusionInline(dest^.red, c.red) *
      destalpha + c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearExclusionInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearExclusionInline(dest^.blue, c.blue) *
      destalpha + c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteLinearSubtractInline(a, b: byte): byte; inline;
begin
  if b >= a then
    result := 0
  else
    result := a-b;
end;

procedure LinearSubtractPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearSubtractInline(dest^.red, c.red);
    dest^.green := ByteLinearSubtractInline(dest^.green, c.green);
    dest^.blue  := ByteLinearSubtractInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearSubtractInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearSubtractInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearSubtractInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure LinearSubtractInversePixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearSubtractInline(dest^.red, not c.red);
    dest^.green := ByteLinearSubtractInline(dest^.green, not c.green);
    dest^.blue  := ByteLinearSubtractInline(dest^.blue, not c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearSubtractInline(dest^.red, not c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearSubtractInline(dest^.green, not c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearSubtractInline(dest^.blue, not c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteSubtractInline(a, b: byte): byte; inline;
begin
  if b >= a then
    result := 0
  else
    result := GammaCompressionTab[integer(GammaExpansionTab[a]) -
       integer(GammaExpansionTab[b])];
end;

procedure SubtractPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteSubtractInline(dest^.red, c.red);
    dest^.green := ByteSubtractInline(dest^.green, c.green);
    dest^.blue  := ByteSubtractInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteSubtractInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteSubtractInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteSubtractInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteSubtractInverseInline(a, b: byte): byte; inline;
var aw,bw: word;
begin
  aw := GammaExpansionTab[a];
  bw := not GammaExpansionTab[b];
  if bw >= aw then
    result := 0
  else
    result := GammaCompressionTab[aw-bw];
end;

procedure SubtractInversePixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteSubtractInverseInline(dest^.red, c.red);
    dest^.green := ByteSubtractInverseInline(dest^.green, c.green);
    dest^.blue  := ByteSubtractInverseInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteSubtractInverseInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteSubtractInverseInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteSubtractInverseInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteNegationInline(a, b: byte): byte; inline;
var
  sum: integer;
begin
  sum := integer(GammaExpansionTab[a]) + integer(GammaExpansionTab[b]);
  if sum > 65535 then
    sum  := 131071 - sum;
  Result := GammaCompressionTab[sum];
end;

function ByteLinearNegationInline(a, b: byte): byte; inline;
var
  sum: integer;
begin
  sum := integer(a) + integer(b);
  if sum > 255 then
    Result := 511 - sum
  else
    Result := sum;
end;

procedure NegationPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteNegationInline(dest^.red, c.red);
    dest^.green := ByteNegationInline(dest^.green, c.green);
    dest^.blue  := ByteNegationInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteNegationInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteNegationInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteNegationInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure LinearNegationPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLinearNegationInline(dest^.red, c.red);
    dest^.green := ByteLinearNegationInline(dest^.green, c.green);
    dest^.blue  := ByteLinearNegationInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLinearNegationInline(dest^.red, c.red) *
      destalpha + c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLinearNegationInline(dest^.green, c.green) *
      destalpha + c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLinearNegationInline(dest^.blue, c.blue) *
      destalpha + c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteLightenInline(a, b: byte): byte; inline;
begin
  if a > b then
    Result := a
  else
    Result := b;
end;

procedure LightenPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteLightenInline(dest^.red, c.red);
    dest^.green := ByteLightenInline(dest^.green, c.green);
    dest^.blue  := ByteLightenInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteLightenInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteLightenInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteLightenInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteDarkenInline(a, b: byte): byte; inline;
begin
  if a < b then
    Result := a
  else
    Result := b;
end;

procedure DarkenPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteDarkenInline(dest^.red, c.red);
    dest^.green := ByteDarkenInline(dest^.green, c.green);
    dest^.blue  := ByteDarkenInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteDarkenInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteDarkenInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteDarkenInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

{$hints off}
function ScreenByteInline(a, b: byte): byte;
begin
  Result := 255 - ((not a) * (not b) shr 8);
end;
{$hints on}

procedure ScreenPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ScreenByteInline(dest^.red, c.red);
    dest^.green := ScreenByteInline(dest^.green, c.green);
    dest^.blue  := ScreenByteInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ScreenByteInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ScreenByteInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ScreenByteInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteSoftLightInline(a,b: byte): byte; inline;
begin
  result := ((not a)*b shr 7 + a)*a div 255;
end;

procedure SoftLightPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteSoftLightInline(dest^.red, c.red);
    dest^.green := ByteSoftLightInline(dest^.green, c.green);
    dest^.blue  := ByteSoftLightInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteSoftLightInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteSoftLightInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteSoftLightInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteSvgSoftLightInline(a,b: byte): byte; inline;
begin
  if b <= 128 then
    result := a - (((256 - b-b)*a shr 8)*(not a) shr 8)
  else
  begin
    dec(b, 128);
    if a <= 64 then
      result := a + ((b+b)   * UInt32or64(a*7 - ((a shl 2)*(a shl 2 + 256)*UInt32or64(256 - a) shr 16)) shr 8)
    else
      result := a + ((b+b+1) * UInt32or64(ByteSqrt(a)-a) shr 8);
  end;
end;

procedure SvgSoftLightPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteSvgSoftLightInline(dest^.red, c.red);
    dest^.green := ByteSvgSoftLightInline(dest^.green, c.green);
    dest^.blue  := ByteSvgSoftLightInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteSvgSoftLightInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteSvgSoftLightInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteSvgSoftLightInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

function ByteHardLightInline(a,b: byte): byte; inline;
begin
  if b <= 128 then
    result := a*b shr 7
  else
    result := 255 - ((not a)*(not b) shr 7);
end;

procedure HardLightPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := ByteHardLightInline(dest^.red, c.red);
    dest^.green := ByteHardLightInline(dest^.green, c.green);
    dest^.blue  := ByteHardLightInline(dest^.blue, c.blue);
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := (ByteHardLightInline(dest^.red, c.red) * destalpha +
      c.red * (not destalpha)) shr 8;
    dest^.green := (ByteHardLightInline(dest^.green, c.green) * destalpha +
      c.green * (not destalpha)) shr 8;
    dest^.blue  := (ByteHardLightInline(dest^.blue, c.blue) * destalpha +
      c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure BlendXorPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  if destalpha = 255 then
  begin
    dest^.red := dest^.red xor c.red;
    dest^.green := dest^.green xor c.green;
    dest^.blue  := dest^.blue xor c.blue;
    dest^.alpha := c.alpha;
  end else
  begin
    dest^.red   := ((dest^.red xor c.red) * destalpha + c.red * (not destalpha)) shr 8;
    dest^.green := ((dest^.green xor c.green) * destalpha + c.green *
      (not destalpha)) shr 8;
    dest^.blue  := ((dest^.blue xor c.blue) * destalpha + c.blue * (not destalpha)) shr 8;
    dest^.alpha := c.alpha;
  end;
end;

procedure BlendMaskPixelInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
const alphaMax = 255*7;
var alpha: byte;
begin
  alpha := (c.green shl 2) + (c.red shl 1) + c.blue;
  alpha := alpha*c.alpha + (255*7)*(not c.alpha);
  alpha := (alpha + (alphaMax shr 1)) div alphaMax;
  if alpha = 0 then dest^ := BGRAPixelTransparent
  else dest^.alpha := alpha;
end;

function ByteLinearMultiplySaturationInline(a,b,l: byte): byte; inline;
begin
  if b = 255 then
    result := a
  else if b = 0 then
    result := l
  else
    result := (a-l)*b div 255 + l;
end;

procedure LinearMultiplySaturationInline(dest: PBGRAPixel; c: TBGRAPixel); inline;
var
  destalpha: byte;
  mini,maxi,l: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    mini := dest^.red; maxi := dest^.red;
    if dest^.green < mini then mini := dest^.green else
    if dest^.green > maxi then maxi := dest^.green;
    if dest^.blue < mini then mini := dest^.blue else
    if dest^.blue > maxi then maxi := dest^.blue;
    l := (mini+maxi) div 2;

    if destalpha = 255 then
    begin
      dest^.red := ByteLinearMultiplySaturationInline(dest^.red, c.red, l);
      dest^.green := ByteLinearMultiplySaturationInline(dest^.green, c.green, l);
      dest^.blue  := ByteLinearMultiplySaturationInline(dest^.blue, c.blue, l);
      dest^.alpha := c.alpha;
    end else
    begin
      dest^.red   := (ByteLinearMultiplySaturationInline(dest^.red, c.red, l) * destalpha +
        c.red * (not destalpha)) shr 8;
      dest^.green := (ByteLinearMultiplySaturationInline(dest^.green, c.green, l) * destalpha +
        c.green * (not destalpha)) shr 8;
      dest^.blue  := (ByteLinearMultiplySaturationInline(dest^.blue, c.blue, l) * destalpha +
        c.blue * (not destalpha)) shr 8;
      dest^.alpha := c.alpha;
    end;
  end;
end;

procedure LinearHueInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha,
  sextant, position, saturation, value, discard1, discard2: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    RGBToByteStdHSV(c.red, c.green, c.blue, sextant, position, discard1, discard2);
    RGBToByteStdHSV(dest^.red, dest^.green, dest^.blue, discard1, discard2, saturation, value);
    ByteStdHSVToRGB(sextant, position, saturation, value, dest^.red, dest^.green, dest^.blue);
    dest^.alpha := c.alpha;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure LinearColorInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha,
  sextant, position, saturation, lightness, discard1: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    RGBToByteStdHSL(c.red, c.green, c.blue, sextant, position, saturation, discard1);
    lightness := GetByteStdLightness(dest^.red, dest^.green, dest^.blue);
    ByteStdHSLToRGB(sextant, position, saturation, lightness, dest^.red, dest^.green, dest^.blue);
    dest^.alpha := c.alpha;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure LinearLightnessInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha,
  sextant, position, saturation, lightness, discard1: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    RGBToByteStdHSL(dest^.red, dest^.green, dest^.blue, sextant, position, saturation, discard1);
    lightness := GetByteStdLightness(c.red, c.green, c.blue);
    ByteStdHSLToRGB(sextant, position, saturation, lightness, dest^.red, dest^.green, dest^.blue);
    dest^.alpha := c.alpha;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure LinearSaturationInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha,
  sextant, position, saturation, lightness,
  discard1, discard2, discard3: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    RGBToByteStdHSL(dest^.red, dest^.green, dest^.blue, sextant, position, saturation, lightness);
    if saturation <> 0 then
    begin
      RGBToByteStdHSL(c.red, c.green, c.blue, discard1, discard2, saturation, discard3);
      ByteStdHSLToRGB(sextant, position, saturation, lightness, dest^.red, dest^.green, dest^.blue);
    end;
    dest^.alpha := c.alpha;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure CorrectedHueInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha: byte;
  srcGSBA, destGSBA: TGSBAPixel;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    srcGSBA := c.ToGSBAPixel;
    destGSBA := dest^.ToGSBAPixel;
    destGSBA.hue := srcGSBA.hue;
    destGSBA.alpha:= srcGSBA.alpha;
    dest^ := destGSBA;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure CorrectedColorInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    dest^ := SetLightness(c, dest^.Lightness);

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure CorrectedLightnessInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha: byte;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    dest^ := SetLightness(dest^, c.Lightness);
    dest^.alpha := c.alpha;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;

procedure CorrectedSaturationInline(dest: PBGRAPixel; c: TBGRAPixel);
var
  destalpha: byte;
  destGSBA: TGSBAPixel;
begin
  destalpha   := dest^.alpha;
  if destalpha = 0 then
  begin
    dest^ := c
  end else
  begin
    destGSBA := dest^.ToGSBAPixel;
    if destGSBA.saturation <> 0 then
    begin
      destGSBA.saturation:= c.ToGSBAPixel.saturation;
      dest^ := destGSBA;
    end;
    dest^.alpha := c.alpha;

    if destalpha <> 255 then
    begin
      dest^.red   := (dest^.red * destalpha + c.red * (not destalpha)) shr 8;
      dest^.green := (dest^.green * destalpha + c.green * (not destalpha)) shr 8;
      dest^.blue  := (dest^.blue * destalpha + c.blue * (not destalpha)) shr 8;
    end;
  end;
end;
