import 'package:flutter/material.dart';

class CarInstallmentUi extends StatefulWidget {
  const CarInstallmentUi({super.key});

  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    backgroundColor: const Color.fromARGB(255, 18, 174, 28),
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
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        // รูปภาพ
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green, width: 2),
            image: const DecorationImage(
              image: AssetImage('assets/images/car.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ราคารถ
        const Text('ราคารถ (บาท)'),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '0.00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // เงินดาวน์
        const Text('จำนวนเงินดาวน์ (%)'),
        Row(
          children: [10, 20, 30, 40, 50].map((e) {
            return Row(
              children: [
                Radio<int>(
                  value: e,
                  groupValue: 10,
                  onChanged: (value) {},
                ),
                Text('$e'),
              ],
            );
          }).toList(),
        ),

        const SizedBox(height: 8),

        // ระยะเวลาผ่อน
        const Text('ระยะเวลาผ่อน (เดือน)'),
        DropdownButtonFormField(
          value: 24,
          items: [12, 24, 36, 48, 60]
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text('$e เดือน'),
                ),
              )
              .toList(),
          onChanged: (value) {},
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ดอกเบี้ย
        const Text('อัตราดอกเบี้ย (%/ปี)'),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '0.00',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        const SizedBox(height: 20),

        // ปุ่ม
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {},
                child: const Text('คำนวณ'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () {},
                child: const Text('ยกเลิก'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // กล่องผลลัพธ์
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green),
          ),
          child: Column(
            children: const [
              Text(
                'ค่างวดรถต่อเดือนเป็นเงิน',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '0.00',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              Text('บาทต่อเดือน'),
            ],
          ),
        ),
      ],
    ),
  ),
);
} 
}
