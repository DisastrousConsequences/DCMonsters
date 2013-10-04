class Princess extends SMPQueen;

//Princess can't spawn pupae
function SpawnChildren() {}

//No shield?
//function SpawnShield() {}

//No teleport?
//function Teleport() {}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'Princess' );
}

defaultproperties
{
     ControllerClass=Class'DCMonsterController'
}