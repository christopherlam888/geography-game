String toProperCase(String location) {
  List<String> joiners = [" ", "-"];
  for (var i = 0; i < joiners.length; i++) {
    location = location.split(joiners[i]).map((word) => word[0].toUpperCase() + word.substring(1)).join(joiners[i]);
  }
  return location;
}
