class MetalManta extends Manta;

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
	return ( P.class == class'MetalManta' );
}

defaultproperties
{
     Health=170
     ScoringValue=3
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     Skins(1)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     Mass=300.000000
     ControllerClass=Class'DCMonsterController'
}
