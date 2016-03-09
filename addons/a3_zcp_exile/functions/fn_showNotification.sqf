private['_notificationType','_message'];

_notificationType = _this select 0;
_message          = _this select 1;

if(ZCP_CurrentMod == 'Exile') exitWith {

  switch (_notificationType) do {
      case ('Notification'): {
        PV_ZCP_zupastic = _message;
        publicVariable "PV_ZCP_zupastic";
      };
      case ('PersonalNotification'): {
          private['_player'];
          _player = _this select 2;
          PV_ZCP_zupastic = _message;
          owner _player publicVariableClient "PV_ZCP_zupastic";
      };
      case ('Reputation'): {
        _message call ExileServer_system_network_send_to;
      };
      case ('Money'): {
        _message call ExileServer_system_network_send_to;
      };
  };

};

if(ZCP_CurrentMod == 'Epoch') exitWith {
  switch (_notificationType) do {
      case ('Notification'): {
        PV_ZCP_zupastic = _message;
        publicVariable "PV_ZCP_zupastic";
      };
      case ('PersonalNotification'): {
          private['_player'];
          _player = _this select 2;
          PV_ZCP_zupastic = _message;
          owner _player publicVariableClient "PV_ZCP_zupastic";
      };
      case ('Reputation'): {

      };
      case ('Money'): {

      };
  };
};
