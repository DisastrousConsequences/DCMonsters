class MetalSlith extends SMPSlith;

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
	return ( P.class == class'MetalSlith' );
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     ScoringValue=7
     Health=250
     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     Skins(1)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     ControllerClass=Class'DCMonsterController'
}
