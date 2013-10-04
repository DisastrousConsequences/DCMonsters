class BioSkaarj extends Skaarj;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'BioSkaarj' );
}

defaultproperties
{
     AmmunitionClass=Class'BioSkaarjAmmo'
     ScoringValue=8
     Health=250
     Skins(0)=FinalBlend'DCMonsters.Skins.BioSkaarjFB'
     ControllerClass=Class'DCMonsterController'
}
