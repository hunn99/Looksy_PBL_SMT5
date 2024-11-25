import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:looksy/presentation/utils/theme.dart';

import 'package:looksy/presentation/widgets/button/card/history_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:looksy/presentation/services/history_services.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // Daftar orderan

  List<Map<String, dynamic>> orders = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      final data = await HistoryServices.getHistory();
      setState(() {
        orders = data;
        orders.sort((a, b) => b['date'].compareTo(a['date']));
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load history: $e')),
      );
    }
  }

  // Fungsi untuk mengubah status menjadi 'Canceled'
  void cancelOrder(int index) async {
    final orderId = orders[index]['id'].toString(); // Pastikan ID tersedia di data order

    try {
      await HistoryServices.cancelOrder(orderId);
      setState(() {
        orders[index]['status'] = 'Canceled';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Order canceled successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to cancel order: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'History',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: neutralTheme,
          toolbarHeight: 80,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : orders.isEmpty
                ? NoOrdersFound()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: orders
                            .asMap()
                            .entries
                            .map(
                              (entry) => Column(
                                children: [
                                  HistoryCard(
                                    services: entry.value['services'],
                                    date: entry.value['date'],
                                    time: entry.value['time'],
                                    price: entry.value['price'],
                                    status: entry.value['status'],
                                    cancelable: entry.value['cancelable'],
                                    onCancel: () => cancelOrder(entry.key),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
      ),
    );
  }
}

class NoOrdersFound extends StatelessWidget {
  const NoOrdersFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconsaxBold.clipboard_text,
                size: 80,
                color: neutralTheme[200]!,
              ),
              const SizedBox(height: 16),
              const Text(
                'No Orders Found',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: neutralTheme,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'There Are No Ongoing Orders At The Moment',
                style: TextStyle(
                  fontSize: 14,
                  color: neutralTheme[300]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}