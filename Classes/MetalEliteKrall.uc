class MetalEliteKrall extends EliteKrall;

function bool CheckReflect( Vector HitLocation, out Vector RefNormal, int Damage )
{
	RefNormal=normal(HitLocation-Location);
	if(Frand()>0.2)
		return true;
	else
		return false;
}

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'MetalEliteKrall' );
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     Skins(1)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     ScoringValue=4
     Health=140
     ControllerClass=Class'DCMonsterController'
}
