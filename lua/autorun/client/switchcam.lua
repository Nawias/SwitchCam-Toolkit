
SwitchCam = {};
SwitchCam.changeCamera = function(camOrigin, camAngles)

  

  hook.Remove('CalcView', 'ChangeCamera')

  hook.Add('CalcView', 'ChangeCamera', function()
    local view = {
        origin = camOrigin,
        angles = camAngles,
        fov = 90,
        drawviewer = true
      }
    return view
  end )
end

SwitchCam.CalcAngleToPlayer = function(camOrigin)
  local playerOrigin = LocalPlayer():GetPos() + ((LocalPlayer():EyePos() - LocalPlayer():GetPos()) / 2)
  local camVector = playerOrigin - camOrigin
  return camVector:Angle()
end

SwitchCam.changeFollowCamera = function(camOrigin)

  hook.Remove('CalcView', 'ChangeCamera')
  hook.Add('CalcView', 'ChangeCamera', function()
  local camAngles = SwitchCam.CalcAngleToPlayer(camOrigin);
  local view = {
        origin = camOrigin,
        angles = camAngles,
        fov = 90,
        drawviewer = true
      }
    return view
  end )
end

SwitchCam.removeCamera = function() 
  hook.Remove('CalcView', 'ChangeCamera')
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
net.Receive('RemoveCamera', SwitchCam.removeCamera)
print('SwitchCam client script initialized')