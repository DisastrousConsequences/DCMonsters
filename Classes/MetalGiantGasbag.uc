class MetalGiantGasbag extends SMPGiantGasbag;

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
	return ( P.class == class'MetalGiantGasbag' );
}

defaultproperties
{
     MaxChildren=0	// its metal. It can't have children
     ScoringValue=9
     Health=660
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     Skins(1)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     ControllerClass=Class'DCMonsterController'
}
