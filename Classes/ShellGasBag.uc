class ShellGasBag extends GasBag;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'ShellGasBag' );
}

defaultproperties
{
	AirSpeed=530.000000
	Skins(0)=Texture'DCMonsters.Skins.ShellGasBag1'
	Skins(1)=Texture'DCMonsters.Skins.ShellGasBag2'
	AmmunitionClass=Class'ShellGasBagAmmo'
	ControllerClass=Class'DCMonsterController'
}
