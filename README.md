# Enigma_EPOCH_Animations
Enable Animations to be seen serverwide when executed on an Epoch Client


The purpose of this addon is to allow anyone executing animations on a client to easily transfer that animation across to all players within a specified range.

Normally this is done through the use of bis_fnc_mp however that has currently been disabled by the Epoch Devs.

I have currently copied the same file structure as the Epoch_Server.pbo - 
The idea behind this is that anyone used to looking inside that file structure will easily be able to copy any future code changes etc across to this pbo that either the devs or anyone else may add at a future date whilst maintaining an unmodified epoch_server.pbo


See the GIT WIKI for info regarding each version.


HOW TO USE:

To send your animations to surrounding clients you need to make changes to how you call animations in your custom script.


This example is for 2 animations - the first on the player, the second on _target.

Currently you will have something like this:


						
						player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
  						_target switchMove "AcinPercMstpSnonWnonDnon_agony";

						
						
This works fine from the clients point of view, however it is only visible for the executing client and not surround players - including the target themselves!

						
To enable the target and any spectating clients to see the animations you need to make a few changes.

			
						player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
  						_target switchMove "AcinPercMstpSnonWnonDnon_agony";
						
						Enigma_switchMove_PVS = [player, _AnimationCaseNumber, Epoch_personalToken, _target];
						publicVariableServer "Enigma_switchMove_PVS";
						_handled = true;
						
						
						
There is one last thing you will have to do on your client files. _AnimationCaseNumber is a specific case that you will assign to each of your animation scenarios.

Lets say this is case #20. The Code will now read:


						player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
  						_target switchMove "AcinPercMstpSnonWnonDnon_agony";
						
						Enigma_switchMove_PVS = [player, 20, Epoch_personalToken, _target];
						publicVariableServer "Enigma_switchMove_PVS";
						_handled = true;



This concludes any changes to your client code. We now move into the a3_epoch_enigma.pbo.

Open the file: a3_epoch_enigma\compile\epoch_animations\ENIGMA_server_handle_switchMove.sqf and locate the line:


						case 20:{_AnimationRange=1000;
						_OriginalClientAnimation= "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						_TargetClientAnimation= "AcinPercMstpSnonWnonDnon_agony";
						};

						
This is the format that any of your animations should be laid out.

_OriginalClientAnimation is the players animation.
_TargetClientAnimation is the _targets animation.
_AnimationRange is the range you want clients to be able to see the animation.



This example was for 2 animations to be played. What if you only want 1 animation to be played? Simple!


In your client file use the following:


						player switchMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						
						Enigma_switchMove_PVS = [player, 21, Epoch_personalToken];
						publicVariableServer "Enigma_switchMove_PVS";
						_handled = true;


In the server file use the following case format:

						case 21:{_AnimationRange=1000;
						_OriginalClientAnimation= "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
						};


And there you have it!
