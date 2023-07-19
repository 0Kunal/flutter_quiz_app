import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 600,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: data["user_answer"] == data["correct_answer"]
                      ? Colors.green
                      : Colors.purpleAccent,
                  foregroundColor: Colors.black,
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["question"] as String,
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        data["user_answer"] as String,
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      Text(
                        data["correct_answer"] as String,
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 15)
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
