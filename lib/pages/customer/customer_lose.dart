import 'package:flutter/material.dart';

class LosePage extends StatelessWidget {
  final String ticketNumber;
  final String drawDate; 

  const LosePage({
    super.key,
    required this.ticketNumber,
    required this.drawDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFCDEBFF),
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        elevation: 0,
        
        iconTheme: const IconThemeData(color: Colors.black54),
      ),
      body: Center(
        child: Padding(
          
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), 
            ),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/Sadness.png', 
                      width: double.infinity,
                      height: 300, 
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 32),

                  
                  Text(
                    ticketNumber,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'ไม่ถูกรางวัล',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 48),

                  
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF59D),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'ย้อนกลับ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
