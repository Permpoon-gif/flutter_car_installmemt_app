import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  final NumberFormat numberFormat = NumberFormat("#,##0.00");

  final TextEditingController priceController = TextEditingController();
  final TextEditingController interestController = TextEditingController();

  int downPaymentPercent = 10;
  int installmentMonth = 24;

  double monthlyPayment = 0.00;

  void calculate() {
    if (priceController.text.isEmpty || interestController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกราคารถ และอัตราดอกเบี้ย'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double price = double.parse(priceController.text);
    double interestRate = double.parse(interestController.text);

    // สูตรคำนวณ
    double loanAmount = price - (price * downPaymentPercent / 100);

    double totalInterest =
        (loanAmount * interestRate / 100) * (installmentMonth / 12);

    double result = (loanAmount + totalInterest) / installmentMonth;

    setState(() {
      monthlyPayment = result;
    });
  }

  void reset() {
    setState(() {
      priceController.clear();
      interestController.clear();
      downPaymentPercent = 10;
      installmentMonth = 24;
      monthlyPayment = 0.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 18, 75, 174),
        centerTitle: true,
        title: const Text(
          'CI Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            const Text(
              'คำนวณค่างวดรถ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 17, 131, 146),
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/car 1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text('ราคารถ (บาท)'),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '0.00',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text('จำนวนเงินดาวน์ (%)'),
            Wrap(
              children: [10, 20, 30, 40, 50].map((e) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<int>(
                      value: e,
                      groupValue: downPaymentPercent,
                      onChanged: (value) {
                        setState(() {
                          downPaymentPercent = value!;
                        });
                      },
                    ),
                    Text('$e%'),
                  ],
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            const Text('ระยะเวลาผ่อน (เดือน)'),
            DropdownButtonFormField<int>(
              value: installmentMonth,
              items: [24, 36, 48, 60, 72]
                  .map(
                    (e) => DropdownMenuItem(value: e, child: Text('$e เดือน')),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  installmentMonth = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Text('อัตราดอกเบี้ย (%/ปี)'),
            TextField(
              controller: interestController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '0.00',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 20),

Row(
  children: [
    Expanded(
      child: SizedBox(
        height: 70,
        width: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 20, 228, 235),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4), // สี่เหลี่ยมคม
              side: const BorderSide(
                color: Color.fromARGB(255, 47, 217, 255),
                width: 2,
              ),
            ),
          ),
          onPressed: calculate,
          child: const Text(
            'คำนวณ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),

    const SizedBox(width: 12),

    Expanded(
      child: SizedBox(
        height: 70,
        width: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 8, 0, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(
                color: Color.fromARGB(255, 87, 247, 255),
                width: 2,
              ),
            ),
          ),
          onPressed: reset,
          child: const Text(
            'ยกเลิก',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  ],
),


            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 184, 240, 245),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 99, 227, 234),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'ค่างวดรถต่อเดือนเป็นเงิน',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    numberFormat.format(monthlyPayment),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),

                  const Text('บาทต่อเดือน'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
