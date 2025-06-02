---@meta _

CT_Tool = 3
CT_Modifier = 5
CT_ViewLUTPlugin = 4456448

--- From /Library/Application Support/Blackmagic Design/DaVinci Resolve/Developer/Fusion Fuse/Fusion Fuse SDK.pdf

---@param name string
---@param classType integer
---| `CT_Tool`
---| `CT_Modifier`
---| `CT_ViewLUTPlugin`
---@param attributes table
function FuRegisterClass(name, classType, attributes) end


---@class ChannelStyle
---@field Color Pixel
---@field SetStyleFill function
---@overload fun(): ChannelStyle
ChannelStyle = {}


---@class ColorMatrix
---@overload fun(): ColorMatrix
ColorMatrix = {}

---@param R number
---@param G number
---@param B number
function ColorMatrix:Offset(R, G, B) end

---@param R number
---@param G number
---@param B number
function ColorMatrix:Scale(R, G, B) end


---@class FillStyle
---@overload fun(): FillStyle
FillStyle = {}


---@alias ImageAttributes {
---IMG_Like: Image,
---IMG_Width: number,
---IMG_Height: number,
---IMAT_OriginalWidth: number,
---IMAT_OriginalHeight: number,
---IMG_Depth: integer,
---}

---@class Image
---@field Height integer Height of the image in pixels
---@field Width integer Width of the image in pixels
---@field XScale number
---@field YScale number
---@overload fun(attributes: ImageAttributes): Image
Image = {}

---@param matrix ColorMatrix
---@param attributes table
---@return Image
---@nodiscard
function Image:ApplyMatrixOf(matrix, attributes) end

---@param operation "Copy"|"Add"|"Subtract"|"Multiply"|"Divide"|"Max"|"Min"|"Invert"|"Difference"|"SignedAdd"|"Threshold" String defining the operation to perform
---
---@param foregroundImage Image? An image to use as the foreground for the operation. If `nil`, the `Image` object calling this method is used as the foreground.
---
---@param options { R: number|string, G: number|string, B: number|string, A: number|string } Table with keys `R`, `G`, `B`, and `A`; and values of either a number or a string. String values must consist of:
--- * `Fg` or `Bg`
--- * a period `.`
--- * a channel abbreviation:
---   - `Z` or `Coverage`
---   - `ObjectID` or `MaterialID`
---   - `U`, `V`, or `W`
---   - `NX`, `NY`, or `NZ`
---   - `VectorX` or `VectorY`
---   - `BackVectorX` or `BackVectorY`
---   - `DisparityX` or `DisparityY`
---   - `PositionX`, `PositionY`, or `PositionZ`
---   - `HLS.H`, `HLS.L`, or `HLS.S`
---   - `YUV.Y`, `YUV.U`, `or YUV.V`
---
---@return Image
---@nodiscard
function Image:ChannelOpOf(operation, foregroundImage, options) end

function Image:Clear() end

---@param x_position integer
---@param y_position integer
---@param pixel Pixel
function Image:GetPixel(x_position, y_position, pixel) end

---@alias ImageResizeFilterType
---| "Nearest"
---| "Box"
---| "Linear"
---| "Quadratic"
---| "Cubic"
---| "Catmull-Rom"
---| "Gaussian"
---| "Mitchell"
---| "Lanczos"
---| "Sinc"
---| "Bessel"

---@param resizeImage Image
---@param attributes { RSZ_Filter: ImageResizeFilterType }
function Image:Resize(resizeImage, attributes) end

---@param R number
---@param G number
---@param B number
function Image:Saturate(R, G, B) end


---@class ImageChannel
---@overload fun(outputImage: Image, oversampling: integer): ImageChannel
ImageChannel = {}

---@param operation "CM_Copy"|"CM_Merge"
---@param channelStyle ChannelStyle
function ImageChannel:PutToImage(operation, channelStyle) end

---@param fillStyle FillStyle
function ImageChannel:SetStyleFill(fillStyle) end

---@param shape Shape
function ImageChannel:ShapeFill(shape) end


---@class Input
Input = {}

---@param request Request
---@return Image|Parameter
---@nodiscard
function Input:GetValue(request) end

---@param value Text
---@param frame integer
function Input:SetSource(value, frame) end


---@class Matrix4
---@overload fun(): Matrix4
Matrix4 = {}

---@param X number
---@param Y number
---@param Z number
function Matrix4:Move(X, Y, Z) end

---@param X number
---@param Y number
---@param Z number
function Matrix4:Scale(X, Y, Z) end


---@class Output
Output = {}

---@param request Request
---@param outputImage Image
function Output:Set(request, outputImage) end


---@class Parameter
---@field Value any
Parameter = {}


---@class Pixel
---@field R number
---@field G number
---@field B number
---@field A number
---@overload fun(attributes?: table): Pixel
Pixel = {}


---@class Request
---@field BaseTime boolean
---@field Time integer
Request = {}

---@return integer
function Request:GetTime() end

---@return boolean
function Request:IsNoMotionBlur() end

---@return boolean
function Request:IsQuick() end

---@return boolean
function Request:IsStampOnly() end


---@class Shape
---@overload fun(): Shape
Shape = {}

---@param shape Shape
function Shape:AddShape(shape) end

---@param matrix Matrix4
---@return Shape
---@nodiscard
function Shape:TransformOfShape(matrix) end


---@class Text
---@overload fun(value: string): Text
Text = {}


---@class TextStyleFont
---@overload fun(font: string, style: string): TextStyleFont
TextStyleFont = {}


---@class TextStyleFontMetrics
---@field Scale number
---@field TextAscent number
---@field TextDescent number
---@field TextExternalLeading number
---@overload fun(textStyleFont: TextStyleFont): TextStyleFontMetrics
TextStyleFontMetrics = {}

---@param characterByte integer
---@param _ false
---@return Shape?
---@nodiscard
function TextStyleFontMetrics:GetCharacterShape(characterByte, _) end

---@param characterByte integer
---@return number
---@param _ false
---@nodiscard
function TextStyleFontMetrics:CharacterWidth(characterByte, _) end
