bool countries = true;
bool capitals = true;
bool continents = true;
bool colloquial = true;
bool official = true;

enum gamemode {singleplayer, two_player}

gamemode? mode = gamemode.two_player;

List nameList1 = [];
List<String> offNames = [];
List nameList2 = [];
List<String> colNames = [];
List<String> capNames = [];

List<String> continentsNames = ["asia", "europe", "north america", "oceania", "antarctica", "south america", "africa"];

List<String> playerMovesResults = [];
int playerResult = 1;
int turnCountResult = 1;
String lastMove = "";

