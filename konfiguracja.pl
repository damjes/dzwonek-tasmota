:- multifile polecenie/3, backlog/2.
:- [sekrety].

% Control
polecenie(wlasc, 'BlinkCount', 1). % dzwoń jeden raz (gdy Power 3)
polecenie(wlasc, 'BlinkTime', 50). % dzwoń 5 sekund (50*0.1)
polecenie(wlasc, 'PowerOnState', 0). % żeby nie dzwonił po włączeniu zasilania

% Management
polecenie(wlasc, 'DeviceName', 'dzwonek'). % ustaw nazwę urządzenia
polecenie(wlasc, 'FriendlyName', 'Dzwonek'). % ustaw nazwę urządzenia
polecenie(wlasc, 'MqttLog', 2). % ustaw tryb logowania po MQTT
polecenie(wlasc, 'NtpServer1', 'tempus1.gum.gov.pl'). % ustaw serwer NTP
polecenie(wlasc, 'NtpServer2', 'tempus2.gum.gov.pl').
polecenie(wlasc, 'NtpServer3', 'pool.ntp.org').
polecenie(wlasc, 'OtaUrl', 'http://ota.tasmota.com/tasmota/release/tasmota-PL.bin.gz'). % skąd pobrać firmware przy OTA
polecenie(reset, 'Restart', 1). % zapisz zmiany i resetuj urządzenie
polecenie(post, 'Time', 0). % używaj NTP
% za https://pro-it.rocks/tasmota-prawidlowe-ustawienie-strefy-czasowej/ :
polecenie(wlasc, 'TimeDST', '0,4,3,1,3,120'). % używaj czasu letniego od:
	% 0 - półkula północna
	% 4 - ostatni dzień tygodnia
	% 3 - miesiąc (marzec)
	% 1 - dzień tygodnia (niedziela, 7=sobota)
	% 3 - godzina
	% 120 - przesuniecie (w czasie letnim mamy UTC+2h)')
polecenie(wlasc, 'TimeSTD', '0,4,10,1,3,60'). % ustaw też czas zimowy
polecenie(wlasc, 'TimeZone', 99). % używaj DST i STD (Timezone od -13 do 13 ustawiaja standardowy czas dla danego GMT/UTC)

% Wi-Fi
polecenie(setup, 'Ssid1', SSID) :-
	ssid_wifi1(SSID). % ustaw nazwę pierwszej sieci
polecenie(setup, 'Password1', Haslo) :-
	haslo_wifi1(Haslo). % ustaw hasło pierwszej sieci
polecenie(setup, 'Ssid2', SSID) :-
	ssid_wifi2(SSID). % ustaw nazwę drugiej sieci
polecenie(setup, 'Password2', Haslo) :-
	haslo_wifi2(Haslo). % ustaw hasło drugiej sieci
polecenie(setup, 'WebPassword', Haslo) :-
	haslo_web(Haslo). % ustaw hasło dla panelu WWW

% MQTT
polecenie(setup, 'MqttHost', Host) :-
	host_mqtt(Host). % ustaw host MQTT
polecenie(setup, 'MqttUser', Uzytkownik) :-
	user_mqtt(Uzytkownik). % ustaw użytkownika MQTT
polecenie(setup, 'MqttPassword', Haslo) :-
	haslo_mqtt(Haslo). % ustaw hasło MQTT
% TODO: dorobić jeszcze konfigurację na podstawie panelu WWW

% Timers
polecenie(wlasc, 'Latitude', 52.11). % ustaw współrzędną geograficzną dla Wrocławia
polecenie(wlasc, 'Longitude', 17.022222).