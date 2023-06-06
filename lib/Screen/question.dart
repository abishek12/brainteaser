class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

List sample_data = [
  {
    "id": 1,
    "question":
        "Flutter is an open-Source UI software development kit created by......",
    "options": ['Apple', 'Google', 'Microsoft', 'facebook'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter......",
    "options": ['jun 2017', 'july 2017', 'May 2017', 'Aug 2019'],
    "answer_index": 2,
  },
];
