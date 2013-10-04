class GiantWarbunny extends SMPNaliRabbit;

function bool SameSpeciesAs(Pawn P)
{
	return ( P.class == class'GiantWarbunny' );
}

function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, vector momentum, class<DamageType> damageType)
{
    local Controller C,MC;
    local BunnyGhostUltimaCharger BunnyUltima;

    C = Level.ControllerList;
    while (C != None)
    {
        if (C.Pawn != None && C.Pawn.IsA('Monster'))
        {
            MC = C;
        }
        C = C.NextController;
    }
    
    BunnyUltima = spawn(class'BunnyGhostUltimaCharger',MC);
    gibbedBy(instigatedBy);
}

defaultproperties
{
     DrawScale=6.000000
     CollisionRadius=50.000000
     CollisionHeight=93.500000
}