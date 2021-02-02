
SwitchCam = {};
SwitchCam.changeCamera = function(camOrigin, camAngles)

  local tex = GetRenderTarget('ScreenRT', ScrW(), ScrH())
  local mat = CreateMaterial('ScreenRTMaterial', 'UnlitGeneric', {
    ['$basetexture'] = tex:GetName()
  })

  hook.Remove('HUDPaint', 'ChangeCamera')

  hook.Add('HUDPaint', 'ChangeCamera', function()
  render.PushRenderTarget(tex)
    render.RenderView({
      origin = camOrigin,
      angles = camAngles,
    })
  render.PopRenderTarget()
    surface.SetDrawColor(color_white)
    surface.SetMaterial(mat)
    surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
  end )
end

SwitchCam.CalcAngleToPlayer = function(camOrigin)
  local playerOrigin = LocalPlayer():GetPos() + ((LocalPlayer():EyePos() - LocalPlayer():GetPos()) / 2)
  local camVector = playerOrigin - camOrigin
  return camVector:Angle()
end

SwitchCam.changeFollowCamera = function(camOrigin)

  local tex = GetRenderTarget('ScreenRT', ScrW(), ScrH())
  local mat = CreateMaterial('ScreenRTMaterial', 'UnlitGeneric', {
    ['$basetexture'] = tex:GetName()
  })

  hook.Remove('HUDPaint', 'ChangeCamera')
  hook.Add('HUDPaint', 'ChangeCamera', function()
  local camAngles = SwitchCam.CalcAngleToPlayer(camOrigin);
  render.PushRenderTarget(tex)
    render.RenderView({
      origin = camOrigin,
      angles = camAngles,
    })
  render.PopRenderTarget()
    surface.SetDrawColor(color_white)
    surface.SetMaterial(mat)
    surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
  end )
end


net.Receive('ChangeCamera', function()
  local camOrigin = net.ReadVector()
  local camAngles = net.ReadAngle()
  SwitchCam.changeCamera(camOrigin, camAngles)
end )
net.Receive('ChangeFollowCamera', function()
  local camOrigin = net.ReadVector()
  SwitchCam.changeFollowCamera(camOrigin)
end )
print('SwitchCam client script initialized')