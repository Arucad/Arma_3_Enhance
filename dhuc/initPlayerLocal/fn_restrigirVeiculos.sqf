usuario = (_this select 0);
veiculos = (_this select 1);
playerPermitido = (_this select 2);

// Gatilho que ativa toda vez que adentrar em um objeto (Veiculos em Geral).
usuario addEventHandler [ "GetInMan",{

	// Bloco de codigo para restricao de veiculos
	_dhzTipoPlayer 				= typeOf (_this select 0); 			// Nome Objeto do Player
	_dhzUidPlayer 				= getPlayerUID (_this select 0);	// UID do Player
	_dhzTipoVeiculo 			= typeOf (_this select 2);         	// Nome Objeto do Veiculo
	_dhzPosicaoPlayer 			= _this select 1;                  	// "driver", "gunner", "cargo"
	_dhzPosicaoInternaPlayer 	= _this select 3; 					// [] para piloto(driver) / [0] para (gunner)

	if(_dhzTipoVeiculo in veiculos) then {
		if( (( _dhzPosicaoInternaPlayer isEqualTo [] ) || ( _dhzPosicaoInternaPlayer isEqualTo [0] ))  && (( _dhzPosicaoPlayer isEqualTo "driver" ) || ( _dhzPosicaoPlayer isEqualTo "gunner" )) ) then {
			if !( (_dhzTipoPlayer isEqualTo "B_Pilot_F") || (_dhzUidPlayer in playerPermitido) ) then {
				hint 'Somente Pilotos!';
				moveOut usuario;
			};
		};
	};
}];