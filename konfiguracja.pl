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

backlog(setup, [
	polecenie('Ssid1', SSID1),
	polecenie('Password1', Haslo1),
	polecenie('Ssid2', SSID2),
	polecenie('Password2', Haslo2),
	polecenie('WebPassword', HasloWeb)
]) :-
	ssid_wifi1(SSID1),
	haslo_wifi1(Haslo1),
	ssid_wifi2(SSID2),
	haslo_wifi2(Haslo2),
	haslo_web(HasloWeb).

% MQTT

backlog(setup, [
	polecenie('MqttHost', Host),
	polecenie('MqttUser', Uzytkownik),
	polecenie('MqttPassword', Haslo)
]) :-
	host_mqtt(Host),
	user_mqtt(Uzytkownik),
	haslo_mqtt(Haslo).
% TODO: dorobić jeszcze konfigurację na podstawie panelu WWW

% Timers
polecenie(wlasc, 'Latitude', 52.11). % ustaw współrzędną geograficzną dla Wrocławia
polecenie(wlasc, 'Longitude', 17.022222).