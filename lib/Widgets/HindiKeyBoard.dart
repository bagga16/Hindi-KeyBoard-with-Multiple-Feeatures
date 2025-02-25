import 'package:flutter/material.dart';

class HindiKeyboard extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Function() onDelete;

  HindiKeyboard({required this.onKeyPressed, required this.onDelete});

  final List<String> keys = [
    'क',
    'ख',
    'ग',
    'घ',
    'ङ',
    'च',
    'छ',
    'ज',
    'झ',
    'ञ',
    'ट',
    'ठ',
    'ड',
    'ढ',
    'ण',
    'त',
    'थ',
    'द',
    'ध',
    'न',
    'प',
    'फ',
    'ब',
    'भ',
    'म',
    'य',
    'र',
    'ल',
    'व',
    'श',
    'ष',
    'स',
    'ह',
    '़',
    'ऽ',
    'ा',
    'ि',
    'ी',
    'ु',
    'ू',
    'ृ',
    'े',
    'ै',
    'ो',
    'ौ',
    '्',
    'ं',
    'ः',
    'ँ'
  ];

  @override
  Widget build(BuildContext context) {
    double keyboardHeight = MediaQuery.of(context).size.height * 0.34;
    double keySize = MediaQuery.of(context).size.width * 0.08;

    return Container(
      height: keyboardHeight,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9, // Number of keys per row
                childAspectRatio: 1.1, // Adjust button size
              ),
              itemCount: keys.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onKeyPressed(keys[index]),
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        keys[index],
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              // Space Button
              GestureDetector(
                onTap: () => onKeyPressed(" "),
                child: Container(
                  width: 180,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 2)
                    ],
                  ),
                  child: Center(
                    child: Text("Space",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Spacer(),
              // Delete Button
              GestureDetector(
                onTap: onDelete,
                child: Container(
                  width: 50,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 2)
                    ],
                  ),
                  child: Center(
                    child: Icon(Icons.backspace, color: Colors.white, size: 26),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
