

				diag_log format['HAPPYS SWITCHMOVE SERVERSIDE FUNCTION HAS STARTED',time];

 private["_AnimationRange","_OriginalClientAnimation","_NearByClients","_OriginalClient","_TargetClient","_TargetClientAnimation"];

 _OriginalClient=_this select 0;

 _TargetClient=_this select 3;

 if !([_OriginalClient,_this select 2]call EPOCH_server_getPToken)exitWith{};

 _AnimationRange=0; //All Clients within this range will see the animations --- Customise within each individual case.

 _NearByClients=(getPosATL _OriginalClient)nearEntities[["Epoch_Male_F","Epoch_Female_F"],_AnimationRange];

 _OriginalClientAnimation="";

 switch(_this select 1)do
 {
 //LIST YOUR ANIMATIONS HERE IN THIS FORMAT EACH WITH A NEW CASE NUMBER

case 10:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Stay_CombatPace_Un_Atacker_Grab_Naked_Choke_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Stay_CombatPace_Un_Prey_Grabbed_Naked_Choke_No_Contr";
 };
 case 11:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Grabbed_Legs_Neck_Twist_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Stay_CombatPace_Un_Prey_Grabbed_Legs_Neck_Twist_No_Contr";
 };
 case 12:{_AnimationRange=1000;
 _OriginalClientAnimation="MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Grabbed_Legs_Neck_Twist_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Stay_CombatPace_Un_Prey_Grabbed_Legs_Neck_Twist_No_Contr";
};
 case 13:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Grabbed_OnBack_Naked_Choke_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Prey_Grabbed_OnBack_Naked_Choke_No_Contr";
 };
 case 14:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Grabbed_OnBack_Naked_Choke_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Prey_Grabbed_OnBack_Naked_Choke_No_Contr";
 };
 case 15:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Lying_Neck_Twist_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Prone_CivPace_Un_Prey_Lying_Neck_Twist_No_Contr";
 };
 case 16:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Lying_Neck_Twist_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Prone_CivPace_Un_Prey_Lying_Neck_Twist_No_Contr";
 };
 case 17:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Stay_CombatPace_Un_Atacker_Grab_ByLeftLeg_Neck_Twist_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Prey_Grab_ByLeftLeg_Neck_Twist_No_Contr";
 };
 case 18:{_AnimationRange=1000;
 _OriginalClientAnimation= "MOCAP_Idle_Kneel_CombatPace_Un_Atacker_Lying_Neck_Twist_No_Contr";
 _TargetClientAnimation= "MOCAP_Idle_Prone_CivPace_Un_Prey_Lying_Neck_Twist_No_Contr";
 };
 case 20:{_AnimationRange=1000;
 _OriginalClientAnimation= "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
 _TargetClientAnimation= "AcinPercMstpSnonWnonDnon_agony";
 };
 };


				diag_log format['---------------------- EPOCH SWITCHMOVE SERVERSIDE FUNCTION ---------------------- prey --- targetplayer = %1',_TargetClient];
				diag_log format['---------------------- EPOCH SWITCHMOVE SERVERSIDE FUNCTION ---------------------- player --- target = %1',_OriginalClient];
				diag_log format['---------------------- EPOCH SWITCHMOVE SERVERSIDE FUNCTION ---------------------- _TargetClientAnimation = %1',_TargetClientAnimation];
				diag_log format['---------------------- EPOCH SWITCHMOVE SERVERSIDE FUNCTION ---------------------- _OriginalClientAnimation = %1',_OriginalClientAnimation];


 switch (true) do {

 case (_AnimationRange > 0 && _OriginalClientAnimation !="" && _TargetClientAnimation !="") :  {

				diag_log format['---------------------- HAPPYS SWITCHMOVE SERVERSIDE FUNCTION ---------------------- _NearByClients = %1',_NearByClients];

 {[["switchMove",[_OriginalClient,_OriginalClientAnimation]],(owner _x)]call EPOCH_sendPublicVariableClient;
 }forEach(_NearByClients-[_OriginalClient]);
 {[["switchMove",[_TargetClient,_TargetClientAnimation]],(owner _x)]call EPOCH_sendPublicVariableClient;
 }forEach(_NearByClients-[_OriginalClient]);

				diag_log format['HAPPYS SWITCHMOVE SERVERSIDE FUNCTION HAS BEEN EXECUTED ON BOTH CLIENTS AND MADE VISIBLE TO NEARBY CLIENTS',time];

 case (_AnimationRange > 0 && _OriginalClientAnimation !="") : {

				diag_log format['---------------------- EPOCH SWITCHMOVE SERVERSIDE FUNCTION ---------------------- _NearByClients = %1',_NearByClients];

{[["switchMove",[_OriginalClient,_OriginalClientAnimation]],(owner _x)]call EPOCH_sendPublicVariableClient;
 }forEach(_NearByClients-[_OriginalClient]);

				diag_log format['HAPPYS SWITCHMOVE SERVERSIDE FUNCTION HAS BEEN EXECUTED ON THE EXECUTING CLIENT AND MADE VISIBLE TO NEARBY CLIENTS',time];
 };
 };


				diag_log format['HAPPYS SWITCHMOVE SERVERSIDE FUNCTION HAS FINISHED',time];
