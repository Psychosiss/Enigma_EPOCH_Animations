 private["_animationRange","_originalClientAnimation","_nearByClients","_originalClient","_targetClient","_targetClientAnimation"];

 _originalClient=_this select 0;

 _targetClient=_this select 3;

 if !([_originalClient,_this select 2]call EPOCH_server_getPToken)exitWith{};

 _animationRange=0; //All Clients within this range will see the animations --- Customise within each individual case.



 _originalClientAnimation="";

 switch(_this select 1)do{
 
//LIST YOUR ANIMATIONS BELOW HERE IN THIS FORMAT EACH WITH A NEW CASE NUMBER - THESE ARE ONLY EXAMPLES!


 case 20:{_animationRange=1000;
 _originalClientAnimation= "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
 _targetClientAnimation= "AcinPercMstpSnonWnonDnon_agony";
 };
 
 case 21:{_animationRange=1000;
_originalClientAnimation= "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
};


//DO NOT CHANGE ANYTHING BELOW THIS LINE
 };


 switch (true) do {

 case (_animationRange > 0 && _originalClientAnimation !="" && _targetClientAnimation !="") :  {
 
  _nearByClients=(getPosATL _originalClient)nearEntities[["Epoch_Male_F","Epoch_Female_F"],_animationRange];

 {[["switchMove",[_originalClient,_originalClientAnimation]],(owner _x)]call EPOCH_sendPublicVariableClient;
 }forEach(_nearByClients-[_originalClient]);
 {[["switchMove",[_targetClient,_targetClientAnimation]],(owner _x)]call EPOCH_sendPublicVariableClient;
 }forEach(_nearByClients-[_originalClient]);

				diag_log format['----------------------HAPPYS ENIGMA SWITCHMOVE SERVERSIDE FUNCTION HAS BEEN EXECUTED----------------------',time];
};

 case (_animationRange > 0 && _originalClientAnimation !="") : {
 
   _nearByClients=(getPosATL _originalClient)nearEntities[["Epoch_Male_F","Epoch_Female_F"],_animationRange];

{[["switchMove",[_originalClient,_originalClientAnimation]],(owner _x)]call EPOCH_sendPublicVariableClient;
 }forEach(_nearByClients-[_originalClient]);

				diag_log format['----------------------HAPPYS ENIGMA SWITCHMOVE SERVERSIDE FUNCTION HAS BEEN EXECUTED----------------------',time];
 };
 };

