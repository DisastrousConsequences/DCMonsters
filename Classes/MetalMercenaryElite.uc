class MetalMercenaryElite extends SMPMercenaryElite;

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
	return ( P.class == class'MetalMercenaryElite' );
}

defaultproperties
{
     ScoringValue=9
     Health=280
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     ControllerClass=Class'DCMonsterController'
}
