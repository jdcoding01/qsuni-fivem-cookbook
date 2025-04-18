




## Place Order Task


## Delivery & Driving Task

> Input Validation and Setup

Verify Configuration:
Check if the configuration object and input data are provided. If not, log an error and exit.

Extract Necessary Values:
Retrieve the vehicle model, ped model, spawn coordinates, and target coordinates from your configuration and data.

> Model Loading

Request Models:
Use functions like RequestModel to load both the vehicle and ped models.

Wait for Models to Load:
Continuously check with HasModelLoaded until both models are fully loaded before proceeding.


> Vehicle Creation and Initialization

Create the Vehicle:
Call CreateVehicle with the vehicle model and spawn coordinates.

Verify Vehicle Creation:
Check if the vehicle entity exists. If creation fails, log the error and terminate the function.

Adjust the Vehicle's State:

Use SetVehicleOnGroundProperly to correctly position it on the terrain.

Turn on the engine with SetVehicleEngineOn.

Unlock the doors by setting them to an open state.

Disable the hotwire requirement using SetVehicleNeedsToBeHotwired.


> Ped Creation and Setup

Create the Driver Ped:
Use CreatePed to generate a minimal driver character at the same spawn coordinates.

Verify Ped Creation:
If the ped isn’t properly created, log an error, clean up by deleting the vehicle, and stop the function.

Assign the Ped to the Vehicle:
Place the created ped into the driver’s seat (often using the index -1).


> Route Determination and Path Validation

[GTA Paths](https://gta.fandom.com/wiki/Paths_(GTA_V))

[GetClosestVehicleNode Native](https://docs.fivem.net/natives/?_0x240A18690AE96513)

[NativeDB](https://nativedb.dotindustries.dev/gta5/natives/0x240A18690AE96513?search=GetClosest)

[Driving Style Flags](https://gtaforums.com/topic/822314-guide-driving-styles/)

Determine the Nearest Road Node:
Call GetClosestVehicleNode with the target coordinates and additional parameters (node type, search radius, filtering flags) to find the closest valid road node.

Verify a Valid Node is Found:
Check the success flag; if a valid road node isn’t found, log an error and exit.


> Issuing the Driving Command

Set Driving Parameters:
Define parameters such as speed, driving style, and stopping range

Command the Vehicle:
Use TaskVehicleDriveToCoordLongrange to instruct the driver ped to drive the vehicle toward the obtained road node.