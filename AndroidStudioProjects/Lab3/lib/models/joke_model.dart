class Joke{
    final String setup;
    final String punchline;
    final int id;
    bool isFavorite;


    Joke({
      required this.setup,
      required this.punchline,
      required this.id,
      this.isFavorite = false,
    });

    

    factory Joke.fromJson(Map<String, dynamic> json) {
      return Joke(
          setup: json['setup'],
          punchline: json['punchline'],
          id: json['id'],
          isFavorite: json['isFavorite'] ?? false,
      );
    }

}