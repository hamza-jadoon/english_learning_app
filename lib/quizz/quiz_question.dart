class QuizQuestion {
  final String question;
  final List<String> options;
  final String correctAnswer;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  // Method to check if a given answer is correct
  bool isCorrect(String answer) {
    return answer == correctAnswer;
  }
}

List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    question: "What is the correct form of subject-verb agreement in the sentence: \"The dog ___ (bark) at strangers.\"",
    options: ["A) bark", "B) barks", "C) barking", "D) barked"],
    correctAnswer: "B) barks",
  ),
  QuizQuestion(
    question: "Which of the following is a basic sentence structure?",
    options: ["A) Verb + Subject + Object", "B) Subject + Verb + Object", "C) Object + Verb + Subject", "D) Adjective + Noun + Verb"],
    correctAnswer: "B) Subject + Verb + Object",
  ),
  QuizQuestion(
    question: "Which phrase is commonly used for greeting someone?",
    options: ["A) \"Can you help me?\"", "B) \"What time is it?\"", "C) \"Hello! How are you?\"", "D) \"Where is the restroom?\""],
    correctAnswer: "C) \"Hello! How are you?\"",
  ),
  QuizQuestion(
    question: "What is the appropriate response to: \"My name is John. Nice to meet you!\"?",
    options: ["A) \"I am fine, thank you.\"", "B) \"Nice to meet you too!\"", "C) \"Where are you from?\"", "D) \"I would like to order food.\""],
    correctAnswer: "B) \"Nice to meet you too!\"",
  ),
  QuizQuestion(
    question: "Identify the correct present simple sentence:",
    options: ["A) \"She will go to the store.\"", "B) \"I go to school every day.\"", "C) \"They are playing football.\"", "D) \"He played soccer last week.\""],
    correctAnswer: "B) \"I go to school every day.\"",
  ),
  QuizQuestion(
    question: "Which sentence is in the past simple tense?",
    options: ["A) \"She visits her grandmother.\"", "B) \"They watch a movie.\"", "C) \"I visited Paris last year.\"", "D) \"He is going to the park.\""],
    correctAnswer: "C) \"I visited Paris last year.\"",
  ),
  QuizQuestion(
    question: "How do you express a future action using 'going to'?",
    options: ["A) \"I will travel to London next week.\"", "B) \"I am going to travel to London next week.\"", "C) \"I travel to London next week.\"", "D) \"I traveled to London next week.\""],
    correctAnswer: "B) \"I am going to travel to London next week.\"",
  ),
  QuizQuestion(
    question: "What does the modal verb 'should' express?",
    options: ["A) Ability", "B) Obligation", "C) Possibility", "D) Permission"],
    correctAnswer: "B) Obligation",
  ),
  QuizQuestion(
    question: "In the sentence \"She sings beautifully,\" what part of speech is \"beautifully\"?",
    options: ["A) Noun", "B) Adjective", "C) Verb", "D) Adverb"],
    correctAnswer: "D) Adverb",
  ),
  QuizQuestion(
    question: "Which of the following sentences uses a preposition correctly?",
    options: ["A) \"The cat is under the table.\"", "B) \"She is running quick.\"", "C) \"I will go to store.\"", "D) \"He plays piano.\""],
    correctAnswer: "A) \"The cat is under the table.\"",
  ),
];
