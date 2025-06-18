class NetworkPath {

  static const String hostName = "https://reqres.in/api";

}

class EndPoints {
  static const String userEndPOint =
      "${NetworkPath.hostName}/users";
  static String userDetailsEndPOint(int id) =>
      "${NetworkPath.hostName}/users/$id";

}
