class MetalWarLord extends WarLord;

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
	return ( P.class == class'MetalWarlord' );
}

defaultproperties
{
     GibGroupClass=Class'XEffects.xBotGibGroup'
     Health=550
     ScoringValue=11
     Skins(0)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     Skins(1)=FinalBlend'SatoreMonsterPackv120.SMPMetalSkaarj.MetalSkinFinal'
     ControllerClass=Class'DCMonsterController'
}
