# SwitchCam Toolkit
This addon provides a way to create "Silent Hill"-style cameras in Garry's Mod maps.

## Usage
To use this addon in your map, you need 3 things:
 * point_camera entity positioned and named whatever you want, preferably CAM_SOMETHING
 * trigger_multi brush named by the camera it wants to activate plus _TRIGGER or _FOLLOWTRIGGER (for the following type of camera)
 * lua_run entity called CAM_LUA
 
You need to put one output in the trigger brush, like so:
| My Output >  | Target Entity | Target Input  | Parameter                      | Delay | Only Once |
| -----------  | ------------- | ------------- | ------------------------------ | ----- | --------- |
| OnStartTouch | CAM_LUA       | RunPassedCode | hook.Run('OnChangeCamTrigger') | 0.00  | No        |
|              |               |               |OR, for the following camera
| OnStartTouch | CAM_LUA       | RunPassedCode | hook.Run('OnChangeFollowCamTrigger') | 0.00  | No        |

Also, for now, you need to enable sv_cheats 1 and thirdperson. Otherwise only your viewmodel will be rendered. This is planned to change.
