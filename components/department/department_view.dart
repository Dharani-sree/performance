import 'package:flutter/material.dart';
import 'package:machine_performance/common/arc_progress_bar/arc_progress_bar.dart';
import 'package:machine_performance/components/department/department.dart';

class DepartmentPageState extends State<DepartmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body()),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleBar(),
          departmentCard(
            'Department 1',
            76,
            '49505 kgs',
            '78.90%',
            '9.1',
            '20095',
          ),
          departmentCard(
            'Department 2',
            45,
            '49505 kgs',
            '78.90%',
            '9.1',
            '20095',
          ),
        ],
      ),
    );
  }

  Widget titleBar() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Departments',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            'Shift 1',
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget departmentCard(String department, int efficiency, String production,
      String machine, String prodValue, String speed) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                department,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ArcProgressBar(
                            progress: efficiency / 100,
                            strokeWidth: 14,
                            backgroundColor: Colors.grey[300]!,
                            progressColor: Color(0xFF29d799)
                          ),
                          const Text(
                            'Production efficiency',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 140,
                    color: Colors.grey[200],
                    width: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          performanceRow('Production', production),
                          performanceRow('Machine', machine),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: performanceRow('Production', prodValue)),
                    Padding(
                      padding: const EdgeInsets.only(top:8),
                      child: Container(
                        height: 50,
                        color: Colors.grey[200],
                        width: 1,
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: performanceRow('AVG Speed', speed),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

 Widget performanceRow(String title, String value) {
  bool isKgs = value.contains('kgs');
  String mainValue = isKgs ? value.split(' ')[0] : value;
  String unit = isKgs ? ' kgs' : '';

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(top:4),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              children: [
                TextSpan(text: mainValue),
                if (isKgs)
                  TextSpan(
                    text: unit,
                    style: const TextStyle(fontSize: 16), 
                  ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

}
