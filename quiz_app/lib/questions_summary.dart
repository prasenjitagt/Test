import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((eachData) {
            final Color textColor;

            textColor = eachData['correct_answer'] == eachData['user_answer']
                ? (const Color.fromARGB(255, 40, 204, 182))
                : (const Color.fromARGB(255, 222, 33, 20));

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: textColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(
                      ((eachData['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          eachData['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          eachData['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 40, 204, 182),
                          ),
                        ),
                        Text(
                          eachData['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 222, 33, 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
