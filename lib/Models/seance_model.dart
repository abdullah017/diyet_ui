class Seance {
  final String month;
  final String seance;
  final String price;
  Seance({this.price, this.month, this.seance});
}

List<Seance> seanceList = [
  Seance(
    month: "1 Ay",
    price: "250",
    seance: "1 Seans",
  ),
  Seance(
    month: "1 Ay",
    price: "600",
    seance: "4 Seans",
  ),
  Seance(
    month: "2 Ay",
    price: "1100",
    seance: "8 Seans",
  ),
  Seance(
    month: "3 Ay",
    price: "1500",
    seance: "12 Seans",
  ),
];
