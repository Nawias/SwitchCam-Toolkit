util.AddNetworkString('ChangeCamera')
util.AddNetworkString('ChangeFollowCamera')

hook.Add('OnChangeCamTrigger', 'ChangeCamera', function()
  local activator, caller = ACTIVATOR, CALLER
  local trigger_postfix = '_TRIGGER'
  local camName = caller:GetName()
  camName = string.sub( camName, 1, string.find(camName, trigger_postfix, 1, true) - 1 )
  print(camName)
  local cameras = ents.FindByName(camName)
  local camera = nil;
  if ( !table.IsEmpty(cameras) ) then camera = cameras[1] end

  net.Start('ChangeCamera')
  net.WriteVector(camera:EyePos())
  net.WriteAngle(camera:EyeAngles())
  net.Send(activator)

end )

hook.Add('OnChangeFollowCamTrigger', 'ChangeFollowCamera', function()
  local activator, caller = ACTIVATOR, CALLER
  local trigger_postfix = '_FOLLOWTRIGGER'
  local camName = caller:GetName()
  camName = string.sub( camName, 1, string.find(camName, trigger_postfix, 1, true) - 1 )
  print(camName)
  local cameras = ents.FindByName(camName)
  local camera = nil;
  if ( !table.IsEmpty(cameras) ) then camera = cameras[1] end

  net.Start('ChangeFollowCamera')
  net.WriteVector(camera:EyePos())
  net.Send(activator)

end )