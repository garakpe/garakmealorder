import 'package:gsheets/gsheets.dart';

class UserSheetsApi {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "garakmealapi",
  "private_key_id": "e5d9ce7facfe57c076144a49c7188f7eeea57057",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCzt2BpO/nGsiii\n9nhpP+Q1GV05P+0azHQQRBy+FujS6IFG2jSb2vCycqxlF4ek2K2mrO3mECeFQwrn\npyXRo41O747YfcMmY1rc7/84pfwoX2vcxe4K/0FdKRhbAMZk8VeY/wKzNOHG3e22\ns+0h/sGwiJIJu7DTqwRlYX6Rb9aVy7xp3YG0vh0owHAFWeEnbVO/qkSLRMSeWfQL\nkNf273YHEqbI8HCJgVfoGB7mM38EqqtEZPjY1lUMsx4gPMoxDIj/9/w3MHHZLurE\nPLSWEFRhzfw0JXQr1W1p6JlYGXalYCAJCn3hF1EUAdhXpr0/4YMtpxC8fvuV2+ac\nSKc+C8dNAgMBAAECggEAIPeEkglUemR4G9zGndgAjtUGStg1MHNM3yb/dsdREk9g\nV5TzjZuOB84NXcYBNfYhdK/IPCm+di2kNHZu85Pi+hXryD7Zq5MSOfE0ijm4lddb\nO/Z7Aj1syiAdvaPYwO+cuA4feqw6tnZDgv5ig5fuA+opj+uENm/qsIY/54HyhSu4\n/5+ltvvkhYpJfoU3GyVyXt85VzfNIX5MnF8HEoraHLXj5nGZf++zggUEQuTgF4Js\nlXv5j98uafT5ArQhkdjlSOlZk7T1RNuthQJLGsTw7gfw89VEu9Zc7o60DsyCX81T\nEUTggsrq3eGln/rU+hEIIjZoKX4voQPk4WhElerkqQKBgQD2q7p3xXoss9SI3MkG\nDLnl/hJePXDmyn1orKkJNgpeSinlWK11Ye3dr4TDq+bWfH903CpdIZeCXQm87Eg1\nnzZ3x+4bftlWNEoO33rmmnprIh2i2/alQhFqjPjjR4Ul5J+MEnwBto3eHueemjXQ\n3aPMmZ+cr+nalGpmbzQAcjoGKwKBgQC6g2S5eKoerWtZPHCKAgfDsXX+nNkDJnPx\n0xhJCNQg5162h1r1q6kKAYo8hfSFhBG+GKlb4PdlVkgAZ+6G5jG8g6mTGeY6OgTg\nphz7/5aDhssS3Xr8twTxQRzMpbZnZ0exa/l45NThdTKukYXFezKiymc6IXxyPTSP\nAwVylB/kZwKBgQDayNZLBUyn+Zi5C5sBUqhP5lpEXBqXmWJCRWJoWRY5K26djVnM\nk193EQagxwenliU2cVDh6bmIVx0cBDbH2L9m3l3C5W+/lgFZz74ia0HJZCkFGjRZ\nv4/TAdZ/QCBIy873Xi2/Fzwdlyu48O5qoyt1fYykXSL+TEVTNa7Z9nagoQKBgFat\no4zSd/Uj0QS6ou5wPR2EBnsad3wQTcfvu5SNhs/31rtrMimD6l4dExpHgrjeBMTc\nfzCU30R4EaQmqOKGbkzWv2L+oVEkD4o7iLLQOCnN5ehRh8uUXraj9Pdid9+cTuQ0\ncs7tQcW5iqE4Pfvl4kVnXQvV7hjFOvzPgaObFSs3AoGAUv8DbNXw5u+LvNYIy6dl\nVNJSLpaXt/l2ueC+OWXRffE3K4Acoxl+1L2g5ZPOGkyW/Gg44ge3qrwOLyWhu0Qk\nRpOvnTCNU3u45yfT4vWd40oNh7XxZGODWJJKsjFVF0SYrHx+ohwF5eW1/i4VEJom\nxbXVllhvWos36Uc23Gcy4FU=\n-----END PRIVATE KEY-----\n",
  "client_email": "garakmealapi@garakmealapi.iam.gserviceaccount.com",
  "client_id": "115121011632844900524",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/garakmealapi%40garakmealapi.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''';
  static final _spreadsheetId = '1wzrDuxVqHwUUHe1l_ozWMtBA0AuhuKGWMQ0WVveTu78';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Worksheet? get userSheet => _userSheet;

static Future init() async {
  final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
  _userSheet = await _getWorkSheet(spreadsheet, title:'sheet1');

  if (_userSheet == null) {
    throw Exception('Worksheet not found');
  }
}

static Future<Worksheet?> _getWorkSheet(
  Spreadsheet spreadsheet, {
  required String title,
}) async {
  return spreadsheet.worksheetByTitle(title);
}


}
