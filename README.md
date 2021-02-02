# SwitchCam Toolkit

This addon provides a way to create "Silent Hill"-style cameras in Garry's Mod maps.

## Usage

To use this addon in your map, you need 3 things:

- `point_camera` entity positioned and named whatever you want, preferably `CAM_SOMETHING`
- `trigger_multiple` brush named by the camera it wants to activate plus `_TRIGGER` or `_FOLLOWTRIGGER` (for the following type of camera)
- `lua_run` entity called `CAM_LUA`

You need to put one output in the trigger brush, like so:
| My Output > | Target Entity | Target Input | Parameter | Delay | Only Once |
| ----------- | ------------- | ------------- | ------------------------------ | ----- | --------- |
| OnStartTouch | CAM_LUA | RunPassedCode | hook.Run('OnChangeCamTrigger') | 0.00 | No |
| | | |OR, for the following camera
| OnStartTouch | CAM_LUA | RunPassedCode | hook.Run('OnChangeFollowCamTrigger') | 0.00 | No |
| | | |OR, to clear the camera
| OnStartTouch | CAM_LUA | RunPassedCode | hook.Run('OnRemoveCamTrigger') | 0.00 | No |

There is a test map in this repository showcasing the functionalities. Sorry for poor hammer skills.
