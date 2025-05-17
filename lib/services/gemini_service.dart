import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  //AIzaSyAIjoPycN8hjDNqbTizGwT7WcwRfoLHgx8
  //AIzaSyDwFEkSwh7qD2-5NUsGMUOReDow6xzvxSc
  Future<String> generateText(String prompt) async {
    var model = GenerativeModel(
        model: 'gemini-2.0-flash',
        apiKey: "AIzaSyAIjoPycN8hjDNqbTizGwT7WcwRfoLHgx8",
        generationConfig: GenerationConfig(
          candidateCount: 2,
          stopSequences: ["END"],
          maxOutputTokens: 500,
          temperature: 0.5,
          topK: 1,
          topP: 0.5,
        ));
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    return response.text.toString();
  }
}
