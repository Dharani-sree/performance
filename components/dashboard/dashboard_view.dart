import 'package:flutter/material.dart';
import 'package:machine_performance/components/dashboard/dashboard.dart';

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: body()),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [titleBar(), performanceCard()],
    );
  }

  Widget titleBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'shift 1',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.grey[200]!, width: 0.5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.person_rounded,
              size: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget performanceCard() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border(
            top: BorderSide(color: Colors.grey[200]!, width: 1),
          left: BorderSide(color: Colors.grey[200]!, width: 1),
          right: BorderSide(color: Colors.grey[200]!, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Overall Performance Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: statusColumn('Machines', '23445'))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.topLeft,
                          child: statusColumn('Percentage', '60%'))),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.topLeft,
                          child: statusColumn('Running Machines', '23445'))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.topLeft,
                          child: statusColumn('Avg speed', '33940 RPM'))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: statusColumn('Avg Torque', '5.5 Mins'))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.topLeft,
                          child: statusColumn('Power Consumed', '16.58%'))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: statusColumn('Energy', '3.3%'))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.topLeft,
                          child: statusColumn('Waste', '2.5%'))),
                ],
              ),
            ),
            const SizedBox(height: 5),
            stepsTable(),
          ],
        ),
      ),
    );
  }

  Widget statusColumn(String title, String value) {
    bool hasRpm = value.contains('RPM');
    bool hasMins = value.contains('Mins');

    String mainValue = value.split(' ')[0];
    String unit = hasRpm
        ? ' RPM'
        : hasMins
            ? ' Mins'
            : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: title == 'Machines' || title == 'Percentage'
                  ? Colors.white
                  : Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                  fontSize: 22,
                  color: title == 'Machines' || title == 'Percentage'
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: mainValue),
                if (hasRpm || hasMins)
                  TextSpan(
                    text: unit,
                    style: const TextStyle(fontSize: 16),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget stepsTable() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(9),
          bottomRight: Radius.circular(9),
        ),
        border: Border(
          top: BorderSide(color: Colors.grey[200]!, width: 1),
          bottom: BorderSide(color: Colors.grey[200]!, width: 1.5),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Table(
        border: TableBorder.all(color: Colors.grey[200]!, width: 1),
        children: [
          tableRow(['', 'LHS', 'RHS', 'Total']),
          tableRow(['Step 1', '27', '67', '94']),
          tableRow(['Step 2', '0', '2', '2']),
          tableRow(['Step 3', '0', '1', '0']),
          tableRow(['Step 4', '8', '6', '14']),
        ],
      ),
    );
  }

  TableRow tableRow(List<String> cells) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            cell,
            style: TextStyle(
                fontSize: 16,
                color: cell == 'LHS' ||
                        cell == 'RHS' ||
                        cell == 'Total' ||
                        cell.contains('Step')
                    ? Colors.grey
                    : Colors.black,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
